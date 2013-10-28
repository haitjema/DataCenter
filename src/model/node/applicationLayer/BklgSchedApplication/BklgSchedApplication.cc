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
#include "DCCommon.h"
#include "BklgSchedApplication.h"
#include "DCUtilities.h"

Define_Module(BklgSchedApplication);

BklgSchedApplication::BklgSchedApplication()
{

}

void BklgSchedApplication::initialize(int stage)
{
    MessageApplication::initialize(stage);
    if (stage == 0) {
        curMsg = NULL; // XXX
        emitIntvlStatsEvent_ = NULL;
        finishTimeSignal = registerSignal("finishTime");
        std::ifstream my_file(par("messageScript"));
        if (!my_file.good()) opp_error("Script file doesn't exist");
    } else {
        // Initialize
        AllocateBacklogStats();
        if (address_ == 0) {
            // Have the first server listen to find out when everybody is finished
            simulation.getSystemModule()->subscribe("finishTime", this);
            leftToFinish_ = node_id_.getNumberOfServers();
        }
        simulation.getSystemModule()->subscribe("dropPkt", this);
        check_finished(); // In case the server has no backlog to send/receive
        // If emitting statistics on periodic intervals via a global signal sent from
        // the first instance (address 0) of this module...
        statsInterval = par("StatisticsInterval");
        if (address_ == 0 && statsInterval > 0) {
            intvlStatsSignal = registerSignal("EmitStats");
            emitIntvlStatsEvent_ = new cMessage("EmitIntervalStats");
            scheduleAt(simTime(), emitIntvlStatsEvent_);
        }
    }
}

void BklgSchedApplication::parseScript(const char *script)
{
    // Parse the script twice....
    MessageApplication::parseScript(script); // once for messages I send
    // and once more for messages I expect to receive:

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

            // parse destination
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: destination is expected on %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.destination = value.longValue();
            if (msg.destination != address_) continue; // Ignore messages not destined for me

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
            msg.messageSize = value.doubleValueInUnit("bytes");

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
            msgsToReceive.push_back(newMsg);
        }

        // sort the scheduled messages by start time
        std::sort(msgsToReceive.begin(), msgsToReceive.end(), sortByStartTime);

    } else {
        opp_error("Couldn't open script file %s", script);
    }
}

void BklgSchedApplication::handleMessage(cMessage *msg)
{
    curMsg = msg; // XXX
    if (msg == emitIntvlStatsEvent_) {
        long dummyValue = 1; // Doesn't matter what the value we pass is
        emit(intvlStatsSignal, dummyValue);
        if (address_ == 0 && leftToFinish_ == 0) {
            // End the simulation if and all servers have finished
            // and we have recorded stats for the complete last interval
            //delete msg; emitIntvlStatsEvent_ = NULL;
            curMsg = NULL;
            endSimulation();
        }
        scheduleAt(simTime() + statsInterval, emitIntvlStatsEvent_);
    }
    MessageApplication::handleMessage(msg);
    curMsg = NULL;
}

void BklgSchedApplication::AllocateBacklogStats()
{
    AppMessageVector::iterator it;
    for (it = scheduledMessages.begin(); it != scheduledMessages.end(); it++) {
        uint otherServer = (*it)->destination;
        if (sndBklg.find(otherServer) == sndBklg.end()) {
            std::stringstream streamName; streamName << "backlog_" << address_ << "->" << otherServer;
            cModuleType *moduleType = cModuleType::get("datacenter.model.node.applicationLayer.bklgSchedApplication.SendBacklog");
            LOG(DEBUG) << "Allocated new send backlog " << streamName.str() << endl;
            sndBklg[otherServer] = check_and_cast<SendBacklog*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
            sndBklg[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
            //sndBklg[otherServer]->msgCurSnd_ = *(*it); // a copy of the first message to send to otherServer
            WATCH_PTR(sndBklg[otherServer]);
        }
        sndBklg[otherServer]->toSndBytes_ += (*it)->messageSize;
    }
    for (it = msgsToReceive.begin(); it != msgsToReceive.end(); it++) {
        uint otherServer = (*it)->source;
        if (rcvBklg.find(otherServer) == rcvBklg.end()) {
            std::stringstream streamName; streamName << "backlog_" << otherServer << "->" << address_;
            cModuleType *moduleType = cModuleType::get("datacenter.model.node.applicationLayer.bklgSchedApplication.ReceiveBacklog");
            LOG(DEBUG) << "Allocated new receive backlog " << streamName.str() << endl;
            rcvBklg[otherServer] = check_and_cast<ReceiveBacklog*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
            rcvBklg[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
            //rcvBklg[otherServer]->msgCurRcv_ = *(*it); // a copy of the first message we expect to receive from otherServer
            WATCH_PTR(rcvBklg[otherServer]);
        }
        rcvBklg[otherServer]->toRcvBytes_ += (*it)->messageSize;
    }
    // Record initial backlog values
    for (ReceiveBacklogMap::iterator it = rcvBklg.begin(); it != rcvBklg.end(); it++) { it->second->record(NULL); }
    for (SendBacklogMap::iterator it=sndBklg.begin() ; it != sndBklg.end(); it++ ) { it->second->record(NULL); }
}

void BklgSchedApplication::activateMessage(AppMessage *appMsg)
{
    MessageApplication::activateMessage(appMsg);
}

void BklgSchedApplication::sendNextSegment(ActiveMessage *msg) // XXX probably don't need
{
    MessageApplication::sendNextSegment(msg);
}

void BklgSchedApplication::receiveSegment(DCN_UDPPacket *pkt) // XXX probably don't need
{
    // Keep track of messages received.
    // We assume that messages arrive in the order in which they were scheduled
    // so we just do this based on the number of bytes.
    // So we keep a vector per-server that is sending to us
    curMsg = pkt;
    MessageApplication::receiveSegment(pkt);
    curMsg = NULL; // XXX
}

// XXX Preallocate the ServerBacklog stats objects instead of using these silly activate methods
void BklgSchedApplication::activateSendStream(uint otherServer)
{
    /*
    // Only collect stats for every pth server (if specified)
    if (!IS_PTH_SERVER(otherServer)) { return; }

    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    SendBacklogMap::iterator it = sndBklg.find(otherServer);
    if (it == sndBklg.end()) {
        std::stringstream streamName; streamName << "stream_" << address_ << "->" << otherServer;
        cModuleType *moduleType = cModuleType::get("datacenter.model.applicationLayer.bklgSchedApplication.SendBacklog");
        LOG(DEBUG) << "Allocated new send backlog " << streamName.str() << endl;
        sndBklg[otherServer] = check_and_cast<SendBacklog*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        sndBklg[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
        WATCH_PTR(sndBklg[otherServer]);
    }*/
}

void BklgSchedApplication::activateReceiveStream(uint otherServer)
{
    /*
    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    ReceiveBacklogMap::iterator it = rcvBklg.find(otherServer);
    if (it == rcvBklg.end()) {
        std::stringstream streamName; streamName << "stream_" << otherServer << "->" << address_;
        cModuleType *moduleType = cModuleType::get("datacenter.model.applicationLayer.bklgSchedApplication.ReceiveBacklog");
        LOG(DEBUG) << "Allocated new receive backlog " << streamName.str() << endl;
        rcvBklg[otherServer] = check_and_cast<ReceiveBacklog*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        rcvBklg[otherServer]->useHardCodedStatistics(useHardcodedStreamStatistics_);
        WATCH_PTR(rcvBklg[otherServer]);
    }*/
}

void BklgSchedApplication::updateSendStats(DCN_UDPPacket *messageSegment)
{
    uint daddr = messageSegment->getDestAddr();
    //if (recordStreamStatistics_ && IS_PTH_SERVER(daddr)) {
    //    SendBacklog *sbklg = sndBklg[daddr];
    //    sbklg->record(messageSegment);
    //}
    curMsg = messageSegment; // XXX
    sndBklg[daddr]->record(messageSegment);
    //SendBacklog *sbklg = sndBklg[daddr]; sbklg->record(messageSegment);
    check_finished();
    curMsg = NULL; // XXX
}

void BklgSchedApplication::updateReceiveStats(DCN_UDPPacket *messageSegment)
{
    // Record bytes received in the statistics
    /*if (IS_PTH_SERVER(address_)) {
        activateReceiveStream(messageSegment->getSrcAddr());
        if (recordStreamStatistics_) { rcvBklg[messageSegment->getSrcAddr()]->record(messageSegment); }
    }*/
    curMsg = messageSegment;
    rcvBklg[messageSegment->getSrcAddr()]->record(messageSegment);
    check_finished();
    curMsg = NULL;
}

void BklgSchedApplication::check_finished()
{
    if (!bytesToSend() && !bytesToReceive()) { emit(finishTimeSignal,simTime()); }
}

long BklgSchedApplication::bytesToSend()
{
    long toSend = 0;
    for (SendBacklogMap::iterator it = sndBklg.begin(); it != sndBklg.end(); it++) {
        toSend += it->second->toSndBytes_;
    } return toSend;
}

long BklgSchedApplication::bytesSent()
{
    long sent = 0;
    for (SendBacklogMap::iterator it = sndBklg.begin(); it != sndBklg.end(); it++) {
        sent += it->second->sntBytes_;
    } return sent;
}

long BklgSchedApplication::bytesToReceive()
{
    long toReceive = 0;
    for (ReceiveBacklogMap::iterator it = rcvBklg.begin(); it != rcvBklg.end(); it++) {
        toReceive += it->second->toRcvBytes_;
        toReceive -= it->second->bytesLost_; // Subtract bytes lost
    } return toReceive;
}

long BklgSchedApplication::bytesReceived()
{
    long received = 0;
    for (ReceiveBacklogMap::iterator it = rcvBklg.begin(); it != rcvBklg.end(); it++) {
        received += it->second->rcvBytes_;
    } return received;
}


void BklgSchedApplication::receiveSignal(cComponent *source, simsignal_t signalID, cObject *obj)
{
    DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket*>(obj);
    curMsg = pkt; // XXX Temp to see if I can get rid of undisposed object
    uint src = pkt->getSrcAddr(); uint dst = pkt->getDestAddr();
    if (src == address_) {
        // Lookup "SendBacklog" object we use to collect stats for traffic we send
        SendBacklog *sbklg = sndBklg[dst];
        sbklg->recordDrop(pkt);
        check_finished(); // It could be the last byte we receive
    } else if (dst == address_) {
        // Lookup "SendBacklog" object we use to collect stats for traffic we send
        ReceiveBacklog *rbklg = rcvBklg[src];
        rbklg->recordDrop(pkt);
        check_finished(); // It could be the last byte we receive
    }
    curMsg = NULL;
}

void BklgSchedApplication::receiveSignal(cComponent *source, simsignal_t signalID, const SimTime& t)
{
    //if (typeid(*source) != typeid(BklgSchedApplication)) { return; }
    BklgSchedApplication *src = check_and_cast<BklgSchedApplication*>(source);
    uint addr = src->address_;
    LOG(DEBUG) << addr << " has finished." << endl;
    leftToFinish_--;
    LOG(DEBUG) << leftToFinish_ << " remain." << endl;
    if (!leftToFinish_) {
        if (emitIntvlStatsEvent_ && emitIntvlStatsEvent_->isScheduled()) {
            // Wait until the next stats interval has completed before ending
        } else {
            endSimulation();
        }
    }
    //check_and_cast<BklgSchedApplication*>(source)
}

void BklgSchedApplication::finish()
{
    cancelAndDelete(emitIntvlStatsEvent_); emitIntvlStatsEvent_ = NULL;
}

BklgSchedApplication::~BklgSchedApplication()
{
    if (address_ == 0) { unsubscribe("finishTime", this); }
    unsubscribe("switchDrop", this);
    cancelAndDelete(emitIntvlStatsEvent_); emitIntvlStatsEvent_ = NULL;

    while (!msgsToReceive.empty()) {
        AppMessage *appMsg = msgsToReceive.back(); msgsToReceive.pop_back(); delete appMsg;
    }
    for (SendBacklogMap::iterator it=sndBklg.begin() ; it != sndBklg.end(); it++ ) { it->second->deleteModule(); }
    for (ReceiveBacklogMap::iterator it=rcvBklg.begin() ; it != rcvBklg.end(); it++ ) { it->second->deleteModule(); }
    sndBklg.clear(); rcvBklg.clear();
    if (curMsg) delete curMsg;
}

