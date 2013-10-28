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

#ifndef BKLGSCHEDAPPLICATION_H_
#define BKLGSCHEDAPPLICATION_H_

#include "MessageApplication.h"
#include "ServerBacklog.h"

// This module is used to evaluate backlog scheduling.
// A backlog schedule can be represented by the script file used by the existing MessageApplication
// module. While that module keeps track of the messages being sent to other servers, it mostly
// ignores incoming messages from other servers.
// This module extends the M.A. to keep track of the backlog that we expect to receive
// and have currently received. In addition to enabling us to track additional stats such as
// the send/receive backlog, this allows us to terminate the simulation when the
// backlog schedule has finished.

class BklgSchedApplication : public MessageApplication, public cListener
{
public:
    BklgSchedApplication();
    virtual ~BklgSchedApplication();
    virtual void initialize(int stage);
    virtual void handleMessage(cMessage *msg);
    virtual void finish();
    int numInitStages() const { return 2; }
    virtual void AllocateBacklogStats();
    virtual void activateMessage(AppMessage *appMsg);
    virtual void sendNextSegment(ActiveMessage *msg);
    virtual void receiveSegment(DCN_UDPPacket *);
    // Listener interface
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, cObject *obj);
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, const SimTime& t);

    virtual long bytesToSend();
    virtual long bytesToReceive();
    virtual long bytesSent();
    virtual long bytesReceived();
    virtual void check_finished();
    virtual void activateSendStream(uint otherServer);
    virtual void activateReceiveStream(uint otherServer);
    virtual void updateSendStats(DCN_UDPPacket *messageSegment);
    virtual void updateReceiveStats(DCN_UDPPacket *messageSegment);

protected:
    virtual void parseScript(const char *script);
    cMessage *curMsg;
    cMessage *emitIntvlStatsEvent_;
    simtime_t statsInterval;
    simsignal_t intvlStatsSignal;
    AppMessageVector msgsToReceive;
    SendBacklogMap sndBklg;
    ReceiveBacklogMap rcvBklg;
    simsignal_t finishTimeSignal;
    uint leftToFinish_; // Used by the first server to track when all servers have finished
};



#endif /* BKLGSCHEDAPPLICATION_H_ */
