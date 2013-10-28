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
// XXX TODO add include for TCPSegment
#include "NetworkLayerBase.h"

Define_Module(NetworkLayerBase);

NetworkLayerBase::NetworkLayerBase()
{

}

void NetworkLayerBase::initialize()
{
	tcpGateIn_ = gate("tcp$i");
	tcpGateOut_ = gate("tcp$o");
	udpGateIn_ = gate("udp$i");
	udpGateOut_ = gate("udp$o");
	lowerLayerIn_ = gate("lower_layer$i");
	lowerLayerOut_ = gate("lower_layer$o");
}

void NetworkLayerBase::handleMessage(cMessage *msg)
{
	LOG(DEBUG) << "msg arrived on gate " << msg->getArrivalGate() << " and tcpGateIn_ = " << tcpGateIn_ << "" << endl;
	LOG(DEBUG) << "msg arrived on gate " << msg->getArrivalGate()->getName() << endl;
	if (msg->getArrivalGate() == lowerLayerIn_) {
		DCN_IPPacket *ipPacket = check_and_cast<DCN_IPPacket *>(msg);
		if (ipPacket->getTransportProtocol() == IP_PROT_UDP) {
			toUdp(ipPacket);
		} else if (ipPacket->getTransportProtocol() == IP_PROT_TCP) {
			toTcp(ipPacket);
		}
	} else if (msg->getArrivalGate() == tcpGateIn_) {
		TCPSegment *tcpSeg = check_and_cast<TCPSegment *>(msg);
		fromTcp(tcpSeg);
	} else if (msg->getArrivalGate() == udpGateIn_) {
		DCN_UDPPacket *udpPacket = check_and_cast<DCN_UDPPacket *>(msg);
		fromUdp(udpPacket);
	} else {
		opp_error("unknown message");
	}
}

void NetworkLayerBase::fromTcp(cMessage *msg)
{
	send(msg, lowerLayerOut_);
}

void NetworkLayerBase::fromUdp(cMessage *msg)
{
	send(msg, lowerLayerOut_);
}

void NetworkLayerBase::toTcp(DCN_IPPacket *msg)
{
	send(msg, tcpGateOut_);
}

void NetworkLayerBase::toUdp(DCN_IPPacket *msg)
{
	send(msg, udpGateOut_);
}

NetworkLayerBase::~NetworkLayerBase()
{

}
