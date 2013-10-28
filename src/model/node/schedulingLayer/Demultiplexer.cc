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
#include "Demultiplexer.h"
#include "SchedulingController.h"

Demultiplexer::Demultiplexer()
{

}

void Demultiplexer::initialize()
{
	LOG(DEBUG) << typeid(this).name() << endl;

	// Lookup the scheduling controller
	// Assume that it's a child of the scheduling layer
	// and the scheduling layer is our parent
	controller_ = check_and_cast<SchedulingController*>(getParentModule()->getSubmodule("controller"));

}

void Demultiplexer::handleMessage(cMessage *msg)
{
	// Assume incoming packet is from upper-layer and is a DCN_EthPacket
	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);

	uint destAddr = pkt->getDestAddr();

	// Lookup VOQ corresponding to destination
	cGate *voqGate = lookupVoqGate(destAddr);
	if (voqGate == NULL) {
		// If the gate doesn't exist, notify the controller
		controller_->pktArrivedForNewDestination(destAddr);
		voqGate = lookupVoqGate(destAddr); // Should exist now
	}
	if (voqGate == NULL) opp_error("Demux failed to find VOQ");

	send(pkt, voqGate);
}

cGate * Demultiplexer::lookupVoqGate(uint destAddr)
{
	VOQGateMap::iterator it = voqGates_.find(destAddr);
	if (it == voqGates_.end()) {
		return NULL;
	}
	return it->second;
}

void Demultiplexer::connectToVoq(VirtualOutputQueue *voq)
{
	cGate *outGate;

	// If we have no free gates, we need to allocate a new one
	if (freeVoqGates_.size() == 0)
	{
		LOG(DEBUG) << "Allocating a new gate." << endl;
		int vectorSize = voqGates_.size();
		setGateSize("out", vectorSize+1);
		outGate = gate("out", vectorSize); // get the new gate
	} else {
		LOG(DEBUG) << "There are " << freeVoqGates_.size() << " unused out gates on the freeVoqGates list.\n";
		// Otherwise, we can use a previously allocated unconnected gate
		outGate = freeVoqGates_.front();
		freeVoqGates_.pop_front();
	}

	// Remember voq to gate mapping
	voqGates_[voq->getDestAddr()] = outGate;

	// Connect the new output gate to the new voq's input gate
	cGate *voqInputGate = voq->gate("in");
	outGate->connectTo(voqInputGate);

	LOG(DEBUG) << "Connected out gate " << outGate->getId() - gateBaseId("out") << " to VOQ for destination " << voq->getDestAddr() << endl;
}

void Demultiplexer::disconnectFromVoq(VirtualOutputQueue *voq)
{
	// Find the gate connected to the voq
	cGate *outGate = lookupVoqGate(voq->getDestAddr());

	// Disconnected the gate
	outGate->disconnect();
	voqGates_[voq->getDestAddr()] = NULL;

	// Currently in OMNeT, we can't remove an arbitrary gate from a vector
	// Instead, add it to a free list of gates which we can use to connect new voqs
	freeVoqGates_.push_front(outGate);
}

Demultiplexer::~Demultiplexer()
{

}

Define_Module(Demultiplexer);
