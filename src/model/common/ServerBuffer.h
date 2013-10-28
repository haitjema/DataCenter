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

#ifndef SERVERBUFFER_H_
#define SERVERBUFFER_H_

class ServerBuffer : public cSimpleModule, cListener {
public:
    ServerBuffer();
    virtual ~ServerBuffer();

    virtual void initialize();
    virtual void registerSignals();
    virtual void handleMessage(cMessage *msg);
    virtual void handlePacket(DCN_EthPacket pkt);
    virtual void setDestAddr(uint destAddr) { destAddr_ = destAddr; }
    virtual uint getDestAddr() { return destAddr_; }

    virtual simtime_t getLastActiveTime();

protected:
    // Helper methods
    virtual void drop(DCN_EthPacket *pkt);
    virtual void enqueue(DCN_EthPacket *pkt);
    virtual DCN_EthPacket * dequeue();
    virtual void updateDisplayString();



protected:
    // Attributes
    uint destAddr_;
    cPacketQueue queue_;
    simtime_t lastActiveTime_; // Time at which the queue became empty
    long queueSizePackets; // Maximum length of the Queue in packets
    long queueSizeBytes;   // Maximum length of the Queue in bytes


public:
    // Interval stats on global signal
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, long l); // For emitting stats on global signal
protected:
    virtual void emitStats();
    bool statsOnSignal;
    std::vector<long> intvlQueueSizePkts_;
    std::vector<long> intvlQueueSizeBytes_;
    std::vector<long> intvlQueueDrops_;
    std::vector<long> intvlTxBytes_;
    std::vector<long> intvlRxBytes_;



    // Statistics
    simsignal_t qlenPktsSignal;
    simsignal_t qlenBytesSignal;
    simsignal_t dropSignal;
    simsignal_t dropPktSignal;
    simsignal_t rxBytesSignal;
    simsignal_t txBytesSignal;
};

#endif /* SERVERBUFFER_H_ */
