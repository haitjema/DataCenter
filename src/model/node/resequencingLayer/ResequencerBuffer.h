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

#ifndef RESEQUENCERBUFFER_H_
#define RESEQUENCERBUFFER_H_

#include "HybridResequencer.h"
#include "ServerBuffer.h"

class HybridResequencer;
int timestampComparison(cObject *pkt1, cObject *pkt2);
bool timestampLessThan(simtime_t t1, simtime_t t2);

class ResequencerBuffer : public ServerBuffer {
public:
    ResequencerBuffer();
    virtual ~ResequencerBuffer();
    virtual void initialize();
    virtual void setResquencerPtr(HybridResequencer *resequencerPtr) { resequencer_ = resequencerPtr; }
    virtual void registerSignals();
    virtual void setDelayThreshold(simtime_t delayThreshold);
    virtual void handleMessage(cMessage *msg);

    virtual void handlePacket(DCN_EthPacket *pkt);
    virtual void addSequenceNo(DCN_EthPacket *pkt);
    virtual void handleTimeout();
    virtual simtime_t getNextTimeout() { return timeout_; }

protected:
    // Utility functions
    virtual void incrementSeqNo();
    virtual bool packetIsLate(DCN_EthPacket *pkt);
    virtual void enqueue(DCN_EthPacket *pkt);
    virtual void releaseOrderedPackets();
    virtual void releasePacket(DCN_EthPacket *pkt);
    virtual void updateTimeout();
    virtual void updateDelayWindow(DCN_EthPacket *pkt);
    simtime_t getPacketDelay(DCN_EthPacket *pkt);

protected:
    bool dropOldPackets_;
    cMessage *timeOutEvent_;
    HybridResequencer *resequencer_;
    uint expectedSequenceNo_; // Sequence number we expect from destination
    uint sendingSequenceNo_;  // Sequence number used when sending to destination
    simtime_t delayThreshold_;  // Time after which packets are considered late
    simtime_t maxObservedDelay_;// Min delay observed
    simtime_t minObservedDelay_;// Max delay observed
    simtime_t timeout_;       // Timeout for packet with expected seq. no. to arrive

    simsignal_t rxSeqNoSignal;      // arriving packet sequence number 
    simsignal_t rxTimestampSignal;  // arriving packet timestamp
    simsignal_t txSeqNoSignal;      // released packet timestamp
    simsignal_t txTimestampSignal;  // released packet sequence number
    simsignal_t networkDelaySignal; // delay experienced by packet in network
    simsignal_t reseqDelaySignal;   // delay experienced by packet in resequencer
    simsignal_t reseqDelayAllSignal;   // delay experienced in resequencer (by all packets whether or not they were buffered)
    simsignal_t reseqDelayFracSignal; // fraction of overall delay spent in resequencer
    simsignal_t reseqDelayNetFracSignal; // fraction of delay (net+rsq)
    simsignal_t totalDelaySignal;   // total delay (voq + network + resequencer)
    simsignal_t expSeqNoSignal;     // expected sequence number upon pkt arrival
    simsignal_t OOArrivalSignal;    // difference between arriving and expected seq. #
    simsignal_t OODeliverySignal;   // difference between delivered and expected seq. #
    simsignal_t setTimeoutSignal;   // value of the new timeout
    simsignal_t delayThresholdSignal; // discard pkts older than this time
    simsignal_t latePktSignal;      // timestamp of old pkt - delay threshold
    simsignal_t timeoutSignal;      // length of timeout that occurred
    simsignal_t minDelaySignal;     // min observed delay
    simsignal_t maxDelaySignal;     // max observed delay
};

//typedef ResequencerBuffer HybridResequencerBuffer;
#define HybridResequencerBuffer ResequencerBuffer

#endif /* RESEQUENCERBUFFER_H_ */
