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
#include "VirtualOutputQueue.h"

void TimeAvgRec::collect(simtime_t_cref t, double value)
{
    if (startTime < SIMTIME_ZERO) // uninitialized
        startTime = t;
    else
        weightedSum += lastValue * SIMTIME_DBL(t - lastTime);
    lastTime = t;
    lastValue = value;
}

double TimeAvgRec::getTimeAvg()
{
    simtime_t t = simTime();
    collect(t, lastValue); // lastValue is a just a dummy to get the last interval counted in
    double interval = SIMTIME_DBL(t - startTime);
    return (interval) ? (weightedSum / interval) : 0;
}

VirtualOutputQueue::VirtualOutputQueue()
{

}

// cSimpleModule methods

void VirtualOutputQueue::initialize()
{
    ServerBuffer::initialize();
	LOG(DEBUG) << typeid(this).name() << endl;
	address_ = par("address");
	outGate_ = gate("out");
	noSchedAccounting_ = par("noSchedAccounting");
	queueSchedPkts_ = par("queueSchedPkts");
	sendNextPacketEvent_ = new cMessage(); // VOQ can send a packet only when this event is not scheduled
	sendingRate_ = 0; // Initialize to 0, scheduling algorithm will set the minimum rate
	curPktSizeBits_ = 0;
	scheduleNextTransmission(0); // Will cause the sendNextPacketEvent to be scheduled at MAXTIME
	WATCH(curPktSizeBits_);
	WATCH(sendingRate_);
}

void VirtualOutputQueue::registerSignals()
{
    // Register the signals
    std::stringstream voqIdStr;
    voqIdStr << "_" << address_ << "_dst_" << destAddr_;
    std::string qlenPktsSignalName, qlenBytesSignalName, dropSignalName;
    std::string rxBytesSignalName, txBytesSignalName, txBytesSchedSignalName, txBytesDataSignalName;
    // XXX Temporarily have all VOQs use the same signal names here for these signals
    //qlenPktsSignalName      = "voqQlenPkts" + voqIdStr.str();
    //qlenBytesSignalName     = "voqQlenBytes" + voqIdStr.str();
    //dropSignalName          = "voqDrop" + voqIdStr.str();
    //txBytesSignalName     = "voqTxBytes" + voqIdStr.str();
    //txBytesSchedSignalName    = "voqTxBytesSched" + voqIdStr.str();
    //txBytesDataSignalName = "voqTxBytesData" + voqIdStr.str();
    qlenPktsSignalName      = "voqQlenPkts";
    qlenBytesSignalName     = "voqQlenBytes";
    dropSignalName          = "voqDrop";
    rxBytesSignalName       = "voqRxBytes";
    txBytesSignalName       = "voqTxBytes";
    txBytesSchedSignalName  = "voqTxBytesSched";
    txBytesDataSignalName   = "voqTxBytesData";
    qlenPktsSignal      = registerSignal(qlenPktsSignalName.c_str());
    qlenBytesSignal     = registerSignal(qlenBytesSignalName.c_str());
    dropSignal          = registerSignal(dropSignalName.c_str());
    txBytesSignal       = registerSignal(txBytesSignalName.c_str());
    rxBytesSignal       = registerSignal(rxBytesSignalName.c_str());
    txBytesSchedSignal  = registerSignal(txBytesSchedSignalName.c_str());
    txBytesDataSignal   = registerSignal(txBytesDataSignalName.c_str());
    adjustSendingRateSignal = registerSignal("voqAdjustSendingRate");
    voqDelaySignal =  registerSignal("voqDelay");
    // XXX AlgBklgProp specific:
    reqRateSignal = registerSignal("voqReqRate");
    allocRateSignal = registerSignal("voqAllocRate");
    recRateSignal = registerSignal("voqRecRate");
}

void VirtualOutputQueue::handleMessage(cMessage *msg)
{
	DCN_EthPacket *pkt;
	if (msg == sendNextPacketEvent_) {
	    if (simTime() == MAXTIME) {
	        opp_error("VOQ has scheduled to send a packet at MAXTIME. "
	                  "This can happen when the VOQ has packets but is never given a rate. "
	                  "If using schedFromFile, make sure the specified schedule will actually clear all the backlog.");
	    }
		// Send the packet from the front of the queue and schedule the next transmission
		pkt = dequeue();
		if (pkt != NULL) {
		    if (pkt->isDataPacket()) emit(voqDelaySignal, simTime() - pkt->getTimestamp());
		    sendPacket(pkt);
		}
	} else {
        pkt = check_and_cast<DCN_EthPacket *>(msg);
        ASSERT(pkt->getDestAddr() == destAddr_);
        if (!sendNextPacketEvent_->isScheduled()) {
            // If next transmission is not scheduled, we can send the packet immediately
            emit(voqDelaySignal, simTime() - simTime()); // i.e. emit delay = 0
            sendPacket(pkt);
        } else {
            // Otherwise enqueue it
            pkt->setTimestamp(simTime()); // Set the packet's timestamp so that we know when it was queued.
            enqueue(pkt);
        }
    }
}


void VirtualOutputQueue::setSendingRate(uint64 sendRate)
{
	Enter_Method("Set sending rate to %ul bps", sendRate);
	uint64 oldRate = sendingRate_;
	sendingRate_ = sendRate;
	LOG(DEBUG) << "Sending rate was updated from " << oldRate << " to " << sendingRate_ << endl;
	//timeRateLastSet_=simTime();
	// Reschedule the sendNextPacketEvent
	if (sendNextPacketEvent_->isScheduled()) {
		LOG(DEBUG) << "Rescheduling sendNextPacketEvent_..." << endl;
		// Determine size of last packet sent
		int64_t pktSize = curPktSizeBits_;
		// Determine number of bits left to send
		int64_t bitsLeftToSend = pktSize - (uint64)((simTime().dbl() - sendNextPacketEvent_->getSendingTime().dbl())*oldRate);
		if (bitsLeftToSend > pktSize) opp_error("bitsLeftToSend > pktSize");
		if (bitsLeftToSend < 0) opp_error("bitsLeftToSend < 0");
		LOG(DEBUG) << "Original pktSize = " << pktSize << " with " << bitsLeftToSend << " bits left" << endl;
		// Cancel the current event
		cancelEvent(sendNextPacketEvent_);
		scheduleNextTransmission(bitsLeftToSend);
	} else if (!queue_.isEmpty()) {
	    scheduleNextTransmission(0);
	}
	if (!statsOnSignal) {
	    emit(adjustSendingRateSignal, (long)sendRate);
	} else {
	    intvlRates_.collect(simTime(), (double)sendRate);
	}
	updateDisplayString();
}

void VirtualOutputQueue::sendSchedulingPacket(SchedulingPacket *pkt)
{
	Enter_Method("Send scheduling packet");
	// Take ownership of the packet
	take(pkt);
	pkt->setTimestamp(simTime());
    if (noSchedAccounting_) {
        sendPacket(pkt, true); // Scheduling packets do not affect departure times of data packets
    } else if (queueSchedPkts_ && sendNextPacketEvent_->isScheduled()) {
        // Put the scheduling packet at the front of the queue
        if (queue_.empty()) { queue_.insert(pkt); }
        else { queue_.insertBefore(queue_.front(), pkt); }
    } else {
        sendPacket(pkt, true); // Send scheduling packet immediately
    }
}

// Helper methods
void VirtualOutputQueue::sendPacket(DCN_EthPacket *pkt, bool isScheduling)
{
	//if (pkt->getKind() == DCN_DATA_PACKET) {
    if (pkt->isDataPacket()) {
		lastActiveTime_ = simTime(); // Don't consider sending scheduling packet activity
		if (!statsOnSignal) {
		    emit(txBytesDataSignal, (long)pkt->getByteLength());
		} else {
		    intvlTxBytesData_.push_back((long)pkt->getByteLength());
		}
    } else {
	//} else if (pkt->getKind() == DCN_SCHEDULING_PACKET) {
        if (!statsOnSignal) {
            emit(txBytesSchedSignal, (long)pkt->getByteLength());
        } else {
            intvlTxBytesSched_.push_back((long)pkt->getByteLength());
        }
	}
	if (!statsOnSignal) {
	    emit(txBytesSignal, (long)pkt->getByteLength());
	} else {
	    intvlTxBytes_.push_back((long)pkt->getByteLength());
	}

	if (!isScheduling || (isScheduling && !noSchedAccounting_)) {
	    scheduleNextTransmission(pkt->getBitLength());
	}
	send(pkt, outGate_);
}

void VirtualOutputQueue::scheduleNextTransmission(uint64 bitsToSend)
{
	// If sendNextPacketEvent is already scheduled
	if (sendNextPacketEvent_->isScheduled()) {
	    // Then we increase the length of time until it arrives by the new packet size.
	    // This should only happen for scheduling packets when !noSchedAccounting_ and !queueSchedPts_
	    if (noSchedAccounting_) opp_error("Attempting to account for scheduling packet while using noSchedAccounting");
	    if (queueSchedPkts_) opp_error("Attempting to send scheduling packet that should have been enqueued"); // only allowed when queueing of scheduling packets is disabled
	    uint bitsSent = (uint64)((sendNextPacketEvent_->getArrivalTime().dbl() - sendNextPacketEvent_->getSendingTime().dbl())*sendingRate_);
		bitsToSend = curPktSizeBits_- bitsSent + bitsToSend;
	    //opp_error("XXX Disabled. Not accounting for control traffic in this way.");
	    //bitsToSend += curPktSizeBits_;//sendNextPacketEvent_->getKind();
		cancelEvent(sendNextPacketEvent_);
	}
    //if (bitsToSend >= 32767) opp_error("bitsToSend is short int, range exceeded 32K");
    curPktSizeBits_ = bitsToSend;
    //sendNextPacketEvent_->setKind(bitsToSend);

	simtime_t nextSendTime;
	if (sendingRate_ > 0) {
		nextSendTime = simTime() + ((double)bitsToSend)/((double)sendingRate_);
	} else {
		nextSendTime = MAXTIME;
	}
	LOG(DEBUG) << "Schedule sendNextPacketEvent_ for time " << nextSendTime << endl;
	scheduleAt(nextSendTime, sendNextPacketEvent_);
}

void VirtualOutputQueue::emitStats()
{
    emit(txBytesDataSignal, sum(intvlTxBytesData_));
    emit(txBytesSchedSignal, sum(intvlTxBytesSched_));
    emit(adjustSendingRateSignal, intvlRates_.getTimeAvg());
    intvlRates_.clear();
    intvlTxBytesData_.clear();
    intvlTxBytesSched_.clear();
    ServerBuffer::emitStats();
}


void VirtualOutputQueue::updateDisplayString()
{
	// Set the graphics to show the current backlog and sending rate
	char displayStr_[128];
	sprintf(displayStr_, "backlog: %lu bytes, rate: %lu bps", (long unsigned int)queue_.getByteLength(), (long unsigned int)sendingRate_);
	getDisplayString().setTagArg("t", 0, displayStr_);
}


void VirtualOutputQueue::emitBPState(double reqRate, double allocRate, double recRate)
{
    Enter_Method_Silent("emitBPState");
    emit(reqRateSignal, (double)reqRate);
    emit(allocRateSignal, (double)allocRate);
    emit(recRateSignal, (double)recRate);
}

VirtualOutputQueue::~VirtualOutputQueue()
{
	cancelAndDelete(sendNextPacketEvent_);
	// Destructor for cPacketQueue should take care of any packets in queue_
}

Define_Module(VirtualOutputQueue);
