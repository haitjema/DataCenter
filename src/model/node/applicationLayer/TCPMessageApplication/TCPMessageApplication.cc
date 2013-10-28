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
#include "node_id.h"
#include "FatTreeNode.h"
#include "VirtualIP.h" // for conversion to and from IP addresses
#include "TCPMessageApplication.h"


void TCPThread::established()
{
    LOG(DEBUG) << "Connection established!" << endl;
}

void TCPThread::dataArrived(cMessage *msg, bool urgent)
{
    LOG(DEBUG) << "data arrived!" << endl;
    delete msg;
}

void TCPThread::peerClosed()
{
    LOG(DEBUG) << endl;
    getSocket()->close();
}

void TCPThread::closed()
{
    LOG(DEBUG) << endl;
    hostmod->removeThread(this);
}

void TCPThread::failure(int code)
{
    LOG(DEBUG) << "Failure: code = " << code << endl;
    hostmod->numBroken++;
    hostmod->removeThread(this);
}

void TCPThread::statusArrived(TCPStatusInfo *status)
{
    int state_var = status->getState();
    opp_string stateName_var = status->getStateName();
    IPvXAddress localAddr_var = status->getLocalAddr();
    IPvXAddress remoteAddr_var = status->getRemoteAddr();
    int localPort_var = status->getLocalPort();
    int remotePort_var = status->getRemotePort();
    unsigned int snd_mss_var = status->getSnd_mss();
    unsigned int snd_una_var = status->getSnd_una();
    unsigned int snd_nxt_var = status->getSnd_nxt();
    unsigned int snd_max_var = status->getSnd_max();
    unsigned int snd_wnd_var = status->getSnd_wnd();
    unsigned int snd_up_var = status->getSnd_up();
    unsigned int snd_wl1_var = status->getSnd_wl1();
    unsigned int snd_wl2_var = status->getSnd_wl2();
    unsigned int iss_var = status->getIss();
    unsigned int rcv_nxt_var = status->getRcv_nxt();
    unsigned int rcv_wnd_var = status->getRcv_wnd();
    unsigned int rcv_up_var = status->getRcv_up();
    unsigned int irs_var = status->getIrs();
    bool fin_ack_rcvd_var = status->getFin_ack_rcvd();
    LOG(DEBUG) << "STATUS = " << endl;
    LOG(DEBUG) << "state_var        : " << state_var << endl;
    LOG(DEBUG) << "stateName_var    : " << stateName_var << endl;
    LOG(DEBUG) << "localAddr_var    : " << localAddr_var << endl;
    LOG(DEBUG) << "remoteAddr_var   : " << remoteAddr_var << endl;
    LOG(DEBUG) << "localPort_var    : " << localPort_var << endl;
    LOG(DEBUG) << "remotePort_var   : " << remotePort_var << endl;
    LOG(DEBUG) << "snd_mss_var      : " << snd_mss_var << endl;
    LOG(DEBUG) << "snd_una_var      : " << snd_una_var << endl;
    LOG(DEBUG) << "snd_nxt_var      : " << snd_nxt_var << endl;
    LOG(DEBUG) << "snd_max_var      : " << snd_max_var << endl;
    LOG(DEBUG) << "snd_wnd_var      : " << snd_wnd_var << endl;
    LOG(DEBUG) << "snd_up_var       : " << snd_up_var << endl;
    LOG(DEBUG) << "snd_wl1_var      : " << snd_wl1_var << endl;
    LOG(DEBUG) << "snd_wl2_var      : " << snd_wl2_var << endl;
    LOG(DEBUG) << "iss_var          : " << iss_var << endl;
    LOG(DEBUG) << "rcv_nxt_var      : " << rcv_nxt_var << endl;
    LOG(DEBUG) << "rcv_wnd_var      : " << rcv_wnd_var << endl;
    LOG(DEBUG) << "rcv_up_var       : " << rcv_up_var << endl;
    LOG(DEBUG) << "irs_var          : " << irs_var << endl;
    LOG(DEBUG) << "fin_ack_rcvd_var : " << fin_ack_rcvd_var << endl;
    delete status;
}

Register_Class(TCPThread);

void TCPThreadSend::sendPacket(uint numBytes)
{
    LOG(DEBUG) << "Sending message " << numBytes <<  " bytes" << endl;
    cPacket *msg = new cPacket();
    msg->setByteLength(numBytes);
    sock->send(msg);
}

Register_Class(TCPThreadSend);

void TCPThreadReceive::established()
{
    LOG(DEBUG) << "Connection established!" << endl;
    destination_ = convertIPAddressToDC(sock->getRemoteAddress().get4());
    LOG(DEBUG) << "remote address = " << destination_ << endl;
}

Register_Class(TCPThreadReceive);

void TCPMessageApplication::initialize(int stage)
{
    MessageApplication::initialize(stage);
    if (stage != 0) return;
    tcpIn_ = gate("tcpIn");
    tcpOut_ = gate("tcpOut");

    numSessions = numBroken = packetsSent = packetsRcvd = bytesSent = bytesRcvd = 0;
    WATCH(numSessions);
    WATCH(numBroken);
    WATCH(packetsSent);
    WATCH(packetsRcvd);
    WATCH(bytesSent);
    WATCH(bytesRcvd);

    getStatusEvent = new cMessage();
    scheduleAt(simTime() + par("getStatusPeriod"), getStatusEvent);

    IPAddress addr = convertDCAddressToIP(address_);
    serverSocket.setOutputGate(tcpOut_);
    serverSocket.bind(addr, (int)par("listenPort").longValue());
    serverSocket.listen();
}

void TCPMessageApplication::handleMessage(cMessage *msg)
{
    if (msg->getArrivalGate() == tcpIn_) {
        TCPSocket *socket = socketMap.findSocketFor(msg);
        if (!socket) { socket = incomingConnection(msg); }
        socket->processMessage(msg);
    } else if (msg == getStatusEvent) {
        getAllSocketStatus();
        scheduleAt(simTime() + par("getStatusPeriod"), getStatusEvent);
    } else {
        MessageApplication::handleMessage(msg);
    }
}

void TCPMessageApplication::getAllSocketStatus()
{
    // XXX Decide which one to use:

    SocketMap *smap = socketMap.getSocketMap();
    for (SocketMap::iterator iter = smap->begin(); iter != smap->end(); iter++) {
        TCPSocket *sock = iter->second;
        sock->requestStatus();
    }
    /*
    for (TCPRcvThreadMap::const_iterator iter = rcvThreadMap.begin(); iter != rcvThreadMap.end(); iter++) {
        TCPThreadReceive* proc= iter->second;
        if (!proc) { opp_error("proc is not set!"); }
        TCPSocket *sock = proc->getSocket();
        if (!sock) { opp_error("proc->socket not set!"); }
        sock->requestStatus();
    }
    for (TCPSndThreadMap::iterator iter = sndThreadMap.begin(); iter != sndThreadMap.end(); iter++) {
        TCPThreadSend *proc = iter->second;
        if (!proc) { opp_error("proc is not set!"); }
        TCPSocket *sock = proc->getSocket();
        if (!sock) { opp_error("proc->socket not set!"); }
        sock->requestStatus();
    }*/
}

void TCPMessageApplication::activateMessage(AppMessage *appMsg)
{
    outgoingConnection(appMsg);
    return;
}

TCPSocket* TCPMessageApplication::outgoingConnection(AppMessage *appMsg)
{
    LOG(DEBUG) << "New outgoing connection!" << endl;
    // new connection -- create new socket object and server process
    TCPSocket *socket = new TCPSocket();
    socket->setOutputGate(tcpOut_);
    IPAddress addr = convertDCAddressToIP(address_);
    IPAddress daddr = convertDCAddressToIP(appMsg->destination);
    int bindPort = 20000 + appMsg->destination; // Ephemeral port... doesn't matter what the value is, just needs to be unique
    socket->bind(IPvXAddress(addr), bindPort);
    int connectPort = par("listenPort");
    LOG(DEBUG) << "issuing OPEN command for " << appMsg->destination << "\n";
    socket->connect(daddr, connectPort);
    TCPThreadSend *proc = check_and_cast<TCPThreadSend *>(createOne("TCPThreadSend")); // XXX Probably no real good reason to use the factory here
    socket->setCallbackObject(proc);
    proc->init(this, socket, appMsg->destination);
    sndThreadMap[appMsg->destination] = proc;
    socketMap.addSocket(socket);

    // XXX Deal with below issue more cleanly
    #define MAX_APP_MSG 2000000000
    if (appMsg->messageSize > MAX_APP_MSG) {
        appMsg->messageSize = MAX_APP_MSG;
        LOG(WARN) << "Warning, appMsg reduced to " << MAX_APP_MSG << " because TCP breaks if much larger." << endl;
    }
    proc->sendPacket(appMsg->messageSize);
    return socket;
}

TCPSocket* TCPMessageApplication::incomingConnection(cMessage *msg)
{
    LOG(DEBUG) << "New incoming connection!" << endl;
    // new connection -- create new socket object and server process
    TCPSocket* socket = new TCPSocket(msg);
    socket->setOutputGate(tcpOut_);
    TCPThreadReceive *proc = check_and_cast<TCPThreadReceive *>(createOne("TCPThreadReceive")); // XXX Probably no real good reason to use the factory here
    socket->setCallbackObject(proc);
    uint destination = convertIPAddressToDC(socket->getRemoteAddress().get4());
    proc->init(this, socket, destination);
    socketMap.addSocket(socket);
    rcvThreadMap[destination] = proc;
    return socket;
}

void TCPMessageApplication::removeThread(TCPThread *thread)
{
    LOG(DEBUG) << "Removing 'thread'" << endl;
    // remove socket
    socketMap.removeSocket(thread->getSocket());
    if (typeid(thread) == typeid(TCPThreadReceive)) {
        rcvThreadMap.erase(thread->getDestination());
    } else {
        sndThreadMap.erase(thread->getDestination());
    }
    // remove thread object
    delete thread;
    //updateDisplay();
}

void TCPMessageApplication::finish()
{
    EV << getFullPath() << ": opened " << numSessions << " sessions\n";
    EV << getFullPath() << ": sent " << bytesSent << " bytes in " << packetsSent << " packets\n";
    EV << getFullPath() << ": received " << bytesRcvd << " bytes in " << packetsRcvd << " packets\n";

    recordScalar("number of sessions", numSessions);
    recordScalar("packets sent", packetsSent);
    recordScalar("packets rcvd", packetsRcvd);
    recordScalar("bytes sent", bytesSent);
    recordScalar("bytes rcvd", bytesRcvd);
}

TCPMessageApplication::~TCPMessageApplication()
{
    cancelAndDelete(getStatusEvent);
}

Define_Module(TCPMessageApplication);
