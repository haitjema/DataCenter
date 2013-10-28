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
#include "ResequencerBuffer.h"

bool timestampLessThan(simtime_t t1, simtime_t t2) { return t1 < t2; }

int timestampComparison(cObject *pkt1, cObject *pkt2)
{
    // Currently timestamp is based on cMessage's timestamp class but
    // if we change that we'd need to update this function
    simtime_t t1 = ((DCN_EthPacket *)pkt1)->getTimestamp();
    simtime_t t2 = ((DCN_EthPacket *)pkt2)->getTimestamp();

    if (t1 == t2) return 0;
    return (timestampLessThan(t1, t2)) ? -1 : 1;
    //return (timestampLessThan(t1, t2)) ? 1 : -1;
}

ResequencerBuffer::ResequencerBuffer()
{
    queue_.setup(timestampComparison);
}

void ResequencerBuffer::initialize()
{
    ServerBuffer::initialize();
    expectedSequenceNo_ = 0; sendingSequenceNo_ = 0;
    delayThreshold_ = 0; dropOldPackets_ = false;
    maxObservedDelay_ = 0; minObservedDelay_ = MAXTIME;
    timeOutEvent_ = new cMessage();
}

void ResequencerBuffer::registerSignals()
{
    ServerBuffer::registerSignals();
    rxSeqNoSignal =     registerSignal("rxSeqNo");      // arriving packet sequence number 
    rxTimestampSignal = registerSignal("rxTimestamp");  // arriving packet timestamp
    txSeqNoSignal =     registerSignal("txSeqNo");      // released packet timestamp
    txTimestampSignal = registerSignal("txTimestamp");  // released packet sequence number
    expSeqNoSignal =    registerSignal("expSeqNo");     // expected sequence number upon pkt arrival
    reseqDelaySignal =  registerSignal("reseqDelay");   // time released packet spent in buffer (only those that were buffered)
    reseqDelayAllSignal =  registerSignal("reseqDelayAll");   // time released packet spent in buffer (all packets)
    reseqDelayFracSignal = registerSignal("reseqDelayFrac"); // fraction of overall delay spent in resequencer
    reseqDelayNetFracSignal = registerSignal("reseqDelayNetFrac"); // fraction of delay (rsq + net)
    totalDelaySignal = registerSignal("totalDelay");    // total delay (voq + network + resequencing)
    networkDelaySignal = registerSignal("networkDelay"); // delay experienced by packet in network
    OOArrivalSignal = registerSignal("OOArrival");      // difference between arriving and expected seq. #
    OODeliverySignal = registerSignal("OODelivery");    // difference between delivered and expected seq. #
    setTimeoutSignal =  registerSignal("setTimeout");   // value of the new timeout
    delayThresholdSignal = registerSignal("delayThreshold"); // discard pkts older than this time
    latePktSignal = registerSignal("latePkt");  // timestamp of old pkt - delay threshold
    timeoutSignal =     registerSignal("timeout");      // timeout occurred
    minDelaySignal =     registerSignal("minDelay");    // min delay observed
    maxDelaySignal =     registerSignal("maxDelay");    // max delay observed
}

void ResequencerBuffer::handleMessage(cMessage *msg)
{
    if (msg == timeOutEvent_) {
        handleTimeout();
        updateTimeout();
    }
}

void ResequencerBuffer::addSequenceNo(DCN_EthPacket *pkt)
{
    // XXX Currently only set if 0 (i.e. not already set) 
    // this way I can debug by setting seq. no. in a test application
    if (pkt->getSequenceNo() == 0) {
        pkt->setSequenceNo((uint)(sendingSequenceNo_++));
        if (sendingSequenceNo_ == UINT32_MAX) {
            opp_error("Wrap around not implemented. sending seq. no. reached max value");
        }
    }
}

void ResequencerBuffer::incrementSeqNo()
{
    // Increment the expected sequence number
    // XXX Wrap-around currently not handled
    if (expectedSequenceNo_ == UINT32_MAX) {
        opp_error("Wrap around not implemented. expected seq. no. reached max value");
    }
    expectedSequenceNo_++;
    emit(expSeqNoSignal, expectedSequenceNo_);
}

void ResequencerBuffer::updateDelayWindow(DCN_EthPacket *pkt)
{
    simtime_t delay = pkt->getArrivalTime() - pkt->getTimestamp();
    if (delay < minObservedDelay_) {
        minObservedDelay_ = delay;
        emit(minDelaySignal, minObservedDelay_);
    }
    if (delay > maxObservedDelay_) {
        maxObservedDelay_ = delay;
        emit(maxDelaySignal, maxObservedDelay_);
    }
    simtime_t delayThreshold = maxObservedDelay_ - minObservedDelay_;
    if (delayThreshold != delayThreshold_) setDelayThreshold(delayThreshold);
}

void ResequencerBuffer::handlePacket(DCN_EthPacket *pkt)
{
    Enter_Method("handlePacket");
    
    take(pkt); // XXX Take ownership?
    simtime_t lateness = getPacketDelay(pkt) - maxObservedDelay_; // need to collect this before changing the min/max delay
    // Note: for these signals, rx means arriving at buffer from network
    emit(rxBytesSignal, (long)pkt->getByteLength());
    emit(rxSeqNoSignal, (long)pkt->getSequenceNo());
    emit(rxTimestampSignal, pkt->getTimestamp());
    // Note: network delay emitted upon release
    updateDelayWindow(pkt);

    if (pkt->getSequenceNo() == expectedSequenceNo_) {
        // Incoming packet is in order
        LOG(LOUD) << "packet matches expected sequence no " << expectedSequenceNo_ << endl;
        incrementSeqNo();
        pkt->setSchedulingPriority(0); // Ensures it's released before any other packets in the queue
        // Let the resequencer forward it up the stack
        releasePacket(pkt);
        // Release any other packets that are now in order
        releaseOrderedPackets();

    } else if (packetIsLate(pkt)) {
        // Packet is old, drop it
        LOG(LOUD) << "deleting packet from source " << pkt->getSrcAddr() << " with seq no " << pkt->getSequenceNo() << endl;


        //emit(delayOfOldPktSignal, delay); // XXX
        emit(latePktSignal, lateness);

        if (dropOldPackets_) {
            drop(pkt); // Take ownership and update stats
        } else {
            int diff = expectedSequenceNo_ - pkt->getSequenceNo();
            emit(OODeliverySignal, diff);
            releasePacket(pkt);
        }
    } else {
        // This packet arrived out of order
        long seqDiff = pkt->getSequenceNo() - expectedSequenceNo_;
        emit(OOArrivalSignal, seqDiff);
        // put the packet in the queue
        enqueue(pkt);
    }
    updateTimeout();
}

void ResequencerBuffer::handleTimeout()
{
    emit(timeoutSignal, (simTime() - timeOutEvent_->getSendingTime()));

    // Adjust expected seq. no. to sequence number of packet at front of queue
    DCN_EthPacket *pkt = (DCN_EthPacket *)queue_.front();
    expectedSequenceNo_ = pkt->getSequenceNo();
    emit(expSeqNoSignal, expectedSequenceNo_);

    // Release any packets that are now in order
    releaseOrderedPackets();
}

void ResequencerBuffer::releaseOrderedPackets()
{
    LOG(LOUD) << endl;
    DCN_EthPacket *pkt; short num_released = 0;
    while (queue_.front() != NULL && ((DCN_EthPacket *)queue_.front())->getSequenceNo() == expectedSequenceNo_)
    {
        pkt = dequeue();
        // Set the scheduling priority to ensure that multiple packets released
        // at the same time are still delivered in the order they were released
        pkt->setSchedulingPriority(++num_released);
        releasePacket(pkt);
        incrementSeqNo();
        LOG(LOUD) << "incrementing seq to " << expectedSequenceNo_ << endl;
    }
}

void ResequencerBuffer::releasePacket(DCN_EthPacket *pkt)
{
    LOG(LOUD) << "releasing packet with seq" << pkt->getSequenceNo() << endl;
    emit(txBytesSignal, (long)pkt->getByteLength());
    emit(txSeqNoSignal, pkt->getSequenceNo());
    emit(txTimestampSignal, pkt->getTimestamp());
    simtime_t rsqDelay = simTime() - pkt->getArrivalTime(); // XXX assumes sender & receiver clocks are the same
    simtime_t netDelay = pkt->getArrivalTime()-pkt->getTimestamp();
    //simtime_t totDelay = rsqDelay + netDelay;
    simtime_t totDelay = simTime() - pkt->getCreationTime();
    emit(totalDelaySignal, totDelay);
    emit(reseqDelayAllSignal, rsqDelay);
    emit(networkDelaySignal, netDelay);
    if (rsqDelay > 0) {
        double rsqDelayFrac =  rsqDelay.dbl()/totDelay.dbl();
        emit(reseqDelaySignal, rsqDelay);
        emit(reseqDelayNetFracSignal, rsqDelay.dbl()/(rsqDelay.dbl() + netDelay.dbl()));
        emit(reseqDelayFracSignal, rsqDelayFrac);
    }
    resequencer_->release(pkt);
}

bool ResequencerBuffer::packetIsLate(DCN_EthPacket *pkt)
{
    //return timestampLessThan(delayThreshold_, getPacketdelay(pkt));
    return ((pkt->getArrivalTime() - pkt->getTimestamp()) >= maxObservedDelay_);
}

simtime_t ResequencerBuffer::getPacketDelay(DCN_EthPacket *pkt)
{
    return pkt->getArrivalTime() - pkt->getTimestamp();
}

void ResequencerBuffer::setDelayThreshold(simtime_t delayThreshold)
{
    delayThreshold_ = delayThreshold;
    emit(delayThresholdSignal, delayThreshold_);
    updateTimeout();
}

void ResequencerBuffer::updateTimeout()
{
    if (queue_.front() == NULL) {
        if (timeOutEvent_->isScheduled()) { cancelEvent(timeOutEvent_); }
        return;
    } else {
        DCN_EthPacket *pkt = (DCN_EthPacket *)queue_.front();
        simtime_t latestDeparture = pkt->getTimestamp();
        simtime_t timeout = latestDeparture + maxObservedDelay_;
        if (timeout < simTime()) timeout = simTime();
        if (timeOutEvent_->isScheduled()) {
            if (timeout == timeOutEvent_->getArrivalTime()) return;
            cancelEvent(timeOutEvent_);
        }
        emit(setTimeoutSignal, timeout);
        scheduleAt(timeout, timeOutEvent_);
    }
}

void ResequencerBuffer::enqueue(DCN_EthPacket *pkt)
{
    LOG(LOUD) << "packet is out of order, seq. no. = " << pkt->getSequenceNo() << " expected seq. no = "
              << expectedSequenceNo_ << " timestamp = " << pkt->getTimestamp() << endl;
    ServerBuffer::enqueue(pkt);
}

ResequencerBuffer::~ResequencerBuffer()
{
    cancelAndDelete(timeOutEvent_);
}

Define_Module(ResequencerBuffer);
