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

#ifndef CONTROLPROCESSOR_H_
#define CONTROLPROCESSOR_H_

#include "FatTreeNode.h"

class SwitchPortQueue;

class ControlProcessor :  public FatTreeNode
{
public:
	virtual void initialize();
	virtual void handleMessage(cMessage *msg);
	virtual ~ControlProcessor();
	virtual void downPortDirectIn(cMessage *msg, uint port);
	virtual void upPortDirectIn(cMessage *msg, uint port);
	virtual uint getSwitchLevel() { return depth_; }
	virtual uint getNumLevels() { return node_id_.getDepth(); }

protected:
	// NED specified parameters:
	simtime_t processingDelay_;
	std::string switch_id_;
	uint switchIndex_;
	uint depth_;

	// Number of each type of port
	int number_of_down_ports_;
	int number_of_up_ports_;

	// Base gate ID for each type of port
	int down_port_in_base_id_;
	int down_port_out_base_id_;
	int up_port_in_base_id_;
	int up_port_out_base_id_;

	std::vector<SwitchPortQueue*> downPortQueues_;
	std::vector<SwitchPortQueue*> upPortQueues_;
	bool useDirectMsgSending_;

	bool IsDownPort(int gate_id);
	bool IsUpPort(int gate_id);
	int lookupGateID(uint destAddr, uint path);
	SwitchPortQueue* lookupQueue(uint destAddr, uint path);
	int lookup(uint destAddr, uint path);
	void localDelivery(cMessage *msg);
	void flood(cMessage *msg);
	void updateQueueSize(cMessage *msg);

};


#endif /* CONTROLPROCESSOR_H_ */
