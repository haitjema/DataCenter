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
#include "Multiplexer.h"

Multiplexer::Multiplexer()
{

}

void Multiplexer::initialize()
{
	LOG(DEBUG) << typeid(this).name() << endl;

	outGate_ = gate("out");

	// Lookup the scheduling controller
	// Assume that it's a child of the scheduling layer
	// and the scheduling layer is our parent
	controller_ = check_and_cast<SchedulingController*>(getParentModule()->getSubmodule("controller"));
}

void Multiplexer::handleMessage(cMessage *msg)
{
	// Assume message came from the controller or a VOQ
	// and can just be sent out
	send(msg, outGate_);
}

void Multiplexer::connectToVoq(VirtualOutputQueue *voq)
{
	cGate *inGate;

	// If we have no free gates, we need to allocate a new one
	if (freeVoqGates_.size() == 0)
	{
		LOG(DEBUG) << "Allocating a new gate." << endl;
		int vectorSize = voqGates_.size();
		setGateSize("in", vectorSize+1);
		inGate = gate("in", vectorSize); // get the new gate
	} else {
		LOG(DEBUG) << "There are " << freeVoqGates_.size() << " unused in gates on the freeVoqGates list.\n";
		// Otherwise, we can use a previously allocated unconnected gate
		inGate = freeVoqGates_.front();
		freeVoqGates_.pop_front();
	}

	// Remember voq to gate mapping
	voqGates_[voq->getDestAddr()] = inGate;

	// Connect the new input gate to the new voq's output gate
	cGate *voqInputGate = voq->gate("out");
	voqInputGate->connectTo(inGate);

	LOG(DEBUG) << "Connected in gate " << inGate->getId() - gateBaseId("in") << " to VOQ for destination " << voq->getDestAddr() << endl;
}

void Multiplexer::disconnectFromVoq(VirtualOutputQueue *voq)
{
	// Find the gate connected to the voq
	cGate *inGate = lookupVoqGate(voq->getDestAddr());

	// Disconnected the gate
	voq->gate("out")->disconnect(); // Must be disconnected from the source gate
	voqGates_[voq->getDestAddr()] = NULL;

	// Currently in OMNeT, we can't remove an arbitrary gate from a vector
	// Instead, add it to a free list of gates which we can use to connect new voqs
	freeVoqGates_.push_front(inGate);
}

cGate * Multiplexer::lookupVoqGate(uint destAddr)
{
	VOQGateMap::iterator it = voqGates_.find(destAddr);
	if (it == voqGates_.end()) {
		return NULL;
	}
	return it->second;
}

Multiplexer::~Multiplexer()
{

}

Define_Module(Multiplexer);
