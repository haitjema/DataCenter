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
#include "node_id.h"
#include "HybridResequencer.h"

HybridResequencer::HybridResequencer()
{

}

void HybridResequencer::initialize()
{
    //FatTreeNode::initialize();
    LOG(LOUD) << typeid(this).name() << endl;
	maxExpectedNetworkDelay_ = par("AgeThreshold");
	adaptiveAgeThreshold_ = par("UseAdaptiveAgeThreshold");
	ignoreSchedulingPackets_ = par("ignoreSchedulingPackets");
	clockSkew_ = par("ClockSkew");
	bufferTimeoutTime_ = par("BufferTimeout");
	if (bufferTimeoutTime_ == 0) bufferTimeoutTime_ = MAXTIME;
	CheckBufferTimeoutEvent_ = new cMessage();
	address_ = par("address");
	//WATCH(resequencingBuffers_); XXX Make it so I can watch

    to_lower_layer_ = gate("lower_layer$o");
	to_upper_layer_ = gate("upper_layer$o");
	from_lower_layer_ = gate("lower_layer$i");
	from_upper_layer_ = gate("upper_layer$i");
}

void HybridResequencer::handleMessage(cMessage *msg)
{
	if (msg->getArrivalGate() == from_lower_layer_)
	{
		// Packet came in from the network and might be out of order
		LOG(LOUD) << "packet arrived from lower layer " << endl;

		// If adaptive timeout is enabled, update the expected maximum delay used for setting timeouts
		//if (adaptiveAgeThreshold_) computeMaxExpectedNetworkDelay(msg);

		// Send it to the resequencer corresponding to the sender of the pkt
		sendToResequencer(msg);
	}
	else if (msg->getArrivalGate() == from_upper_layer_)
	{
		LOG(LOUD) << "packet arrived from upper layer " << endl;

		// Add sequence number
		addSequenceNumber(msg);

		// Simply forward messages from the upper layer
		send(msg, to_lower_layer_);

	} else if (msg == CheckBufferTimeoutEvent_) {

	    checkBufferTimeout();
	    if (!resequencingBuffers_.empty()) { scheduleAt(simTime() + bufferTimeoutTime_, CheckBufferTimeoutEvent_); }

	}
	else {
		opp_error("Unexpected message");
	}
}

void HybridResequencer::checkBufferTimeout()
{
    // Run through the list of resequencing buffers and see if any need to be timedout
    LOG(DEBUG) << endl;

    for (ResequencingBufferMap::iterator it = resequencingBuffers_.begin(); it != resequencingBuffers_.end(); it++) {
        HybridResequencerBuffer *buffer = it->second;
        LOG(DEBUG) << "Checking timeout for buffer corresponding to destination " << buffer->getDestAddr() << endl;
        if (simTime() - buffer->getLastActiveTime() > bufferTimeoutTime_) {
            LOG(DEBUG) << "VOQ is timed out. Last active at time " << buffer->getLastActiveTime() << endl;
            removeBuffer(buffer->getDestAddr());
        }
    }
}

void HybridResequencer::sendToResequencer(cMessage *msg)
{
	// Pass the packet to the resequencer corresponding to the sender of the packet
	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);
	if (!pkt->isDataPacket() && ignoreSchedulingPackets_) { release(pkt); return; }// send(pkt, to_upper_layer_); return;

	// Lookup the buffer & associated timeout event
	HybridResequencerBuffer *buffer = lookupBuffer(pkt->getSrcAddr());

	LOG(LOUD) << "Found resequencer buffer for source " << pkt->getSrcAddr() << endl;

	// Let the resequencing buffer decide whether the packet arrived
	// in-order or if it needs to be enqueued
	buffer->handlePacket(pkt);
}

void HybridResequencer::addSequenceNumber(cMessage *msg)
{
	// The resequencer buffer also stores the sequence number
	// that we use to send packets to this destination

	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);
	if (!pkt->isDataPacket() && ignoreSchedulingPackets_) return;

	HybridResequencerBuffer *buffer = lookupBuffer(pkt->getDestAddr());

	LOG(LOUD) << "Found resequencer buffer for destination " << pkt->getDestAddr() << endl;

	buffer->addSequenceNo(pkt);
}


void HybridResequencer::release(DCN_EthPacket *pkt)
{
    Enter_Method("release packet");
    take(pkt);
	LOG(LOUD) << "sending packet from source " << pkt->getSrcAddr() << " with timestamp " << pkt->getTimestamp()
			  << " and seq no " << pkt->getSequenceNo() << " to upper layer" << endl;
	 // Send the packet up the networking stack
	send(pkt, to_upper_layer_);
}

void HybridResequencer::drop(DCN_EthPacket *pkt)
{
    // XXX Not generally used, let resequencer buffer's drop packets
	LOG(LOUD) << "deleting packet from source " << pkt->getSrcAddr() << " with seq no " << pkt->getSequenceNo() << endl;
	delete pkt;
}

HybridResequencerBuffer *HybridResequencer::lookupBuffer(int srcAddr)
{
	LOG(LOUD) << endl;
	// Find the resequencer buffer matching this source address
	ResequencingBufferMap::iterator it = resequencingBuffers_.find(srcAddr);

	if (it == resequencingBuffers_.end()) {
		LOG(LOUD) << "Buffer didn't exist for source " << srcAddr << " so create one" << endl;
		// Instantiate one if it doesn't exist
		//HybridResequencerBuffer *buffer = new HybridResequencerBuffer(this);
		std::stringstream bufferName; bufferName << "resequencer_" << srcAddr << "->" << address_;
		cModuleType *moduleType = cModuleType::get("datacenter.model.node.resequencingLayer.ResequencerBuffer");
		cModule *mod = moduleType->createScheduleInit(bufferName.str().c_str(), this);
		HybridResequencerBuffer *buffer = check_and_cast<HybridResequencerBuffer*>(mod);
		buffer->setResquencerPtr(this);
		buffer->setDestAddr(srcAddr);
		//buffer->setAgeThreshold(maxExpectedNetworkDelay_); // Every buffer computes this themselves
		buffer->registerSignals();

		if (!CheckBufferTimeoutEvent_->isScheduled()) { scheduleAt(simTime() + bufferTimeoutTime_, CheckBufferTimeoutEvent_); }

		resequencingBuffers_[srcAddr] = buffer;

		return buffer;
	} else {
		return it->second;
	}
}

void HybridResequencer::computeMaxExpectedNetworkDelay(cMessage *msg)
{
	// TODO Improve algorithm
	// Simple algorithm: if we observe a packet taking longer to arrive than expected,
	// update the expected maximum network delay accordingly
//	simtime_t observedDelay = msg->getArrivalTime() - msg->getTimestamp();
//	LOG(LOUD) << "maxExpectedNetworkDelay = " << maxExpectedNetworkDelay_ << " observed delay for packet = " << observedDelay << endl;
//	if (observedDelay > maxExpectedNetworkDelay_) maxExpectedNetworkDelay_ = observedDelay;
//	LOG(LOUD) << "maxExpectedNetworkDelay = " << maxExpectedNetworkDelay_ << endl;
}

void HybridResequencer::removeBuffer(uint srcAddr)
{
	LOG(LOUD) << endl;
	HybridResequencerBuffer *buf = lookupBuffer(srcAddr);
	buf->deleteModule();
	//delete buf;
	resequencingBuffers_.erase(srcAddr);
}

/*
void HybridResequencer::removeBuffer(HybridResequencerBuffer *buf)
{
    uint srcAddr = buf->getSrcAddress();
    delete buf;
    resequencingBuffers_.erase(srcAddr);
}*/

void HybridResequencer::finish()
{
    for (ResequencingBufferMap::iterator i=resequencingBuffers_.begin(); i!=resequencingBuffers_.end(); ++i) {
        removeBuffer(i->first);
    }
}

HybridResequencer::~HybridResequencer()
{
	LOG(LOUD) << endl;
	// Delete all the resequencing buffers
	// SequenceNumberBuffer has ownership of and will delete any packets in buffers
    /*for (ResequencingBufferMap::iterator i=resequencingBuffers_.begin(); i!=resequencingBuffers_.end(); ++i) {
    	removeBuffer(i->first);
    }*/
    resequencingBuffers_.clear();
    cancelAndDelete(CheckBufferTimeoutEvent_);
}

Define_Module(HybridResequencer);
