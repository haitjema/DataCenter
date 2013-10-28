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
#include "InetTCPConnectionWrapper.h"

// From INET
#include "TCPConnection.h"
#include "IPv4ControlInfo.h" // For INET 2 (was IPControlInfo.h)
#include "IPv6ControlInfo.h"

typedef IPv4ControlInfo IPControlInfo; // For INET 2

InetTCPConnectionWrapper::InetTCPConnectionWrapper(InetTCPWrapper *mod, int appGateIndex, int connId) : TCPConnection(mod, appGateIndex, connId)
{
	tcpMain = mod; // May not be necessary
}

// This function is straight up copied from INET's TCPConnectionUtil.cc
// I had to be able to divert the call to tcpMain->send(tcpseg, "ipOut") to invoke
// TCPWrapper->send(...) so that I can encapsulate the TCP packet
// It was either copy this function or define a virtual send() function in INET's TCP class
// This way I'm not modifying INET
void InetTCPConnectionWrapper::sendToIP(TCPSegment *tcpseg)
{
    // record seq (only if we do send data) and ackno
    if (sndNxtVector && tcpseg->getPayloadLength()!=0)
        sndNxtVector->record(tcpseg->getSequenceNo());
    if (sndAckVector)
        sndAckVector->record(tcpseg->getAckNo());

    // final touches on the segment before sending
    tcpseg->setSrcPort(localPort);
    tcpseg->setDestPort(remotePort);
    ASSERT(tcpseg->getHeaderLength() >= TCP_HEADER_OCTETS);     // TCP_HEADER_OCTETS = 20 (without options)
    ASSERT(tcpseg->getHeaderLength() <= TCP_MAX_HEADER_OCTETS); // TCP_MAX_HEADER_OCTETS = 60
    tcpseg->setByteLength(tcpseg->getHeaderLength() + tcpseg->getPayloadLength());
    state->sentBytes = tcpseg->getPayloadLength(); // resetting sentBytes to 0 if sending a segment without data (e.g. ACK)

    tcpEV << "Sending: ";
    printSegmentBrief(tcpseg);

    // TBD reuse next function for sending

    if (!remoteAddr.isIPv6())
    {
        // send over IPv4
        IPControlInfo *controlInfo = new IPControlInfo();
        controlInfo->setProtocol(IP_PROT_TCP);
        controlInfo->setSrcAddr(localAddr.get4());
        controlInfo->setDestAddr(remoteAddr.get4());
        tcpseg->setControlInfo(controlInfo);

        tcpMain->send(tcpseg,"ipOut");
    }
    else
    {
        // send over IPv6
        IPv6ControlInfo *controlInfo = new IPv6ControlInfo();
        controlInfo->setProtocol(IP_PROT_TCP);
        controlInfo->setSrcAddr(localAddr.get6());
        controlInfo->setDestAddr(remoteAddr.get6());
        tcpseg->setControlInfo(controlInfo);

        tcpMain->send(tcpseg,"ipv6Out");
    }
}


InetTCPConnectionWrapper::InetTCPConnectionWrapper() {

}

InetTCPConnectionWrapper::~InetTCPConnectionWrapper() {

}

