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
#include "SequenceNumberResequencer.h"


//int SequenceNumberBuffer::seqNoComparison(cObject *pkt1, cObject *pkt2)
int seqNoComparison(cObject *pkt1, cObject *pkt2)
{
	uint32 seq1 = ((DCN_EthPacket *)pkt1)->getSequenceNo();
	uint32 seq2 = ((DCN_EthPacket *)pkt2)->getSequenceNo();

	// Return value should be:
	//	less than zero if a < b
	//	greater than zero if a > b
	//	zero if a == b
	if (seq1 == seq2) return 0;
	if (seqNoLessThan(seq1, seq2))
	{
		return -1;
	} else
	{
		return 1;
	}
}

bool seqNoLessThan(uint32 seq1, uint32 seq2)
{
	// Comparing two sequence numbers is tricky because the number can wrap around
	// http://en.wikipedia.org/wiki/Serial_number_arithmetic
	// Thus i1 < i2 if:
	// 		(i1 < i2 AND i2 - i1 < 2^(SERIAL_BITS - 1))
	// OR 	(i1 > i2 AND i1 - i2 > 2^(SERIAL_BITS - 1))

	return ((seq1 < seq2) && ( (seq2 - seq1) < (uint32)(1 << (SEQUENCE_NO_BITS - 1)) )) ||
		   ((seq1 > seq2) && ( (seq1 - seq2) > (uint32)(1 << (SEQUENCE_NO_BITS - 1)) ));
}



SequenceNumberBuffer::SequenceNumberBuffer(SequenceNumberResequencer *resequencerPtr) : cQueue(NULL, &seqNoComparison), resequencer_(resequencerPtr)
{
	expectedSequenceNo_ = 0;
	timeout_ = 0;
}

void SequenceNumberBuffer::handlePacket(DCN_EthPacket *pkt)
{

	if (pkt->getSequenceNo() == expectedSequenceNo_) {
		LOG(LOUD) << "packet matches expected sequence no " << expectedSequenceNo_ << endl;
		// Incoming packet is in order
		// Increment the expected sequence number
		expectedSequenceNo_++;
		// Let the resequencer forward it up the stack
		resequencer_->release(pkt);
		// Release any other packets that are now in order
		releaseOrderedPackets();

	} else if (seqNoLessThan(pkt->getSequenceNo(), expectedSequenceNo_)) {
		LOG(LOUD) << "packet is old, seq = " << pkt->getSequenceNo() << " expected = " << expectedSequenceNo_ << endl;
		// Packet is old, we most likely timed out its sequence number
		// Let the resequencer drop the packet since it's the owner
		resequencer_->drop(pkt);
	} else {
		LOG(LOUD) << "packet is out of order, seq = " << pkt->getSequenceNo() << " expected = " << expectedSequenceNo_ << endl;
		// This packet arrived out of order
		// put the packet in the queue
		enqueue(pkt);
	}
}

void SequenceNumberBuffer::handleTimeout()
{
	LOG(LOUD) << "timeout occurred for sequence no " << expectedSequenceNo_ << endl;
	expectedSequenceNo_++;
	releaseOrderedPackets();
}

void SequenceNumberBuffer::enqueue(DCN_EthPacket *pkt)
{
	LOG(LOUD) << "enqueuing packet, seq = " << pkt->getSequenceNo() << endl;
	insert(pkt);
	calculateTimeout();
}

void SequenceNumberBuffer::releaseOrderedPackets()
{
	LOG(LOUD) << endl;
	DCN_EthPacket *pkt;
	while (front() != NULL && ((DCN_EthPacket *)front())->getSequenceNo() == expectedSequenceNo_)
	{
		pkt = (DCN_EthPacket *)pop();
		resequencer_->release(pkt);
		expectedSequenceNo_++;
		LOG(LOUD) << "releasing packet and incrementing seq to " << expectedSequenceNo_ << endl;
	}
	calculateTimeout();
}

void SequenceNumberBuffer::calculateTimeout()
{
	LOG(LOUD) << endl;
	// Compute new timeout
	if (front() == NULL)
	{
		// Never timeout if queue is empty
		timeout_ = MAXTIME;
		LOG(LOUD) << "queue is empty, timeout = " << timeout_ << endl;
	}
	else
	{
		DCN_EthPacket *pkt = (DCN_EthPacket *)front();
		// Timeout = time packet in front of queue was sent + maxExpectedNetwork Delay
		// intuition is timestamp for packet at front of queue provides best estimate of when the
		// missing packet was sent
		timeout_ = pkt->getTimestamp() + resequencer_->getMaxExpectedNetworkDelay();
		LOG(LOUD) << "timeout set based on pkt with seq no " << pkt->getSequenceNo() << " timeout = " << timeout_ << endl;
	}
}

SequenceNumberBuffer::~SequenceNumberBuffer()
{
	// Parent cQueue class should automatically delete all packets in queue
	LOG(LOUD) << endl;
}


SequenceNumberResequencer::SequenceNumberResequencer()
{

}

void SequenceNumberResequencer::initialize()
{
	LOG(LOUD) << typeid(this).name() << endl;

	maxExpectedNetworkDelay_ = par("Timeout");
	adaptiveTimout_ = par("UseAdaptiveTimeout");
	bufferTimeoutTime_ = par("BufferTimeout");
	if (bufferTimeoutTime_ == 0) bufferTimeoutTime_ = MAXTIME;

    to_lower_layer_ = gate("lower_layer$o");
	to_upper_layer_ = gate("upper_layer$o");
	from_lower_layer_ = gate("lower_layer$i");
	from_upper_layer_ = gate("upper_layer$i");
}

void SequenceNumberResequencer::handleMessage(cMessage *msg)
{
	if (msg->getArrivalGate() == from_lower_layer_)
	{
		// Packet came in from the network and might be out of order
		LOG(LOUD) << "packet arrived from lower layer " << endl;
		// If adaptive timeout is enabled, update the expected maximum delay used for setting timeouts
		if (adaptiveTimout_) computeMaxExpectedNetworkDelay(msg);

		// Send it to the resequencer corresponding to the sender of the pkt
		sendToResequencer(msg);
	}
	else if (msg->getArrivalGate() == from_upper_layer_)
	{
		LOG(LOUD) << "packet arrived from upper layer " << endl;
		// Simply forward messages from the upper layer
		send(msg, to_lower_layer_);
	}
	else if (msg->isSelfMessage())
	{
		LOG(LOUD) << "packet is self message" << endl;
		// Message must be a timeout
		handleTimeout(msg);
	}
	else {
		opp_error("Unexpected message");
	}
}

void SequenceNumberResequencer::sendToResequencer(cMessage *msg)
{
	// Pass the packet to the resequencer corresponding to the sender of the packet
	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);

	// Lookup the buffer & associated timeout event
	SequenceNumberBuffer *buffer = lookupBuffer(pkt->getSrcAddr());
	cMessage *timeoutEvent = lookupTimeout(pkt->getSrcAddr());

	LOG(LOUD) << "Found resequencer buffer for source " << pkt->getSrcAddr() << endl;

	// Let the resequencing buffer decide whether the packet arrived
	// in-order or if it needs to be enqueued
	buffer->handlePacket(pkt);

	// Always call setTimeout because even if the buffer stayed empty
	// the BufferTimeout will need to be updated
	setTimeout(timeoutEvent, buffer->getNextTimeout());
}

void SequenceNumberResequencer::handleTimeout(cMessage *msg)
{
	int srcAddr = msg->getKind();
	LOG(LOUD) << "Timeout occurred for " << srcAddr << endl;
	LOG(LOUD) << "msg->arrivalTime = " <<  msg->getArrivalTime() << " sending time = " << msg->getSendingTime() << " diff = "
			   << (msg->getArrivalTime() - msg->getSendingTime()) << " simtime = " << simTime() << endl;
	// If the buffer timed out, remove it
	if (!strcmp(msg->getName(), BUFFER_TIMEOUT))
	{
		LOG(LOUD) << "Timeout was BufferTimeout, remove the buffer" << srcAddr << endl;
		removeBuffer(srcAddr);
		return;
	} else {
		// Otherwise, we have timed out waiting on a packet so call the buffer's timeout method
		SequenceNumberBuffer *buffer = lookupBuffer(srcAddr);
		cMessage *timeoutEvent = lookupTimeout(srcAddr);

		LOG(LOUD) << "Timeout was for packet at head of buffer, calling buffer->handleTimeout()... buffer->getNextTimeout() = " << buffer->getNextTimeout() << endl;
		ASSERT(simTime() == buffer->getNextTimeout());

		buffer->handleTimeout();

		// Schedule the event
		setTimeout(timeoutEvent, buffer->getNextTimeout());
	}
}

void SequenceNumberResequencer::setTimeout(cMessage *timeoutEvent, simtime_t timeoutTime)
{
	LOG(LOUD) << "timeoutTime = " << ((timeoutTime == MAXTIME) ? "MAX" : timeoutTime.str())
			   << " bufferTimeoutTime_ = " << bufferTimeoutTime_ << endl;
	// If the next timeout is MAXTIME (or simply greater than the bufferTimeout), assume
	// the queue is empty which means we set the timeout to the BufferTimeout
	if (timeoutTime > bufferTimeoutTime_) {
		timeoutEvent->setName(BUFFER_TIMEOUT);
		timeoutTime = simTime() + bufferTimeoutTime_;
	} else if (timeoutTime < simTime()) {
		// This can happen if the timeout shrinks when using adaptive timeouts
		if (timeoutEvent->isScheduled()) cancelEvent(timeoutEvent);
		handleTimeout(timeoutEvent); // treat this case as a new timeout
	} else {
		timeoutEvent->setName(SEQUENCE_NO_TIMEOUT);
	}
	LOG(LOUD) << "timeoutTime = " << timeoutTime << endl;

	// XXX Efficiency note: Rescheduling the timeout every time might be expensive
	// If the timoutTime > what's currently schedule, instead of rescheduling, we could
	// simply let the timeout occur early and reschedule it using the timestamp field to
	// remember when the timeout should actually occur.... we might have to change the way
	// we detect a Buffer Timeout
	if (timeoutTime != timeoutEvent->getArrivalTime()) {
		if (timeoutEvent->isScheduled()) cancelEvent(timeoutEvent);
		scheduleAt(timeoutTime, timeoutEvent);
		LOG(LOUD) << "reschedule timeout for buffer " << timeoutEvent->getKind() << " at time " << timeoutTime << endl;
	}
}

void SequenceNumberResequencer::removeBuffer(int srcAddr)
{
	// We can't
	LOG(LOUD) << endl;
	cMessage *timeoutEvent = lookupTimeout(srcAddr);
	cancelAndDelete(timeoutEvent);
	bufferTimeouts_.erase(srcAddr);

	// This will erase the buffer from the list and also call the buffer's destructor
	// The buffer's destructor will delete any packets it has queued
	// but it typically wont have any packets queued since we only remove the buffer
	// when it has timedout
	resequencingBuffers_.erase(srcAddr);

}

SequenceNumberBuffer *SequenceNumberResequencer::lookupBuffer(int srcAddr)
{
	LOG(LOUD) << endl;
	// Find the resequencer buffer matching this source address
	ResequencingBufferMap::iterator it = resequencingBuffers_.find(srcAddr);

	if (it == resequencingBuffers_.end()) {
		LOG(LOUD) << "Buffer didn't exist for source " << srcAddr << " so create one" << endl;
		// Instantiate one if it doesn't exist
		SequenceNumberBuffer *buffer = new SequenceNumberBuffer(this);
		resequencingBuffers_[srcAddr] = buffer;

		// Create a new timeout to associate with the buffer
		cMessage *timeoutEvent = new cMessage();
		timeoutEvent->setKind(srcAddr); // use the kind field to identify the buffer it's associated with
		bufferTimeouts_[srcAddr] = timeoutEvent;

		return buffer;
	} else {
		return it->second;
	}
}

cMessage *SequenceNumberResequencer::lookupTimeout(int srcAddr)
{
	// Find the timeout message associated with the resequencing buffer
	BufferTimeoutMap::iterator it = bufferTimeouts_.find(srcAddr);
	ASSERT(it != bufferTimeouts_.end());
	return it->second;
}

void SequenceNumberResequencer::computeMaxExpectedNetworkDelay(cMessage *msg)
{
	// TODO Improve algorithm
	// Simple algorithm: if we observe a packet taking longer to arrive than expected,
	// update the expected maximum network delay accordingly
	simtime_t observedDelay = msg->getArrivalTime() - msg->getTimestamp();
	LOG(LOUD) << "maxExpectedNetworkDelay = " << maxExpectedNetworkDelay_ << " observed delay for packet = " << observedDelay << endl;
	if (observedDelay > maxExpectedNetworkDelay_) maxExpectedNetworkDelay_ = observedDelay;
	LOG(LOUD) << "maxExpectedNetworkDelay = " << maxExpectedNetworkDelay_ << endl;
}


void SequenceNumberResequencer::release(DCN_EthPacket *pkt)
{
	LOG(LOUD) << "sending packet from source " << pkt->getSrcAddr() << " with seq no " << pkt->getSequenceNo() << " to upper layer" << endl;
	 // Send the packet up the networking stack
	 send(pkt, to_upper_layer_);
}

void SequenceNumberResequencer::drop(DCN_EthPacket *pkt)
{
	LOG(LOUD) << "deleting packet from source " << pkt->getSrcAddr() << " with seq no " << pkt->getSequenceNo() << endl;
	// TODO Statistics?
	delete pkt;
}


SequenceNumberResequencer::~SequenceNumberResequencer()
{
	LOG(LOUD) << endl;
	// Delete all the resequencing buffers
	// SequenceNumberBuffer has ownership of and will delete any packets in buffers
    for (ResequencingBufferMap::iterator i=resequencingBuffers_.begin(); i!=resequencingBuffers_.end(); ++i)
    	removeBuffer(i->first);
}

Define_Module(SequenceNumberResequencer);
