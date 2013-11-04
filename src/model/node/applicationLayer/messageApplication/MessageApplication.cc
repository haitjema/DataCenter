//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include <fstream>
#include <queue>
#include "DCCommon.h"
#include "node_id.h"
#include "FatTreeNode.h"
#include "MessageApplication.h"
#include "AppMessage.h"
#include "DCUtilities.h"

#include "TrafficPattern.h"
#include "TP_PairedPermutation.h"
#include "TP_PairedPodPermutation.h"
#include "TP_LBDestImbalance.h"
#include "TP_AllToAll.h"
#include "TP_AllToAllPartition.h"
#include "TP_AllToAllVictimTenant.h"

Define_Module(MessageApplication);

//#define MALICIOUS_TENANT_LOAD_1

enum PKT_PAYLOAD_SIZE {
    MIN_PAYLOAD = -1,
    MAX_PAYLOAD = -2,
    UNIFORM_RND_PAYLOAD = -3,
    ALTERNATING_MAX_MIN = -4,
    POISSON_RND_PAYLOAD = -5 // with average size pkts
};

MessageApplication::MessageApplication() : nextMessageArrival(NULL), sendNextSegmentEvent(NULL)
{
    
}

void MessageApplication::initialize(int stage)
{  
    // Use two-stage initialization so that one instance of an object can create
    // the script (if needed) and then all instances can read it during the second stage.
    if (stage == 0) {
        LOG(DEBUG) << endl;

        ModuleWithControlPort::initialize();

        const char *script = par("messageScript");
        // Server with address 0 will create the script if it doesn't exist
        if (node_id_.getAddress() == 0 && !scriptExists(script)) {
            AppMessageVector messages = createTrafficPattern(par("scriptGenType"));
            writeScript(messages, script);
            while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
        }
    } else {
        const char *script = par("messageScript");
        to_lower_layer_ = gate("lower_layer$o"); from_lower_layer_ = gate("lower_layer$i");
        maxSendRate_ = par("maxSendRate").doubleValue();
        payloadSize_ = par("payloadSize").longValue();
        randomInterArrival_ = par("randomInterArrival").boolValue();
        burstyInjectRate_ = par("burstyInjectionRate");
        avgBurstLen_ = par("avgBurstLength").doubleValue();
        avgTimeBetweenBursts_ = par("avgTimeBetweenBursts").doubleValue();
        sendTimeLimit_ = par("sendTimeLimit").doubleValue();
        limitStatsToEveryPServers = par("limitStatsToEveryPServers").longValue();
        linkRate_ = getLinkRate();
        WATCH(maxSendRate_);
        parseScript(script);

        nextMessageArrival = new cMessage;
        sendNextSegmentEvent = new cMessage;
        txPktToHostSignal = registerSignal("txPktToHost");
        recordStreamStatistics_ = par("recordStreamStatistics");
        useHardcodedStreamStatistics_ = par("useHardcodedStreamStatistics");

        // Schedule event to make the next appMessage from scheduledMessages active
        if (scheduledMessages.size()) { scheduleAt((scheduledMessages.back())->startTime, nextMessageArrival); }
    }
}

bool MessageApplication::scriptExists(const char *script)
{
    std::ifstream scriptFile(script);
    return scriptFile.good();
}

AppMessageVector MessageApplication::createTrafficPattern(const char *type)
{
    TrafficPattern* trafficPattern = NULL;
    if (!strcmp(type, "PairedPermutationTraffic")) {
        trafficPattern = new TP_PairedPermutation();
    } else if (!strcmp(type, "PairedPodTraffic")) {
        trafficPattern = new TP_PairedPodPermutation();
    } else if (!strcmp(type, "LBDestImbalance")) {
        trafficPattern = new TP_LBDestImbalance();
    } else if (!strcmp(type, "AllToAll")) {
        trafficPattern = new TP_AllToAll();
    } else if (!strcmp(type, "AllToAllPartition")) {
        trafficPattern = new TP_AllToAllPartition();
    } else if (!strcmp(type, "AllToAllVictim")) {
        trafficPattern = new TP_AllToAllVictimTenant();
    } else {
        opp_error("Unknown traffic pattern: '%s'", type);
    }
    uint partitionSize = par("partitionSize");
    double messageSize = par("messageSize");
    if (!strcmp(type, "AllToAllPartition") || !strcmp(type, "AllToAllVictimTenant")) {
        ((TP_AllToAllPartition*)trafficPattern)->setPartitionSize(partitionSize);
    }
    #define DEF_MAX_START (10.0/(1000*1000)) // 10 microseconds
    double max_time= DEF_MAX_START;
    AppMessageVector messages = trafficPattern->createTraffic(node_id_, messageSize);
    delete trafficPattern;
    if (par("randomStartTimes").boolValue()) {
        for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
            simtime_t rndTime(dblrand()*max_time);
            (*i)->startTime = rndTime;
        }
    }
    return messages;
}

void MessageApplication::writeScript(const AppMessageVector &messages, const char *script)
{
    // Create the directory tree if the file's path doesn't exist.
    if (!dirExists(fullPath(script).c_str())) createDirectories(fullPath(script).c_str());
    std::ofstream scriptFile;
    scriptFile.open(script);
    scriptFile << "# Script: " << script << endl;
    time_t rawtime; struct tm * timeinfo;
    time ( &rawtime ); timeinfo = localtime ( &rawtime );
    scriptFile << "# Generated at time: " << asctime(timeinfo); // For some reason asctime adds a new line so no endl needed
    scriptFile << "# Number of servers = " << node_id_.getNumberOfServers() << ", levels = "
                    << node_id_.getDepth() << ", paths = " << node_id_.getNumberOfPaths() << endl;
    scriptFile << "# Message format is as follows:" << endl;
    scriptFile << "# <source>;<destination>;<messageNum>;<startTime>;<messageSize>;<messageRate>" << endl;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        scriptFile << (*i)->source << "; " << (*i)->destination << "; "
                       << (*i)->messageNum << "; "<< (*i)->startTime << " s; "
                       << (*i)->messageSize << " bytes; " << (*i)->messageRate << " bps" << endl;
    }
    scriptFile.close();
}

void MessageApplication::parseScript(const char *script)
{
    LOG(DEBUG) << "Parsing script " << script << endl;
    std::string line; long lineNum = 0;
    std::ifstream scriptFile(script);
    if (scriptFile.is_open())
    {
        while ( scriptFile.good() )
        {
            AppMessage msg;
            const char *token; cDynamicExpression expression; cNEDValue value;
            std::getline(scriptFile, line); lineNum++;

            // expect line to be: <send time><time unit>; <size><byte units>
            if (!line.compare(0, 1, "#")) continue; // Ignore comment lines
            if ( line.find_first_not_of(" \t\v\r\n") ) continue; // Ignore blank lines
            cStringTokenizer tokenizer(line.c_str(), ";"); // Parse with ; as the delimeter

            // parse source
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: source is expected on %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.source = value.longValue();
            if (msg.source != address_) continue; // Ignore messages belonging to other servers

            // parse destination
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: destination is expected on %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.destination = value.longValue();

            // parse messageNum
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: messageNum is expected on %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.messageNum = value.longValue();

            // parse startTime
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: start time expected on line %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.startTime = value.doubleValueInUnit("s");

            // parse messageSize
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: message size is expected on line %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.messageSize = (ulong)value.doubleValueInUnit("bytes");

            // parse messageRate
            if (tokenizer.hasMoreTokens()) {
                token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
                msg.messageRate = value.doubleValueInUnit("bps");
            } else {
                //opp_error("syntax error in script: message rate is expected on line %u", lineNum);
                msg.messageRate = 0; // If not specified, default is no limit
            }

            // add messages to list of scheduled messages
            AppMessage *newMsg = new AppMessage; *newMsg = msg;
            scheduledMessages.push_back(newMsg);
        }

        // sort the scheduled messages by start time
        std::sort(scheduledMessages.begin(), scheduledMessages.end(), sortByStartTime);

    } else {
        opp_error("Couldn't open script file '%s'", script);
    }
}

double MessageApplication::getLinkRate()
{
    // Determine the Server's link rate
    cModule *server = getParentModule();
    while ( (server->getProperties()->get("server") == NULL) && (server != NULL) ) { server = server->getParentModule(); }
    if (server == NULL) { opp_error("Could not find reference to Server!"); }

    cGate * port = server->gate("port$o"); // will throw error if it doesn't exist
    return port->getTransmissionChannel()->getNominalDatarate();
}

void MessageApplication::handleMessage(cMessage *msg)
{
    // The start time of a new appMessage has arrived
    if (msg == nextMessageArrival) {

        // Get the AppMessage to activate
        AppMessage *appMsg = scheduledMessages.back(); scheduledMessages.pop_back();

        activateMessage(appMsg);

        // Determine when to activate the next message
        if (scheduledMessages.size()) { scheduleAt((scheduledMessages.back())->startTime, nextMessageArrival); }

    } else if (msg == sendNextSegmentEvent) {

        // XXX Disabled right now
        opp_error("Received sendNextSegmentEvent");

        sendNextSegment();

        scheduleNextSendEvent();

    } else if (msg->isPacket()) {
        if (msg->getArrivalGate() == from_lower_layer_) {
            DCN_UDPPacket *messageSegment = check_and_cast<DCN_UDPPacket*>(msg);
            receiveSegment(messageSegment);
        } else {
            opp_error("Unknown message type!");
        }
        delete msg; msg=NULL; return;
    } else {
        ModuleWithControlPort::handleMessage(msg);
    }
}

void MessageApplication::handleControlMessage(ControlMessage *cmsg)
{
    LOG(WARN) << "Received an unexpected control message! " << cmsg << endl;
    delete cmsg; cmsg = NULL;
}

void MessageApplication::scheduleNextSendEvent() // XXX Currently disabled
{
    opp_error("ScheduleNextSendEvent() called");
    if (!activeMessages.length()) {
        LOG(DEBUG) << "No active messages. sendNextSegment not scheduled." << endl;
        return;
    }
    ActiveMessage *nextMsg = check_and_cast<ActiveMessage *>(activeMessages.front());
    if (sendNextSegmentEvent->isScheduled()) {
        if (nextMsg->getNextSendTime() != sendNextSegmentEvent->getArrivalTime()) {
            cancelEvent(sendNextSegmentEvent);
        } else {
            return;
        }
    }
    simtime_t nextSendTime = nextMsg->getNextSendTime();
    if (sendTimeLimit_) {
        if (nextSendTime >= sendTimeLimit_) {
            LOG(DEBUG) << "sendTimeLimit reached! Not sending segment for " << nextMsg << endl;
            return;
        }
    }
    scheduleAt(nextMsg->getNextSendTime(), sendNextSegmentEvent);
}

void MessageApplication::activateMessage(AppMessage *appMsg)
{
    LOG(DEBUG) << appMsg << endl;
    if (!appMsg->messageSize) {
        LOG(DEBUG) << "Message has no size. It will be deleted." << appMsg << endl;
        delete appMsg; appMsg = NULL;
        return;
    }
    cModuleType *moduleType = cModuleType::get("datacenter.model.node.applicationLayer.messageApplication.ActiveMessage");
    ActiveMessage *actMsg = check_and_cast<ActiveMessage*>(moduleType->createScheduleInit(NULL, this));
    actMsg->setAppMsg(appMsg);
    // Defaults... in the future we may let messages set these on their own
    actMsg->setRandomInterArrival(randomInterArrival_);
    actMsg->setBurstyInjectionRate(burstyInjectRate_);
    actMsg->setAvgBurstLen(avgBurstLen_);
    actMsg->setAvgTimeBetweenBursts(avgTimeBetweenBursts_);
    actMsg->setAvgPayloadSize(getAvgPayload());
    activateSendStream(appMsg->destination);
    activeMessages.insert(actMsg);
    updateSendRates();
}

void MessageApplication::activateSendStream(uint otherServer)
{
    // Create a new stream entry to record bytes sent/received to/from the
    // given server if no stream for the destination exists.

    // Only collect stats for every pth server (if specified)
    if (!IS_PTH_SERVER(otherServer)) { return; }

    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    SendStreamMap::iterator it = sendingStreams.find(otherServer);
    if (it == sendingStreams.end()) {
        std::stringstream streamName; streamName << "stream_" << address_ << "->" << otherServer;
        cModuleType *moduleType = cModuleType::get("datacenter.model.common.SendStream");
        LOG(DEBUG) << "Allocated new send stream " << streamName.str() << endl;
        sendingStreams[otherServer] = check_and_cast<SendStream*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        sendingStreams[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
        WATCH_PTR(sendingStreams[otherServer]);
    }
}

void MessageApplication::activateReceiveStream(uint otherServer)
{
    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    ReceiveStreamMap::iterator it = receivingStreams.find(otherServer);
    if (it == receivingStreams.end()) {
        std::stringstream streamName; streamName << "stream_" << otherServer << "->" << address_;
        cModuleType *moduleType = cModuleType::get("datacenter.model.common.ReceiveStream");
        LOG(DEBUG) << "Allocated new receive stream " << streamName.str() << endl;
        receivingStreams[otherServer] = check_and_cast<ReceiveStream*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        receivingStreams[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
        WATCH_PTR(receivingStreams[otherServer]);
    }
}

void MessageApplication::updateSendRates()
{
    double aggregateRate = 0;
    double scaleFactor = 1;
    for (cQueue::Iterator qiter(activeMessages); !qiter.end(); qiter++) {
        ActiveMessage *msg = check_and_cast<ActiveMessage *>(qiter());
        if (!msg->getDesiredRate()) {
            msg->setAllowedRate(maxSendRate_);
        } else {
            msg->setAllowedRate(msg->getDesiredRate());
        }
        aggregateRate += msg->getAllowedRate();
    }
    // If the sum of the rates on all messages exceeds maxSendRate, scale the rates to match the maxSendRate
    if ((maxSendRate_) && (aggregateRate > maxSendRate_)) { scaleFactor = aggregateRate/maxSendRate_; }
    for (cQueue::Iterator qiter(activeMessages); !qiter.end(); qiter++) {
       ActiveMessage *msg = check_and_cast<ActiveMessage *>(qiter());
       msg->setAllowedRate(msg->getAllowedRate()/scaleFactor);
    }
}

double MessageApplication::getAvgPayload()
{
    switch (payloadSize_)
    {
        case MIN_PAYLOAD:
            return 0;
        case MAX_PAYLOAD:
            return MAX_UDP_PAYLOAD;
        case UNIFORM_RND_PAYLOAD:
            return MAX_UDP_PAYLOAD/2.0;
        case ALTERNATING_MAX_MIN:
            return MAX_UDP_PAYLOAD/2.0;
        case POISSON_RND_PAYLOAD:
            return MAX_UDP_PAYLOAD/2.0;
        default:
            return payloadSize_;
    }
}

long MessageApplication::getPktPayload()
{
    switch (payloadSize_)
    {
        case MIN_PAYLOAD:
            return 0;
        case MAX_PAYLOAD:
            return MAX_UDP_PAYLOAD;
        case UNIFORM_RND_PAYLOAD:
            return (long)uniform(0, MAX_UDP_PAYLOAD);
        case ALTERNATING_MAX_MIN:
            // Alternate between maximum and minimum payload sizes
            if (alt_max_min_ == 0) {
                alt_max_min_ = 1;
                return MAX_UDP_PAYLOAD;
            } else {
                alt_max_min_ = 0;
                return 0;
            }
        case POISSON_RND_PAYLOAD:
            return (long)poisson(MAX_UDP_PAYLOAD/2.0);
        default:
            return payloadSize_;
    }
}

void MessageApplication::sendNextSegment(ActiveMessage *actMsg)
{
    Enter_Method_Silent();
    //ActiveMessage *actMsg = (ActiveMessage *)msg->getContextPointer();
    DCN_UDPPacket *messageSegment = new DCN_UDPPacket;
    messageSegment->setPayloadLengthBytes(getPktPayload());
    actMsg->getNextSegment(messageSegment);
    messageSegment->setTimestamp();
    updateSendStats(messageSegment);
    send(messageSegment, to_lower_layer_);
    if (actMsg->isFinished()) {
        if (!activeMessages.remove(actMsg)) { opp_error("actMsg was not in the queue!"); }
        LOG(DEBUG) << "Finished sending " << actMsg << endl;
        actMsg->deleteModule();
        updateSendRates();
    }
}

void MessageApplication::sendNextSegment() // XXX Currently disabled
{
    opp_error("sendNextSegment() called");
    ActiveMessage *actMsg = check_and_cast<ActiveMessage *>(activeMessages.front()); activeMessages.pop();
    LOG(DEBUG) << actMsg << endl;

    // if (actMsg->getNextSendTime() != simTime()) { opp_error("nextSendTime != simTime()"); } // Sanity check
#ifdef ERROR_CHECKING
    ASSERT(actMsg->getNextSendTime() == simTime());
#endif

    DCN_UDPPacket *messageSegment = new DCN_UDPPacket;
    // Give the segment a default size, the messgae can change it...

    messageSegment->setPayloadLengthBytes(getPktPayload());
    actMsg->getNextSegment(messageSegment);
    messageSegment->setTimestamp();

    send(messageSegment, to_lower_layer_);
    //if (recordStreamStatistics_ && IS_PTH_SERVER(messageSegment->getDestAddr())) { sendingStreams[messageSegment->getDestAddr()]->record(messageSegment); }
    updateSendStats(messageSegment);

    if (!actMsg->isFinished()) {
        ActiveMessage *atFront;
        if (activeMessages.front() == NULL) {
            LOG(DEBUG) << "No message at front of queue." << endl;
        } else {
            atFront = (ActiveMessage *)activeMessages.front();
            LOG(DEBUG) << "Before insert, msg at front is " << atFront << endl;
        }
        activeMessages.insert(actMsg);
        atFront = (ActiveMessage *)activeMessages.front();
        LOG(DEBUG) << "After insert, msg at front is " << atFront << endl;

    } else {
        LOG(DEBUG) << "Finished sending " << actMsg << endl;
        updateSendRates();
        actMsg->deleteModule();
        //delete actMsg;
    }
}

void MessageApplication::receiveSegment(DCN_UDPPacket *messageSegment)
{
    LOG(DEBUG) << "Received message segment from " << messageSegment->getSrcAddr() << endl;
    updateReceiveStats(messageSegment);
}

void MessageApplication::updateSendStats(DCN_UDPPacket *messageSegment)
{
    if (recordStreamStatistics_ && IS_PTH_SERVER(messageSegment->getDestAddr())) {
        sendingStreams[messageSegment->getDestAddr()]->record(messageSegment);
    }
}

void MessageApplication::updateReceiveStats(DCN_UDPPacket *messageSegment)
{
    // Record bytes received in the statistics
    if (IS_PTH_SERVER(address_)) {
        activateReceiveStream(messageSegment->getSrcAddr());
        if (recordStreamStatistics_) { receivingStreams[messageSegment->getSrcAddr()]->record(messageSegment); }
    }
}

void MessageApplication::finish()
{
}

MessageApplication::~MessageApplication()
{
    cancelAndDelete(nextMessageArrival);
    cancelAndDelete(sendNextSegmentEvent);
    while (!scheduledMessages.empty()) {
        AppMessage *appMsg = scheduledMessages.back(); scheduledMessages.pop_back();
        delete appMsg; appMsg = NULL;
    }
    while (!activeMessages.empty()) {
        ActiveMessage *actMsg = check_and_cast<ActiveMessage *>(activeMessages.pop());
        actMsg->deleteModule(); actMsg = NULL;
    }
    activeMessages.clear();
    for (SendStreamMap::iterator it=sendingStreams.begin() ; it != sendingStreams.end(); it++ ) { it->second->deleteModule(); }
    sendingStreams.clear();
    for (ReceiveStreamMap::iterator it=receivingStreams.begin() ; it != receivingStreams.end(); it++ ) { it->second->deleteModule(); }
    receivingStreams.clear();
}
