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
#include "node_id.h" // XXX needed?
#include "VirtualIP.h"
//#include "IPControlInfo.h"
//#include "IPDatagram.h"
#include "IPv4ControlInfo.h" // change needed with INET 2
#include "IPv4Datagram.h"

#include "InetTCPWrapper.h"

IPAddress convertDCAddressToIP(uint address)
{
    return IPAddress(address + 1);
}

uint convertIPAddressToDC(IPAddress address)
{
    return (uint)(address.getInt() - 1);
}

VirtualIP::VirtualIP()
{

}

void VirtualIP::initialize()
{
	NetworkLayerBase::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	address.set((uint32)par("address"));
}

void VirtualIP::fromTcp(cMessage *msg)
{
	cPacket *transportPacket = check_and_cast<cPacket *>(msg);
	cPacket *networkPacket = encapsulateTCPinDCN_EthPacket(transportPacket);
	NetworkLayerBase::fromTcp(networkPacket);
}

void VirtualIP::fromUdp(cMessage *msg)
{
	NetworkLayerBase::fromUdp(msg);
}

void VirtualIP::toTcp(DCN_IPPacket *msg)
{
	cPacket *transportPacket = decapsulateTCPfromDCN_EthPacket(msg);
	send(transportPacket, tcpGateOut_);
}

void VirtualIP::toUdp(DCN_IPPacket *msg)
{
	NetworkLayerBase::toUdp(msg);
}


VirtualIP::~VirtualIP()
{

}

Define_Module(VirtualIP);
