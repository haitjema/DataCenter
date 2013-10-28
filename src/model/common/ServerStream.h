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

#ifndef SERVERSTREAM_H_
#define SERVERSTREAM_H_


class Stream : public cSimpleModule, cListener
{
  public:
    //Stream() {}
    virtual ~Stream();
    virtual void initialize();
    virtual void finish();
    virtual const char *bytesSigname() = 0;
    virtual void useHardCodedStatistics(bool); // XXX Must call this function to finish initializing
    virtual void record(DCN_EthPacket *pkt);
    // Interval stats on global signal
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, long l); // For emitting stats on global signal
  public:
    // Periodic stats based on global signal
    bool statsOnSignal;
    virtual void emitStats();
    std::vector<long> intvlBytes_;
    // Hardcoded statistics
    bool useHardcodedStreamStatistics_;
    cOutVector *byteVector;
    long totalBytes;
    simtime_t sim_time_limit_;

  protected:
    simsignal_t byteSignal_;
    simsignal_t pathSignal_;
};

class SendStream : public Stream
{
  public:
    //SendStream();
    virtual ~SendStream() {}
    virtual void initialize();
    virtual void record(DCN_EthPacket *pkt);
    virtual const char *bytesSigname() { return "streamTxBytes"; }
  protected:
    simsignal_t txTimestampSignal_;
    //simsignal_t txPacketPtrSignal_; // XXX
};

class ReceiveStream : public Stream
{
  public:
    //ReceiveStream();
    virtual ~ReceiveStream();
    virtual void initialize();
    virtual void finish();
    const char *bytesSigname() { return "streamRxBytes"; }
    const char *latencySigname() { return "streamRxLatency"; }
    void useHardCodedStatistics(bool);
    virtual void record(DCN_EthPacket *pkt);

  public:
    cDoubleHistogram *pktLatencyHist;

  protected:
    simtime_t newestTimeStamp;
    simsignal_t outOfOrderSignal_;
    simsignal_t latencySignal_;
    simsignal_t pktSeqNoSignal_;
    simsignal_t rxTimestampSignal_;
    //simsignal_t rxPacketPtrSignal_; // XXX
};

typedef std::map<uint, SendStream *> SendStreamMap;
typedef std::map<uint, ReceiveStream *> ReceiveStreamMap;

// Macro for deciding whether or not to collect stream stats for the given server.
// Must define limitStatsToEveryPServers as a int to match the limitStatsToEveryPServers parameter in the ned file.
#define IS_PTH_SERVER(server) ((limitStatsToEveryPServers == 0) || ((server % limitStatsToEveryPServers) == 0))

/*
// Dynamically manage stream statistics
class StreamStatistics : public cSimpleModule
{
public:
    StreamStatistics(bool useHardcoded);
    virtual ~StreamStatistics();
protected:
    // Per stream statistics
    SendStreamMap sendingStreams; // for streams where we are the sending end point, indexed by other server's address
    ReceiveStreamMap receivingStreams; // for streams where we are the receiving end point, indexed by other server's address
};
*/

#endif /* SERVERSTREAM_H_ */
