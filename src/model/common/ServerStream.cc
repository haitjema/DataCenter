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
#include "ServerStream.h"

Define_Module(SendStream);
Define_Module(ReceiveStream);


void Stream::initialize()
{
    LOG(DEBUG) << endl;
    byteVector = NULL;
    //byteSignal_ = 0; // simsignal_t is just an int
    byteSignal_ = registerSignal(bytesSigname());
    pathSignal_ = registerSignal("streamPktPath");
    LOG(DEBUG) << "registering signal " << bytesSigname() << endl;
    totalBytes = 0;
    WATCH(totalBytes);
    sim_time_limit_ = par("simTimeLimit");
    // Simple way to disable the check on sim_time_limit, set to max time when not specified
    if (sim_time_limit_ == 0) { sim_time_limit_ = MAXTIME; }
    statsOnSignal = par("emitStatsOnGlobalSignal");
    if (statsOnSignal) simulation.getSystemModule()->subscribe("EmitStats", this);
    useHardcodedStreamStatistics_=false; // XXX by default until useHardCodedStatistics() is called
}

void Stream::useHardCodedStatistics(bool isTrue)
{
    LOG(DEBUG) << "isTrue = " << isTrue << endl;
    useHardcodedStreamStatistics_ = isTrue;
    if (isTrue) {
        std::stringstream streamName; streamName << bytesSigname() << ":sum";
        byteVector = new cOutVector(streamName.str().c_str());
    } else {
        //byteSignal_ = registerSignal(bytesSigname());
    }
}

void Stream::receiveSignal(cComponent *source, simsignal_t signalID, long l)
{
    emitStats();
}

void Stream::emitStats()
{
    // Emit average values over the interval
    emit(byteSignal_, sum(intvlBytes_));
    // Clear the stats for the next round
    intvlBytes_.clear();
}

void Stream::record(DCN_EthPacket *pkt)
{
    LOG(DEBUG) << "record packet, src=" << pkt->getSrcAddr() << " dst=" << pkt->getDestAddr() << " bytes=" << pkt->getByteLength();

    //if (sim_time_limit_) {
        // Don't collect stats if time is > my sim_time_limit
    //    if (simTime() > sim_time_limit_) { return; }
        // Don't collect stats if time is < warmup period
    //    else if (simTime() < simulation.getWarmupPeriod()) { return; }
    //}
    // Do not record if the packet is to be sent or was sent after the sim_time_limit
    if (pkt->getTimestamp() > sim_time_limit_) {
        LOG(DEBUG) << "Ignoring packet because it was sent at time " << pkt->getTimestamp() << " which is after sim_time_limit = " << sim_time_limit_ << endl;
        return;
    }

    LOG(DEBUG) << "Recording packet " << *pkt << endl;

    long bytes = pkt->getByteLength();
    if (useHardcodedStreamStatistics_) {
        if (simTime() >= simulation.getWarmupPeriod()) { totalBytes += bytes; }
        byteVector->record(bytes);
    } else if (statsOnSignal) {
        intvlBytes_.push_back(bytes);
        //intvlPath_.push_back(pkt->getPath());// can't do this one
    } else {
        emit(byteSignal_, bytes);
        emit(pathSignal_, pkt->getPath());
    }
}



void Stream::finish()
{
    if (useHardcodedStreamStatistics_) { recordScalar(bytesSigname(), totalBytes); }
}

Stream::~Stream()
{
    if (statsOnSignal) unsubscribe("EmitStats", this);
    if (byteVector) { delete byteVector; }
}

void SendStream::initialize()
{
    Stream::initialize();
    txTimestampSignal_ = registerSignal("txTimestamp");
    //txPacketPtrSignal_ = registerSignal("txPacketPtr"); // XXX
}

void SendStream::record(DCN_EthPacket *pkt)
{
    Stream::record(pkt);
    emit(txTimestampSignal_, pkt->getTimestamp());
    //emit(txPacketPtrSignal_, pkt); // XXX
}


void ReceiveStream::initialize()
{
    LOG(DEBUG) << endl;
    Stream::initialize();
    pktLatencyHist = NULL;
    newestTimeStamp = 0; // Should cause it to initialize to the timestamp of the first packet that arrives
    outOfOrderSignal_ = registerSignal("outOfOrderArrival");
    pktSeqNoSignal_ = registerSignal("pktSeqNo");
    rxTimestampSignal_ = registerSignal("rxTimestamp");
    latencySignal_ = 0; // simsignal_t is just an int
    latencySignal_ = registerSignal(latencySigname());
    //rxPacketPtrSignal_ = registerSignal("rxPacketPtr"); // XXX
    LOG(DEBUG) << "registering signal " << latencySigname() << endl;
}

void ReceiveStream::useHardCodedStatistics(bool isTrue)
{
    Stream::useHardCodedStatistics(isTrue);
    if (isTrue)  {
        pktLatencyHist = new cDoubleHistogram(latencySigname());
    } else {
        //latencySignal_ = registerSignal(latencySigname());
    }
}

void ReceiveStream::record(DCN_EthPacket *pkt)
{
    // Ignore packets sent after my sim_time_limit
    if (pkt->getTimestamp() > sim_time_limit_) {
        simtime_t temp = simTime();
        LOG(DEBUG) << "Ignoring packet because it was sent at time " << pkt->getTimestamp() << " which is after sim_time_limit = " << sim_time_limit_ << endl;
        return;
    }
    // Also ignore packets sent before we restarted recording
    if (pkt->getTimestamp() < simulation.getWarmupPeriod()) {
        simtime_t temp = simTime();
        LOG(DEBUG) << "Ignoring packet because it was sent at time " << pkt->getTimestamp() << " which is before warmup interval = " << simulation.getWarmupPeriod() << endl;
        return;
    }

    //emit(rxPacketPtrSignal_, pkt); // XXX
    emit(rxTimestampSignal_, pkt->getTimestamp());
    emit(pktSeqNoSignal_, pkt->getSequenceNo());
    LOG(DEBUG) << "Simtime = " << simTime() << " and pkt->getTimestamp() = " << pkt->getTimestamp() << " and newestTimeStamp = " << newestTimeStamp << endl;
    if (pkt->getTimestamp() < newestTimeStamp) {
        // Packet arrived out of order
        LOG(DEBUG) << "Packet arrived out of order by " << newestTimeStamp - pkt->getTimestamp() << endl;
        emit(outOfOrderSignal_, newestTimeStamp - pkt->getTimestamp());
    } else {
        newestTimeStamp = pkt->getTimestamp();
    }

    LOG(DEBUG) << "Recording received packet " << *pkt << endl;
    Stream::record(pkt);
    simtime_t latency = simTime() - pkt->getTimestamp();
    LOG(DEBUG) << "record packet, latency=" << latency << endl;
    if (useHardcodedStreamStatistics_) {
        if (pktLatencyHist) { pktLatencyHist->collect(latency); }
    } else {
        emit(latencySignal_, latency);
    }
}


void ReceiveStream::finish()
{
    Stream::finish();
    if (pktLatencyHist) {
        recordStatistic(pktLatencyHist, latencySigname());
    }
}

ReceiveStream::~ReceiveStream()
{

    if (pktLatencyHist) { delete pktLatencyHist; }
}


/*
StreamStatistics::StreamStatistics()
{

}

StreamStatistics::~StreamStatistics()
{
    for (SendStreamMap::iterator it=sendingStreams.begin() ; it != sendingStreams.end(); it++ ) { it->second->deleteModule(); }
    sendingStreams.clear();
    for (ReceiveStreamMap::iterator it=receivingStreams.begin() ; it != receivingStreams.end(); it++ ) { it->second->deleteModule(); }
    receivingStreams.clear();
}*/
