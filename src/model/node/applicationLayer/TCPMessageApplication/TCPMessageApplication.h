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

#ifndef TCPMESSAGEAPPLICATION_H_
#define TCPMESSAGEAPPLICATION_H_

#include "MessageApplication.h"
#include "TCPSrvHostApp.h"

class TCPMessageApplication;
class TCPThread;
class TCPThreadReceive;
class TCPThreadSend;

typedef std::map<int,TCPSocket*> SocketMap;
class TCPSocketMap2 : public TCPSocketMap {
public:
    SocketMap* getSocketMap() { return &socketMap; }
};

typedef std::map<uint, TCPThreadReceive *> TCPRcvThreadMap;
typedef std::map<uint, TCPThreadSend *> TCPSndThreadMap;


class TCPMessageApplication : public MessageApplication {
public:
    virtual ~TCPMessageApplication();
    virtual void initialize(int stage);
    virtual void activateMessage(AppMessage *appMsg);
    virtual void scheduleNextSendEvent() {}
    cGate *tcpIn_;
    cGate *tcpOut_;

public:
    virtual void handleMessage(cMessage *msg);
    virtual TCPSocket* incomingConnection(cMessage *msg);
    virtual TCPSocket* outgoingConnection(AppMessage *appMsg);
    virtual void removeThread(TCPThread *thread);
    virtual void getAllSocketStatus();
    virtual void finish();


protected:
    TCPSocket serverSocket;
    TCPSocketMap2 socketMap;
    TCPRcvThreadMap rcvThreadMap;
    TCPSndThreadMap sndThreadMap;
    cMessage *getStatusEvent;
public:
    // XXX TODO decide how to deal with statistics
    // statistics
    int numSessions;
    int numBroken;
    int packetsSent;
    int packetsRcvd;
    int bytesSent;
    int bytesRcvd;
};

class TCPThread : public TCPServerThreadBase {
    protected:
        TCPMessageApplication *hostmod;
        uint destination_;
    public:
        //virtual void setDestination(uint destination) { destination_ = destination; }
        virtual uint getDestination() { return destination_; }
        virtual void init(TCPMessageApplication *hostmodule, TCPSocket *socket, uint destination) {hostmod=hostmodule; sock=socket; destination_ = destination; }
        virtual void established();
        virtual void dataArrived(cMessage *msg, bool urgent);
        virtual void timerExpired(cMessage *timer) { }
        virtual void peerClosed();
        virtual void closed();
        virtual void failure(int code);
        virtual void statusArrived(TCPStatusInfo *status);
};

class TCPThreadReceive : public TCPThread {
    protected:
       TCPMessageApplication *hostmod;
    public:
       virtual void established();
};

class TCPThreadSend : public TCPThread {
    protected:
       TCPMessageApplication *hostmod;
    public:
       virtual void sendPacket(uint numBytes);
};


#endif /* TCPMESSAGEAPPLICATION_H_ */
