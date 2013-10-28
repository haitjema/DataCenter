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

#ifndef SERVERPORTQUEUE_H_
#define SERVERPORTQUEUE_H_

#include "ServerStream.h"
#include "BandwidthMeter.h"

#include "L2Queue.h"

class ServerPortQueue : public L2Queue
{
public:
	ServerPortQueue();
	virtual ~ServerPortQueue();
	virtual void initialize(int stage);
	virtual void handleMessage(cMessage *msg);
	virtual void startTransmitting(DCN_EthPacket *pkt);
	virtual void finishTransmitting();
protected:
	uint address_;
	int64_t bitsOnWire;
	bool setTimestamp_;
    BandwidthMeter *rxMeter_;
    BandwidthMeter *txMeter_;
public:
    // XXX These signals are declared public so that when a listener traps them,
    // it doesn't have to use getSignalName to figure out what it is since
    // profiling revealed that to be a bottleneck.
    simsignal_t sendIntervalSignal; // XXX Necessary?
    simsignal_t pktDestTx;
    simsignal_t pktDestRx;
    simsignal_t rxPacketPtrSignal_; // XXX
    simsignal_t txPacketPtrSignal_; // XXX
protected:
	cGate *controlGate_in;
	cGate *controlGate_out;

	// Per stream statistics
	bool recordStreamStatistics_;
	int limitStatsToEveryPServers;
	SendStreamMap sendingStreams; // for streams where we are the sending end point, indexed by other server's address
	ReceiveStreamMap receivingStreams; // for streams where we are the receiving end point, indexed by other server's address
	virtual void recordSendStream(DCN_EthPacket *pkt);
	virtual void recordReceiveStream(DCN_EthPacket *pkt);
};

#endif /* SERVERPORTQUEUE_H_ */
