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

#ifndef SEQUENCENUMBERRESEQUENCER_H_
#define SEQUENCENUMBERRESEQUENCER_H_

#include <map>

int seqNocomparison(cObject *pkt1, cObject *pkt2);
bool seqNoLessThan(uint32 seq1, uint32 seq2);

class SequenceNumberResequencer;
class SequenceNumberBuffer;

// We will use the OMNeT++ Queue class as a priority queue to implement
// the resequencing buffer. To do this, we had to define a comparison
// function that compares the sequence numbers of two packets to
// determine their order in the queue. The priority queue inserts elements
// by searching for their position starting from the back (largest sequence numbers).
// If we assume incoming packets generally arrive with increasing sequence
// numbers than this should be reasonably efficient.
class SequenceNumberBuffer : cQueue
{
public:
	SequenceNumberBuffer(SequenceNumberResequencer *resequencerPtr);
	virtual ~SequenceNumberBuffer();

	virtual void handlePacket(DCN_EthPacket *pkt);
	virtual void handleTimeout();
	virtual simtime_t getNextTimeout() { return timeout_; }

    uint32 getExpectedSequenceNo() const { return expectedSequenceNo_; }
    void setExpectedSequenceNo(uint32 expectedSequenceNo) {expectedSequenceNo_ = expectedSequenceNo; }

protected:
    // Utility functions
    virtual void enqueue(DCN_EthPacket *pkt);
    virtual void releaseOrderedPackets();
    virtual void calculateTimeout();

protected:
    // Attributes
	SequenceNumberResequencer *resequencer_; // Do I need this?
	uint32 expectedSequenceNo_;
	simtime_t timeout_;
};

// The SequenceNumberResequencer dynamically instantiates
// a resequencing buffer for every host it receives traffic from.
// Idle buffers can automatically be removed with a specified timeout (soft-state)
// or explicitly removed by the removeBuffer(int srcAddr) call.
class SequenceNumberResequencer : public cSimpleModule {
public:
	SequenceNumberResequencer();
	virtual ~SequenceNumberResequencer();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);

	virtual void removeBuffer(int srcAddr); // public so that another module may determine when a host is no longer sending to us (e.g. scheduling layer)

	// Used by SequenceNumberBuffer
	simtime_t getMaxExpectedNetworkDelay() { return maxExpectedNetworkDelay_; }
	virtual void release(DCN_EthPacket *pkt); // sends the packet up the stack
	virtual void drop(DCN_EthPacket *pkt); // drop the packet

protected:
	// Utility functions
	virtual void sendToResequencer(cMessage *msg);
	virtual void handleTimeout(cMessage *msg);
	virtual SequenceNumberBuffer *lookupBuffer(int srcAddr);
	virtual cMessage *lookupTimeout(int srcAddr);
	virtual void computeMaxExpectedNetworkDelay(cMessage *);
	virtual void setTimeout(cMessage *timeoutEvent, simtime_t timeoutTime);

protected:
	// Attributes
	typedef std::map<int, SequenceNumberBuffer *> ResequencingBufferMap;
	typedef std::map<int, cMessage*> BufferTimeoutMap;
	ResequencingBufferMap resequencingBuffers_;
	BufferTimeoutMap bufferTimeouts_;

	// Max network delay we expect packets to experience... used to set timeouts
	simtime_t bufferTimeoutTime_;
	simtime_t maxExpectedNetworkDelay_;
	bool adaptiveTimout_;

	// Gates
	cGate* to_lower_layer_;
	cGate* to_upper_layer_;
	cGate* from_lower_layer_;
	cGate* from_upper_layer_;

	// Statistics

};

// Use short constants to identify timeout events rather than long strings to save on memory
#define BUFFER_TIMEOUT "B"
#define SEQUENCE_NO_TIMEOUT "S"

#endif /* SEQUENCENUMBERRESEQUENCER_H_ */
