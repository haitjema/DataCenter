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

#ifndef L2QUEUE_H_
#define L2QUEUE_H_

#include "VirtualPacketQueue.h"

/**
 * Point-to-point interface module. While one frame is transmitted,
 * additional frames get queued up; see NED file for more info.
 */
class L2Queue : public cSimpleModule, public cListener
{
  protected:
    long queueSizeBytes;   // Maximum length of the Queue in bytes
    long queueSizePkts; // Maximum length of the Queue in packets
    // Queue will drop packets once either of above limits are exceeded
    // Set to 0 for infinite queue

    //cPacketQueue queue;
    VirtualPacketQueue queue;
    cMessage *endTransmissionEvent;

    // XXX Declare signals public so that when a listener traps them it
    // doesn't have to use getSignalName to figure out what they are which
    // profiling revealed to be a bottleneck.
  public:
    simsignal_t qlenPktsSignal;
    simsignal_t qlenBytesSignal;
    simsignal_t busySignal;
    simsignal_t queueingTimeSignal;
    // Note: dropSignal is in Bytes, no need for a signal in pkts since we can use
    // the count to determine the number of packets emitted.
    simsignal_t dropSignal;
    simsignal_t dropPktSignal; // Instead of # bytes, emit the pkt object (used by modules extending cListener)
    simsignal_t txBytesSignal;
    simsignal_t rxBytesSignal;

    // Interval stats on global signal
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, long l); // For emitting stats on global signal
  protected:
    bool statsOnSignal;
    virtual void emitStats();
    std::vector<long> intvlQueueSizePkts_;
    std::vector<long> intvlQueueSizeBytes_;
    std::vector<long> intvlQueueDrops_;
    std::vector<long> intvlTxBytes_;
    std::vector<long> intvlRxBytes_;
  protected:

    cGate* in_;			// in gate
    cGate* out_;		// out gate
    cGate* line_in_;	// line$i gate
    cGate* line_out_;	// line$o gate

    // XXX Can't call it useDirectMessageSending_ because SwitchPortQueue uses that already to pass msgs to ControlProcessor
    bool useL2L2DirectMessageSending_;
    L2Queue *lineOutDest_;

    cPar *desynchronizeJitterValue; // Add the following jitter value to packets, used to desychronize them
    bool desynchronizeWithPriority; // Desynchronize with scheduling priority (instead of above jitter value)

    cChannel *transmissionChannel_;

    simtime_t sim_time_limit_;
    // XXX TEMP TODO FIXME
    cMessage *dropPacketEvent;
    uint pktsToDrop;

  public:
    L2Queue();
    virtual ~L2Queue();
    virtual void initialize(int stage);
    virtual void handleMessage(cMessage *msg);
    virtual long getQueueSizeBytes() { return queueSizeBytes; }
    virtual long getQueueSizePkts() { return queueSizePkts; }

    virtual void handleMessageDirectLineIn(cMessage *msg);
  protected:
    virtual void startTransmitting(DCN_EthPacket *pkt);
    virtual void finishTransmitting();
    virtual void dropPacket(DCN_EthPacket *pkt);
    virtual void passUpwards(cMessage *msg);

    inline void enqueue(DCN_EthPacket *pkt); // XXX needed because of VirtualPacketQueue in SwitchPortQueue
    inline DCN_EthPacket *dequeue(); // XXX needed because of VirtualPacketQueue in SwitchPortQueue
    virtual void displayStatus(bool isBusy);
};

#define IN_MEASUREMENT_INTERVAL(pkt) (!((pkt->getTimestamp() > sim_time_limit_) || (pkt->getTimestamp() < simulation.getWarmupPeriod())))

#endif /* L2QUEUE_H_ */
