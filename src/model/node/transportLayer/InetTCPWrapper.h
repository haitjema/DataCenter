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

#ifndef INETTCPWRAPPER_H_
#define INETTCPWRAPPER_H_

#include "TCP.h"
#include "InetTCPConnectionWrapper.h"

class InetTCPConnectionWrapper;

cPacket *encapsulateTCPinDCN_EthPacket(cPacket *tcpPacket);
cPacket *decapsulateTCPfromDCN_EthPacket(cPacket *dcnPacket);

class InetTCPWrapper : public INET_API  TCP {
public:
	InetTCPWrapper();
	virtual ~InetTCPWrapper();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);
	virtual void send(cMessage *msg, const char *gatename);
	virtual TCPConnection *createConnection(int appGateIndex, int connId);

protected:
    typedef std::map<AppConnKey,InetTCPConnectionWrapper*> TcpAppConnMap;
    typedef std::map<SockPair,InetTCPConnectionWrapper*> TcpConnMap;
};

#endif /* INETTCPWRAPPER_H_ */
