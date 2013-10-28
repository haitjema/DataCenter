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
#include "ServerBacklog.h"

Define_Module(SendBacklog);
Define_Module(ReceiveBacklog);

SendBacklog::SendBacklog()
{
}

void SendBacklog::initialize()
{
    SendStream::initialize();
    toSndBytes_ = 0; sntBytes_ = 0; bytesLost_ = 0;
    toSndBytesSignal_ = registerSignal("BytesToSend");
    sntBytesSignal_ = registerSignal("BytesSent");
    // Call it flowFinishTime so it's easy to distinguish from the server finishTime
    finishTimeSignal_ = registerSignal("flowFinishTime");
    //bklgSignal_ = registerSignal(bklgSigname());
}

void SendBacklog::copyMessages(AppMessageVector &toSend)
{
    //for (AppMessageVector::iterator it = toSend.begin(); it != toSend.end(); it++) {
        //AppMessage cpy = *(*it); toSend_.push_back(cpy);
        //toSndBytes_ += (*it)->messageSize;
    //}
}

void SendBacklog::record(DCN_EthPacket *pkt)
{
    if (pkt) {
        SendStream::record(pkt);
        //emit(txTimestampSignal_, pkt->getTimestamp());
        DCN_UDPPacket *upkt = check_and_cast<DCN_UDPPacket*>(pkt);
        long bytes = upkt->getByteLength() - upkt->getOverheadBytes();
        sntBytes_ += bytes; //pkt->getByteLength();
        toSndBytes_ -= bytes; //pkt->getByteLength();
        if (statsOnSignal) { intvlSntBytes_.push_back(bytes); }
    } // record can be called without a packet if all appMsg->messageSize values were 0
    if (!statsOnSignal) {
        emit(sntBytesSignal_, sntBytes_);
        emit(toSndBytesSignal_, toSndBytes_);
    }
    if (!toSndBytes_) { emit(finishTimeSignal_, simTime()); }
}

void SendBacklog::recordDrop(DCN_EthPacket *pkt)
{
    // XXX TODO FINISH
    // Not important to do anything here...
}

void SendBacklog::emitStats()
{
    emit(sntBytesSignal_, sum(intvlSntBytes_));
    intvlSntBytes_.clear();
    SendStream::emitStats();
}

SendBacklog::~SendBacklog()
{
}



ReceiveBacklog::ReceiveBacklog()
{
}

void ReceiveBacklog::initialize()
{
    ReceiveStream::initialize();
    toRcvBytes_ = 0; rcvBytes_ = 0; bytesLost_ = 0;
    toRcvBytesSignal_ = registerSignal("BytesToReceive");
    rcvBytesSignal_ = registerSignal("BytesReceived");
    finishTimeSignal_ = registerSignal("flowFinishTime");

    //bklgSignal_ = registerSignal(bklgSigname());
}

void ReceiveBacklog::copyMessages(AppMessageVector &toReceive)
{
    //for (AppMessageVector::iterator it = toReceive.begin(); it != toReceive.end(); it++) {
        //AppMessage cpy = *(*it); toReceive_.push_back(cpy);
    //    toRcvBytes_ += (*it)->messageSize;
    //}
}

void ReceiveBacklog::record(DCN_EthPacket *pkt)
{
    if (pkt) {
        ReceiveStream::record(pkt);
        DCN_UDPPacket *upkt = check_and_cast<DCN_UDPPacket*>(pkt);
        long bytes = upkt->getByteLength() - upkt->getOverheadBytes();
        rcvBytes_ += bytes; //pkt->getByteLength();
        toRcvBytes_ -= bytes; //pkt->getByteLength();
        //emit(txTimestampSignal_, pkt->getTimestamp());
        if (statsOnSignal) {
            intvlRcvBytes_.push_back(bytes);
        }
    } // record can be called without a packet if all appMsg->messageSize values were 0
    if (!statsOnSignal) {
        emit(rcvBytesSignal_, rcvBytes_);
        emit(toRcvBytesSignal_, toRcvBytes_);
    }
    if (!toRcvBytes_) { emit(finishTimeSignal_, simTime()); }
}

void ReceiveBacklog::recordDrop(DCN_EthPacket *pkt)
{
    if (pkt->isDataPacket()) {
        DCN_UDPPacket *upkt = check_and_cast<DCN_UDPPacket*>(pkt);
        long bytes = upkt->getByteLength() - upkt->getOverheadBytes();
        bytesLost_ += bytes;
    }

}

void ReceiveBacklog::emitStats()
{
    emit(rcvBytesSignal_, sum(intvlRcvBytes_));
    intvlRcvBytes_.clear();
    ReceiveStream::emitStats();
}


ReceiveBacklog::~ReceiveBacklog()
{
}

