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

#ifndef __DATACENTER_MESSAGEAPPLICATION_H_
#define __DATACENTER_MESSAGEAPPLICATION_H_

#include <omnetpp.h>

// This module reads a script file and constructs AppMessage objects from the
// Application-level Messages specified in the script. (See exampleScript.txt)
// If the script does not exist this module can optionally create it.
//
// These messages are then stored in a queue until they can be sent at which point
// they become "Active" and are associated with an ActiveMessage object.
//
// The MessageApplication can assign average sending rates to active messages but the
// ActiveMessage class is responsible for producing message segments and determining
// when these segments are sent.
// I.e. the burstiness and precise interarrival times of segments.
// For efficiency, however, the ActiveMessage objects do not schedule their own events
// to send messages. This module uses one event to do that.

#include "AppMessage.h"
#include "ActiveMessage.h"
#include "ServerStream.h"
#include "ModuleWithControlPort.h"
#include "TrafficPatternGenerator.h"


class MessageApplication : public ModuleWithControlPort
{
  public:
    virtual ~MessageApplication();
	virtual void initialize(int stage);
	int numInitStages() const { return 2; }
    virtual void handleMessage(cMessage *msg);
    virtual void handleControlMessage(ControlMessage *cmsg);
    virtual void finish();

    virtual void sendNextSegment(ActiveMessage *msg); // XXX
    virtual double getLinkRate(); // XXX
    virtual bool sendTimeLimitReached() { return (sendTimeLimit_ && (simTime() > sendTimeLimit_)); }
    //{ return sendTimeLimit_ ? (simTime() > sendTimeLimit_) : false; }
  protected:
    virtual void parseScript(const char *script);
    virtual void activateMessage(AppMessage *appMsg);
    virtual void activateSendStream(uint otherServer);
    virtual void activateReceiveStream(uint otherServer);
    virtual void updateSendStats(DCN_UDPPacket *messageSegment);
    virtual void updateReceiveStats(DCN_UDPPacket *messageSegment);
    virtual void updateSendRates();
    virtual long getPktPayload();
    virtual double getAvgPayload();
    virtual void sendNextSegment();
    virtual void scheduleNextSendEvent();
    simtime_t getNextSendTime(ActiveMessage *actMsg);
    virtual void receiveSegment(DCN_UDPPacket *);

  protected:
    double linkRate_;
    double maxSendRate_; 		// limit on rate of all traffic leaving application
	long payloadSize_;
	bool randomInterArrival_;   // False means uniform traffic spacing (can still use bursty)
	double burstyInjectRate_;
	double avgBurstLen_;
	double avgTimeBetweenBursts_;
	double sendTimeLimit_;
	bool recordStreamStatistics_;
	bool useHardcodedStreamStatistics_;
	int limitStatsToEveryPServers;
	int alt_max_min_; // Needed for alternating max., min. pkt sizes

	TrafficPatternGenerator *trafficGen;

	cMessage *nextMessageArrival;
	cMessage *sendNextSegmentEvent;

	AppMessageVector scheduledMessages;
	ActiveMessageQueue activeMessages;

	simsignal_t txPktToHostSignal; //

	cGate *to_lower_layer_;
    cGate *from_lower_layer_;

	// Per stream statistics
	SendStreamMap sendingStreams; // for streams where we are the sending end point, indexed by other server's address
	ReceiveStreamMap receivingStreams; // for streams where we are the receiving end point, indexed by other server's address
};


#endif
