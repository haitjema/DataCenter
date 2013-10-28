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

#ifndef VIRTUALOUTPUTQUEUE_H_
#define VIRTUALOUTPUTQUEUE_H_

#include "ServerBuffer.h"
#include "SchedulingController.h"
class VirtualOutputQueue;
class SchedulingController;
class SchedulingPacket;

class TimeAvgRec { // Based off of the OMNeT++ TimeAverageRecorder code
protected:
    simtime_t startTime;
    simtime_t lastTime;
    double lastValue;
    double weightedSum;
public:
    TimeAvgRec() { startTime = lastTime = -1; lastValue = weightedSum = 0;}
    virtual void clear() { startTime = lastTime = -1; lastValue = weightedSum = 0; }
    virtual double getTimeAvg();
    virtual void collect(simtime_t_cref t, double value);
};

class VirtualOutputQueue : public ServerBuffer {
public:
	VirtualOutputQueue();
	virtual ~VirtualOutputQueue();

	virtual void initialize();
	virtual void registerSignals();
	virtual void handleMessage(cMessage *msg);

	virtual void setSendingRate(uint64 sendRate);
	virtual uint64 getSendingRate() { return sendingRate_; }
	virtual void sendSchedulingPacket(SchedulingPacket *pkt);
	virtual uint64 getBacklog() { return queue_.getByteLength(); }

protected:
	// Helper methods
	void sendPacket(DCN_EthPacket *pkt, bool isScheduling=false);
	virtual void scheduleNextTransmission(uint64 bitsToSend);
	virtual void updateDisplayString();

protected:
	cGate *outGate_;
	uint address_;
	cMessage *sendNextPacketEvent_; // Time at which VOQ is free to send the next packet
	uint64 sendingRate_; // Current sending rate in bps
	uint curPktSizeBits_; // Size of current packet being transmitted

public:
	// Accounting for control overhead
	bool noSchedAccounting_;
	bool queueSchedPkts_; // Whether or not to send scheduling packets immediately or to have them enqueued
protected:

	// Emit stats periodically based on a glbl signal rather than on every event
	std::vector<long> intvlTxBytesSched_;
	std::vector<long> intvlTxBytesData_;
	TimeAvgRec intvlRates_;
	virtual void emitStats();

	// Statistics
	simsignal_t txBytesSchedSignal;
	simsignal_t txBytesDataSignal;
	simsignal_t adjustSendingRateSignal;
	simsignal_t voqDelaySignal;   // delay experienced by packet in VOQ
	// XXX These statistics are specific to the AlgBklgProp module (backlog proportional algorithm)
	// I need to handle these properly and restructure this when/if I have time
public:
	void emitBPState(double reqRate, double allocRate, double recRate);
	simsignal_t reqRateSignal;
	simsignal_t allocRateSignal;
	simsignal_t recRateSignal;
};


#endif /* VIRTUALOUTPUTQUEUE_H_ */
