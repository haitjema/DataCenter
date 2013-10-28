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
#include "InetTCPWrapper.h"

// From INET
#include "IPv4ControlInfo.h" // For INET 2, added v4
#include "IPv4Datagram.h" // For INET 2, added v4
#include "IPvXAddress.h"

typedef IPv4ControlInfo IPControlInfo; // For INET 2
typedef IPv4Address IPAddress;

cPacket *encapsulateTCPinDCN_EthPacket(cPacket *tcpPacket)
{
	//cPacket *tcpPacket = check_and_cast<cPacket *>(DCN_TCPPacket);

    IPControlInfo *controlInfo = check_and_cast<IPControlInfo*>(tcpPacket->removeControlInfo());
    DCN_IPPacket *ipPacket = new DCN_IPPacket();

    // DCN_EthPacket includes Ethernet frame size and minimum
    ipPacket->encapsulate(tcpPacket);
    // The encapsulate function is going to add the length of the tcpPacket to the ipPacket
    // We need to set the ipPacket's payload to the tcpPacket's length instead so that min. packet size is handled correctly
    ipPacket->setPayloadLengthBytes(tcpPacket->getByteLength());

    // set source and destination address
    IPAddress srcAddrIP = controlInfo->getSrcAddr();
    IPAddress destAddrIP = controlInfo->getDestAddr();

    // NOTE:
    // In my model addresses simply correspond to the host number.
    // TCP, however, uses IP addresses. I cannot simply treat host numbers as IP addresses
    // because 0 is an invalid address.
    // However, I believe that as far as TCP is concerned, 0 is the only invalid address.
    // For now lets have IP addresses simply correspond to the host address + 1
    //LOG(DEBUG) << "srcAddrIP = " << srcAddrIP.getInt() << " destAddrIP = " << destAddrIP.getInt() << endl;

    ipPacket->setSrcAddr(srcAddrIP.getInt() - 1); // XXX Should use the conversion functions I added to VirtualIP.h
    ipPacket->setDestAddr(destAddrIP.getInt() - 1);
    ipPacket->setTransportProtocol(controlInfo->getProtocol());

    delete controlInfo;

    return ipPacket;
}

cPacket *decapsulateTCPfromDCN_EthPacket(cPacket *dcnPacket)
{
	DCN_IPPacket *ipPacket = check_and_cast<DCN_IPPacket *>(dcnPacket);
    // decapsulate transport packet
    cPacket *tcpPacket = ipPacket->decapsulate();

    // create and fill in control info
    IPControlInfo *controlInfo = new IPControlInfo();
    // IP addresses are host addresses shifted up 1 (see encapsulate)
    IPAddress srcAddrIP(ipPacket->getSrcAddr() + 1); // XXX Should use the conversion functions I added to VirtualIP.h
    IPAddress destAddrIP(ipPacket->getDestAddr() + 1);

    //LOG(DEBUG) << "srcAddrIP = " << srcAddrIP.getInt() << " destAddrIP = " << destAddrIP.getInt() << endl;

    controlInfo->setProtocol(ipPacket->getTransportProtocol());
    controlInfo->setSrcAddr(srcAddrIP);
    controlInfo->setDestAddr(destAddrIP);
    controlInfo->setDiffServCodePoint(0);

    // attach control info
    tcpPacket->setControlInfo(controlInfo);

    delete ipPacket;

    return tcpPacket;
}

InetTCPWrapper::InetTCPWrapper()
{

}

void InetTCPWrapper::initialize()
{
	TCP::initialize(0);
}

void InetTCPWrapper::handleMessage(cMessage *msg)
{
    if (msg->arrivedOn("ipIn"))
    {
    	cModule *arrivalModule = msg->getArrivalModule();
    	int arrivalGate = msg->getArrivalGateId();
    	msg = decapsulateTCPfromDCN_EthPacket(check_and_cast<cPacket *>(msg));
    	msg->setArrival(arrivalModule, arrivalGate); // Need to fool TCP into thinking the decpasulated message arrived on ipIn
    }

	TCP::handleMessage(msg);
}

void InetTCPWrapper::send(cMessage *msg, const char *gatename)
{
	if (strcmp(gatename, "ipOut") == 0)
	{
		msg = encapsulateTCPinDCN_EthPacket(check_and_cast<cPacket *>(msg));
	}

	TCP::send(msg, gatename);
}

TCPConnection * InetTCPWrapper::createConnection(int appGateIndex, int connId)
{
    return new InetTCPConnectionWrapper(this, appGateIndex, connId);
}

InetTCPWrapper::~InetTCPWrapper()
{

}

Define_Module(InetTCPWrapper);
