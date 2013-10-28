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

#include "DCCommon.h"
#include "ServerPortQueue.h"
#include "ControlMessage.h"

ServerPortQueue::ServerPortQueue()
{

}

void ServerPortQueue::initialize(int stage)
{
	L2Queue::initialize(stage);

	LOG(DEBUG) << typeid(this).name() << endl;

	address_ = (uint)par("address").longValue();
	bitsOnWire = 0;

	controlGate_in = gate("control$i");
	controlGate_out = gate("control$o");

	setTimestamp_ = par("setTimestamp").boolValue();
	recordStreamStatistics_ = par("recordStreamStatistics");
	limitStatsToEveryPServers = par("limitStatsToEveryPServers").longValue();

    sendIntervalSignal = registerSignal("sendInterval");
    pktDestTx = registerSignal("pktDestTx");
    pktDestRx = registerSignal("pktDestRx");

    rxPacketPtrSignal_ = registerSignal("rxPacketPtr"); // XXX
    txPacketPtrSignal_ = registerSignal("txPacketPtr"); // XXX

    rxMeter_ = NULL; txMeter_ = NULL;
    if (par("measureBandwidth")) {
        rxMeter_ = check_and_cast<BandwidthMeter*>(getParentModule()->getSubmodule("rxMeter", 0));
        txMeter_ = check_and_cast<BandwidthMeter*>(getParentModule()->getSubmodule("txMeter", 0));
    }
}

void ServerPortQueue::handleMessage(cMessage *msg)
{
    if (msg->getArrivalGate() == line_in_) {
		if (!msg->isPacket()) {
			// and forward it up to the ControlLogic
			send(msg, controlGate_out);
		} else {
            DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket*>(msg);
            if (rxMeter_) { rxMeter_->updateStats(simTime(), ((cPacket*)msg)->getBitLength()); }
            if (IN_MEASUREMENT_INTERVAL(pkt)) {
                if (recordStreamStatistics_) { recordReceiveStream(pkt);}
                emit(pktDestRx, pkt->getSrcAddr());
            }
			L2Queue::handleMessage(msg);
		}
    } else {
		L2Queue::handleMessage(msg);
	}
}

void ServerPortQueue::startTransmitting(DCN_EthPacket *pkt)
{
	bitsOnWire = pkt->getBitLength();

	// Make sure we timestamp before recording statistics
	if (setTimestamp_) { pkt->setTimestamp(); }

	L2Queue::startTransmitting(pkt);

	if (IN_MEASUREMENT_INTERVAL(pkt)) {
	    if (mayHaveListeners(sendIntervalSignal)) {
	        emit(sendIntervalSignal, transmissionChannel_->getTransmissionFinishTime() - simTime());
	    }
	    if (recordStreamStatistics_) { recordSendStream(pkt); }
	    emit(pktDestTx, pkt->getDestAddr());
	}
}

void ServerPortQueue::finishTransmitting()
{
	L2Queue::finishTransmitting();
	if (txMeter_) { txMeter_->updateStats(simTime(), bitsOnWire); }
}

void ServerPortQueue::recordReceiveStream(DCN_EthPacket *pkt)
{
    if (!IN_MEASUREMENT_INTERVAL(pkt)) { return;}
    uint otherServer = pkt->getSrcAddr();
    if (!IS_PTH_SERVER(address_)) { return; }
    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    ReceiveStreamMap::iterator it = receivingStreams.find(otherServer);
    if (it == receivingStreams.end()) {
        std::stringstream streamName; streamName << "stream_" << otherServer << "->" << address_;
        cModuleType *moduleType = cModuleType::get("datacenter.model.common.ReceiveStream");
        LOG(DEBUG) << "Allocated new receive stream " << streamName.str() << endl;
        receivingStreams[otherServer] = check_and_cast<ReceiveStream*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        receivingStreams[otherServer]->useHardCodedStatistics(false);
        WATCH_PTR(receivingStreams[otherServer]);
    }
    if (pkt->getTimestamp() < simulation.getWarmupPeriod()) { opp_error("received packet was timestamped before end of warmup"); }
    if (pkt->getTimestamp() > sim_time_limit_) { opp_error("received packet was timestamped after end of simtimelimit"); }
    receivingStreams[otherServer]->record(pkt);
    emit(rxPacketPtrSignal_, pkt); // XXX
}

void ServerPortQueue::recordSendStream(DCN_EthPacket *pkt)
{
    if (!IN_MEASUREMENT_INTERVAL(pkt)) { return;}
    uint otherServer = pkt->getDestAddr();
    // Create a new stream entry to record bytes sent/received to/from the
    // given server if no stream for the destination exists.
    LOG(DEBUG) << "otherServer = " << otherServer << endl;
    if (!IS_PTH_SERVER(otherServer)) { return; }
    SendStreamMap::iterator it = sendingStreams.find(otherServer);
    if (it == sendingStreams.end()) {
        std::stringstream streamName; streamName << "stream_" << address_ << "->" << otherServer;
        cModuleType *moduleType = cModuleType::get("datacenter.model.common.SendStream");
        LOG(DEBUG) << "Allocated new send stream " << streamName.str() << endl;
        sendingStreams[otherServer] = check_and_cast<SendStream*>(moduleType->createScheduleInit(streamName.str().c_str(), this));
        sendingStreams[otherServer]->useHardCodedStatistics(false);
        WATCH_PTR(sendingStreams[otherServer]);
    }
    if (pkt->getTimestamp() < simulation.getWarmupPeriod()) { opp_error("packet about to be sent was timestamped before end of warmup"); }
    if (pkt->getTimestamp() > sim_time_limit_) { opp_error("packet about to be sent was timestamped after end of simtimelimit"); }
    sendingStreams[otherServer]->record(pkt);
    emit(txPacketPtrSignal_, pkt); // XXX
}

ServerPortQueue::~ServerPortQueue()
{
    for (SendStreamMap::iterator it=sendingStreams.begin() ; it != sendingStreams.end(); it++ ) { it->second->deleteModule(); }
    for (ReceiveStreamMap::iterator it=receivingStreams.begin() ; it != receivingStreams.end(); it++ ) { it->second->deleteModule(); }
    sendingStreams.clear();
    receivingStreams.clear();
}

Define_Module(ServerPortQueue);
