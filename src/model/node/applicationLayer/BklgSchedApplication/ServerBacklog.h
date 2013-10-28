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

#ifndef SERVERBACKLOG_H_
#define SERVERBACKLOG_H_

#include "ServerStream.h"
#include "AppMessage.h"


// What do I want?
// The total send/receive backlog at any moment
// Ability to know when all messages have been received
// A message basically corresponds to f_ij^t
// Each send backlog basically represents b_ij if i is this server
// Each receive backlog basically represents b_ij if j is this server
// I want to keep track of the number of b_ij, don't care about individual messages
// Lets start by just keeping track of the number of bytes here


class SendBacklog : public SendStream {
public:
    SendBacklog();
    virtual ~SendBacklog();
    virtual void initialize();
    virtual void record(DCN_EthPacket *pkt);
    virtual void recordDrop(DCN_EthPacket *pkt);
    //virtual const char *bklgSigname() { return "sndBklgBytes"; }
    virtual void copyMessages(AppMessageVector &toSend);

    long toSndBytes_; // effectively f_i,j^(t,+)
    long sntBytes_;   // effectively f_i,j^(0,t)
    long bytesLost_;
    simsignal_t toSndBytesSignal_;
    simsignal_t sntBytesSignal_;
    simsignal_t finishTimeSignal_;

    std::vector<long> intvlSntBytes_;
    virtual void emitStats();

    //simsignal_t bklgSignal_;
    //std::vector<AppMessage> toSend_;
    //std::vector<AppMessage> areSent_;
    //AppMessage msgCurSnd_; // Copy of the message currently being sent
};

class ReceiveBacklog : public ReceiveStream {
public:
    ReceiveBacklog();
    virtual ~ReceiveBacklog();
    virtual void initialize();
    virtual void record(DCN_EthPacket *pkt);
    virtual void recordDrop(DCN_EthPacket *pkt);
    //virtual const char *bklgSigname() { return "rcvBklgBytes"; }
    virtual void copyMessages(AppMessageVector &toReceive);

    virtual void emitStats();
    std::vector<long> intvlRcvBytes_;

    long toRcvBytes_; // effectively br_i,j^(0,t) + f_i,j^(t,+)
    long rcvBytes_; // effectively r_i,j^(0,t)
    long bytesLost_;
    simsignal_t toRcvBytesSignal_;
    simsignal_t rcvBytesSignal_;
    simsignal_t finishTimeSignal_;

    //simsignal_t bklgSignal_;
    //std::vector<AppMessage> toReceive_;
    //std::vector<AppMessage> areReceived_;
    //AppMessage msgCurRcv_; // Copy of the message currently being received
};

typedef std::map<uint, SendBacklog *> SendBacklogMap;
typedef std::map<uint, ReceiveBacklog *> ReceiveBacklogMap;

#endif /* SERVERBACKLOG_H_ */
