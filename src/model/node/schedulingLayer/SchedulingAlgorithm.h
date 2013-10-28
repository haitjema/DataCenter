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

#ifndef SCHEDULINGALGORITHM_H_
#define SCHEDULINGALGORITHM_H_

#include "SchedulingPacket.h"
#include "SchedulingController.h"
#include "VirtualOutputQueue.h"

class SchedulingController;
class VirtualOutputQueue;

class SchedulingAlgorithm : public cSimpleModule
{
	public:
		// The following are required because we subclassed from cOwnedObject
		virtual ~SchedulingAlgorithm();
	    virtual void initialize(int stage);
	    int numInitStages() const { return 2; }

		// Called after the controller has allocated a VOQ
		virtual void newVoqAllocated(VirtualOutputQueue *voq);
		// Called before the controller removes a VOQ
		virtual void voqTimedOut(VirtualOutputQueue *voq);
		// Called when the controller receives a scheduling packet
		virtual void handleSchedulingPacket(SchedulingPacket *pkt);
	protected:
		SchedulingController *controller_;
		uint address_;
	protected:
	    uint64 linkRate_;
	    uint64 rxRateToAllocate_;
	    uint64 txRateToAllocate_;
	    uint64 minVoqSendRate_;
	    uint64 reserveBandwidth_;
	    double OversubscriptionFactor_;
	    typedef std::map<int, uint64> SchedRateMap;
	    typedef std::map<int, uint64> SchedBacklogMap;
	    SchedRateMap serverRateAssignments_;
	    SchedBacklogMap serverBacklogs_;
};

#endif /* SCHEDULINGALGORITHM_H_ */
