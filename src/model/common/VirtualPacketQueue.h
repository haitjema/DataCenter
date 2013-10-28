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

#ifndef VIRTUALPACKETQUEUE_H_
#define VIRTUALPACKETQUEUE_H_

// Memory can be a real problem when running large simulations.
// Memory is most commonly a problem when simulating traffic at high offered load
// because there can be large number (e.g. millions) of packets sitting in queues and
// every packet object can require on the order of 100-200 bytes of memory.

// The virtual packet stores select fields from packets and discards the original object
// whenever a packet needs to be queued.
// When removing a packet from the queue, a new packet instance dynamically and its
// attributes are populated with the relevant fields that were stored.
// This can save a large amount of memory since often not all the meta data associated
// with a packet is needed in a given simulation.

// XXX TODO Expand to store packets in both the cPacketQueue and the
// virtual packet queue (QueuedPkts_).
// Making both queues appear as a single queue requires adding the lengths
// of both queues as well as some way of determining which of the two queues
// the nth packet was placed into (e.g. array or bitmap with entry n
// corresponding to packet n)

// While it does not store packets, it extends cPacketQueue so that it provides the same interface
class VirtualPacketQueue : public cPacketQueue {
public:
    VirtualPacketQueue();
    virtual ~VirtualPacketQueue();
    virtual void setEnabled(bool enabled) { enabled_ = enabled; }

    // XXX Not all of cPacketQueue's methods are supported/listed here yet
    virtual void insert(cPacket *pkt);
    //virtual void insertBefore(cPacket *where, cPacket *pkt) { opp_error("VirtualPacketQueue::insertBefore(...) is not yet implemented!"); }
    //virtual void insertAfter(cPacket *where, cPacket *pkt) { opp_error("VirtualPacketQueue::insertAfter(...) is not yet implemented!"); }
    //virtual cPacket *remove(cPacket *pkt) { opp_error("VirtualPacketQueue::remove(...) is not yet implemented!"); return NULL; }
    virtual cPacket *pop_back(); // Not part of the cPacketQueue API
    virtual cPacket *pop(); // pop's from front
    //virtual cPacket *front() const  { opp_error("VirtualPacketQueue::front(...) is not yet implemented!"); return NULL; }
    //virtual cPacket *back() const { opp_error("VirtualPacketQueue::back(...) is not yet implemented!"); return NULL; }

    virtual int getLength() const;
    int64 getBitLength() const;//  {return bitlength;}
    int64 getByteLength() const;//  {return (bitlength+7)>>3;}

protected:
    struct DCN_Pkt_Fields {
        // Because compiler will pad, declare largest items types first
        int64 timestamp;
        // Leave sequenceNo as int (e.g. do not crop it to short) because of wrap-around logic
        unsigned int sequenceNo;
        unsigned short srcAddr; // Store source and destination address as shorts
        unsigned short dstAddr;
        unsigned short payload;
        unsigned short path;
        unsigned short kind;
    };
    cPacket *constructDcnPkt(DCN_Pkt_Fields &pFields);
    typedef std::deque<DCN_Pkt_Fields> DCN_Pkt_Queue;
    DCN_Pkt_Queue QueuedPkts_;
    bool enabled_; // If not enabled, places packets into the regular cPacketQueue
    int64 vpqBitLength_;
};

#endif /* VIRTUALPACKETQUEUE_H_ */
