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
#include "ServerBuffer.h"

using namespace DC;

ServerBuffer::ServerBuffer()
{

}

void ServerBuffer::initialize()
{
    LOG(DEBUG) << typeid(this).name() << endl;
    destAddr_ = 0;
    queueSizePackets = par("queueSizePackets");
    queueSizeBytes = par("queueSizeBytes");
    lastActiveTime_ = simTime();
    statsOnSignal = par("emitStatsOnGlobalSignal");
    if (statsOnSignal) simulation.getSystemModule()->subscribe("EmitStats", this);
}

void ServerBuffer::registerSignals()
{
    qlenPktsSignal      = registerSignal("qlenPkts");
    qlenBytesSignal     = registerSignal("qlenBytes");
    dropSignal          = registerSignal("drop");
    dropPktSignal       = registerSignal("dropPkt");
    rxBytesSignal       = registerSignal("rxBytes");
    txBytesSignal       = registerSignal("txBytes");
}

void ServerBuffer::handleMessage(cMessage *msg)
{
    // No gates to receive packets from
}

void ServerBuffer::handlePacket(DCN_EthPacket pkt)
{
    Enter_Method("Get last active time");
}

void ServerBuffer::enqueue(DCN_EthPacket *pkt)
{
    // Enforce max packet size if specified
    if ( (queueSizePackets && queue_.length()>=queueSizePackets) ||
         (queueSizeBytes && ( (queue_.getByteLength() + pkt->getByteLength()) > queueSizeBytes)) )
    {
        //emit(dropSignal, (long)pkt->getByteLength());
        //delete pkt;
        drop(pkt);
        return;
    }

    queue_.insert(pkt);
    updateDisplayString();
    if (!statsOnSignal) {
        emit(qlenPktsSignal, (long)queue_.getLength());
        emit(qlenBytesSignal, (long)queue_.getByteLength());
    } else {
        intvlQueueSizePkts_.push_back((long)queue_.getLength());
        intvlQueueSizeBytes_.push_back((long)queue_.getByteLength());
    }
}

DCN_EthPacket * ServerBuffer::dequeue()
{
    if (queue_.getLength() == 0) return NULL;
    DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(queue_.pop());
    if (!statsOnSignal) {
        emit(qlenPktsSignal, (long)queue_.getLength());
        emit(qlenBytesSignal, (long)queue_.getByteLength());
    } else {
        intvlQueueSizePkts_.push_back((long)queue_.getLength());
        intvlQueueSizeBytes_.push_back((long)queue_.getByteLength());
    }
    updateDisplayString();
    return pkt;
}

void ServerBuffer::updateDisplayString()
{
    // Set the graphics to show the current backlog and sending rate
    char displayStr_[128];
    sprintf(displayStr_, "buffer size: %lu bytes", (long unsigned int)queue_.getByteLength());
    getDisplayString().setTagArg("t", 0, displayStr_);
}

simtime_t ServerBuffer::getLastActiveTime()
{
    // If packets in queue, VOQ is still active
    if (queue_.length() > 0) {
        return simTime();
    } else {
        // Time when queue became empty
        return lastActiveTime_;
    }
}

void ServerBuffer::drop(DCN_EthPacket *pkt)
{
    take(pkt);
    LOG(DEBUG) << "dropping packet " << pkt << endl;
    if (!statsOnSignal) {
        emit(dropSignal, (long)pkt->getByteLength());
    } else {
        intvlQueueDrops_.push_back((long)pkt->getByteLength());
    }
    emit(dropPktSignal, pkt); // Always emit this because some other modules listen for it
    delete pkt;
}

void ServerBuffer::receiveSignal(cComponent *source, simsignal_t signalID, long l)
{
    emitStats();
}

void ServerBuffer::emitStats()
{
    // Emit average values over the interval
    emit(qlenPktsSignal, sum(intvlQueueSizePkts_));
    emit(qlenBytesSignal, sum(intvlQueueSizeBytes_));
    emit(dropSignal, sum(intvlQueueDrops_));
    emit(txBytesSignal, sum(intvlTxBytes_));
    emit(rxBytesSignal, sum(intvlRxBytes_));
    // Clear the stats for the next round
    intvlQueueSizePkts_.clear();
    intvlQueueSizeBytes_.clear();
    intvlQueueDrops_.clear();
    intvlTxBytes_.clear();
    intvlRxBytes_.clear();
}

ServerBuffer::~ServerBuffer()
{
    if (statsOnSignal) unsubscribe("EmitStats", this);
}

Define_Module(ServerBuffer);
