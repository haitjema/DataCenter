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

#ifndef INETTCPCONNECTIONWRAPPER_H_
#define INETTCPCONNECTIONWRAPPER_H_

// To encapsulate TCP packets before sending them I need to trap the packets
// on TCP's send call. TCPConnection is the class that TCP's send method.
// Unfortunately when TCPConnection calls send, it calls send() in TCP and not
// in my wrapper class because send was not declared as a virtual in TCP.
// This means that in order to call my wrapper's send I have to either
// modify INET's TCP class or write a wrapper that extends their TCPConnection class

#include "TCPConnection.h"
#include "InetTCPWrapper.h"

class InetTCPWrapper;

class InetTCPConnectionWrapper : public TCPConnection {
public:
	InetTCPConnectionWrapper();
	InetTCPConnectionWrapper(InetTCPWrapper *mod, int appGateIndex, int connId);
	virtual ~InetTCPConnectionWrapper();
	virtual void sendToIP(TCPSegment *tcpseg);
protected:
	InetTCPWrapper *tcpMain; // TCP module
};

#endif /* INETTCPCONNECTIONWRAPPER_H_ */
