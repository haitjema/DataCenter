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

#ifndef SCHEDULINGCONTROLLER_H_
#define SCHEDULINGCONTROLLER_H_

class SchedulingController;

// Types used by demux/mux
typedef std::list<cGate *> GateList;
typedef std::map<int, cGate *> VOQGateMap;

#include "ModuleWithControlPort.h"
#include "Demultiplexer.h"
#include "Multiplexer.h"
#include "VirtualOutputQueue.h"
#include "SchedulingAlgorithm.h"

typedef std::map<int, VirtualOutputQueue*> VOQMap;

class VirtualOutputQueue;
class Demultiplexer;
class Multiplexer;
class SchedulingAlgorithm;

class SchedulingController : public ModuleWithControlPort {
public:
	SchedulingController();
	virtual ~SchedulingController();

    virtual void initialize(int stage);
    int numInitStages() const { return 2; }
	virtual void handleMessage(cMessage *msg);

	// Methods
	virtual void pktArrivedForNewDestination(uint destAddr);
	virtual VirtualOutputQueue *lookupVoq(uint destAddr);
	virtual void sendSchedulingPacket(SchedulingPacket *sPkt);
	virtual void broadcastSchedulingPacket(SchedulingPacket *sPkt);
	virtual void handleControlMessage(ControlMessage *cmsg);

protected:
	// Helper Methods
	virtual void scheduleVoqTimeout();
	virtual void checkVoqTimeout();
	virtual void allocateVoq(uint destAddr);
	virtual void removeVoq(uint destAddr);

public:
	VOQMap voqMap_; // XXX

	uint64 linkRate;

	bool sendSchedPktAsControl_;
	bool enforceBacklogConstraint_;
protected:
	// Attributes
	SchedulingAlgorithm *schedulingAlgorithm_;
	simtime_t VOQTimeout_;


	Demultiplexer *demux_;
	Multiplexer *mux_;

	cMessage *CheckVOQTimeoutEvent_;

	cGate *inGate_, *outGate_;
	uint address_;
};

#endif /* SCHEDULINGCONTROLLER_H_ */
