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

#include "DCCommon.h"
#include "VirtualPacketQueue.h"

VirtualPacketQueue::VirtualPacketQueue()
{
    enabled_ = false;
    vpqBitLength_ = 0;
    setTakeOwnership(true); // XXX Necessary?
}

int64 VirtualPacketQueue::getBitLength() const
{
    if (enabled_) {
        return vpqBitLength_;
    } else {
        return cPacketQueue::getBitLength();
    }
}

int64 VirtualPacketQueue::getByteLength() const
{
    return getBitLength()/8;
}


int VirtualPacketQueue::getLength() const
{
    if (enabled_) {
        uint numPkts = QueuedPkts_.size();
        return numPkts;
        //return QueuedPkts_.size();
    } else {
        return cPacketQueue::getLength();
    }
}

void VirtualPacketQueue::insert(cPacket *pkt)
{
    if (!enabled_) { cPacketQueue::insert(pkt); return; }

    take(pkt); // Take ownership because we will delete it
    //addLen(pkt);
    vpqBitLength_ += pkt->getBitLength();
    DCN_EthPacket *dp = check_and_cast<DCN_EthPacket*>(pkt);
    DCN_Pkt_Fields p;
    p.srcAddr = dp->getSrcAddr();
    p.dstAddr = dp->getDestAddr();
    p.path = dp->getPath();
    p.payload = dp->getPayload();
    p.timestamp = dp->getTimestamp().raw();
    p.sequenceNo = dp->getSequenceNo();
    p.kind = dp->getKind();
    QueuedPkts_.push_back(p);
    dropAndDelete(pkt);
    //delete pkt;
}

cPacket *VirtualPacketQueue::pop()
{
    if (!enabled_) { return cPacketQueue::pop(); }

    DCN_Pkt_Fields p = QueuedPkts_.front(); QueuedPkts_.pop_front();
    cPacket *pkt = constructDcnPkt(p);
    vpqBitLength_ -= pkt->getBitLength();
    return pkt;
}

cPacket *VirtualPacketQueue::pop_back()
{
    if (!enabled_) {
        return remove(back());
    } else {
        DCN_Pkt_Fields p = QueuedPkts_.back(); QueuedPkts_.pop_back();
        cPacket *pkt = constructDcnPkt(p);
        vpqBitLength_ -= pkt->getBitLength();
        return pkt;
    }
}

cPacket *VirtualPacketQueue::constructDcnPkt(DCN_Pkt_Fields &pFields)
{
    DCN_EthPacket *pkt;
    switch (pFields.kind)
    {
        case DCN_ETH_PACKET:
            pkt = new DCN_EthPacket;
            break;
        case DCN_SCHEDULING_PACKET:
            opp_error("not supported!");
            break;
        case DCN_IP_PACKET:
            pkt = new DCN_IPPacket;
            break;
        case DCN_UDP_PACKET:
            pkt = new DCN_UDPPacket;
            break;
        case DCN_TCP_PACKET:
            pkt = new DCN_TCPPacket;
            break;
        default:
            break;
    }
    simtime_t timestamp; timestamp.setRaw(pFields.timestamp);
    pkt->setSrcAddr(pFields.srcAddr);
    pkt->setDestAddr(pFields.dstAddr);
    pkt->setPath(pFields.path);
    pkt->setPayloadLengthBytes(pFields.payload);
    pkt->setTimestamp(timestamp);
    pkt->setSequenceNo(pFields.sequenceNo);
    return pkt;
}

VirtualPacketQueue::~VirtualPacketQueue()
{

}

Register_Class(VirtualPacketQueue);
