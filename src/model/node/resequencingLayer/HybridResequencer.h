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

#ifndef HYBRIDRESEQUENCER_H_
#define HYBRIDRESEQUENCER_H_

#include <map>
#include "FatTreeNode.h"
#include "ResequencerBuffer.h"

class HybridResequencerBuffer;

class HybridResequencer : public cSimpleModule //: public FatTreeNode
{
public:
	HybridResequencer();
	virtual ~HybridResequencer();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);
	//virtual void removeBuffer(int srcAddr); // public so that another module may determine when a host is no longer sending to us (e.g. scheduling layer)
	virtual void checkBufferTimeout();
	//virtual void removeBuffer(HybridResequencerBuffer *buf);
	virtual void removeBuffer(uint srcAddr);
	virtual void finish();

	virtual void release(DCN_EthPacket *pkt); // sends the packet up the stack
	virtual void drop(DCN_EthPacket *pkt); // drop the packet

protected:
	// Utility Functions
	virtual void sendToResequencer(cMessage *msg);
	virtual void addSequenceNumber(cMessage *msg);
	virtual HybridResequencerBuffer *lookupBuffer(int srcAddr);
	virtual void computeMaxExpectedNetworkDelay(cMessage *msg);

public:
    // Max network delay we expect packets to experience... used to set timeouts
    simtime_t bufferTimeoutTime_;
    simtime_t clockSkew_; // XXX movehis to time based?
    simtime_t maxExpectedNetworkDelay_;
    bool ignoreSchedulingPackets_;
    bool adaptiveAgeThreshold_;

protected:
	// Attributes
	typedef std::map<int, HybridResequencerBuffer *> ResequencingBufferMap;
	ResequencingBufferMap resequencingBuffers_;
	cMessage *CheckBufferTimeoutEvent_;
	uint address_;
	// Gates
	cGate* to_lower_layer_;
	cGate* to_upper_layer_;
	cGate* from_lower_layer_;
	cGate* from_upper_layer_;
};


// No changes, just set a static ageThreshold
//class SeqNoResequencer : public HybridResequencer
//{

//};

// Instantiate only one queue and ignore sequence numbers
//class TimeBasedResequencer : public HybridResequencer
//{

//};

#endif /* HYBRIDRESEQUENCER_H_ */
