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

#ifndef DEMULTIPLEXER_H_
#define DEMULTIPLEXER_H_

#include "SchedulingController.h"
class SchedulingController;
class VirtualOutputQueue;


// This module just keeps track of which gate corresponds to which VOQ
// The controller does all the work of actually managing the VOQs

class Demultiplexer : public cSimpleModule {
public:
	Demultiplexer();
	virtual ~Demultiplexer();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);

	virtual void connectToVoq(VirtualOutputQueue *voq);
	virtual void disconnectFromVoq(VirtualOutputQueue *voq);

protected:
	// Helper methods
	cGate * lookupVoqGate(uint destAddr);

protected:
	// Attributes
	SchedulingController *controller_;
	VOQGateMap voqGates_;
	GateList freeVoqGates_;
};

#endif /* DEMULTIPLEXER_H_ */
