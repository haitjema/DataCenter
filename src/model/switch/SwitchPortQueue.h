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

#ifndef SWITCHPORTQUEUE_H_
#define SWITCHPORTQUEUE_H_

#include "L2Queue.h"

class ControlProcessor;

class SwitchPortQueue : public L2Queue {
public:
	SwitchPortQueue();
	virtual ~SwitchPortQueue();
	virtual void initialize(int stage);
	virtual void dropPacket(DCN_EthPacket *pkt);
	virtual void updateQueueSize(long queueSizeBytes, long queueSizePkts);
	virtual void handleMessageDirect(cMessage *msg); // Direct method wrapper for handleMessage()
	virtual void passUpwards(cMessage *msg);
	virtual uint getSwitchLevel();
	virtual uint getStage();
	//virtual void handleMessage(cMessage *msg);
protected:
	// If a packet is dropped, these signals tell you the src/dst host of the dropped packet
	simsignal_t dropPktSrcHostSignal;
	simsignal_t dropPktDstHostSignal;
	simsignal_t dropPktPtrSignal;
	simsignal_t updateQueueSizeBytesSignal;
	simsignal_t updateQueueSizePktsSignal;
	ControlProcessor *cp_;
	bool useDirectMsgSending_;
	bool isUpPort; // Am I an upward facing port?
	uint portIndex_;


	// To see which source's packets gets dropped
	/*
	simsignal_t rxPktSrcSignal;
	simsignal_t rxPktDstSignal;
	simsignal_t rxPktPrioritySignal;*/
};

#endif /* SWITCHPORTQUEUE_H_ */
