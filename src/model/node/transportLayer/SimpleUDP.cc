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
#include "SimpleUDP.h"

Define_Module(SimpleUDP);

SimpleUDP::SimpleUDP()
{

}

void SimpleUDP::initialize()
{
	LOG(DEBUG) << endl;
	lowerLayerIn_ = gate("lower_layer$i");
	lowerLayerOut_ = gate("lower_layer$o");
	upperLayerIn_ = gate("upper_layer$i");
	upperLayerOut_ = gate("upper_layer$o");

}

void SimpleUDP::handleMessage(cMessage *msg)
{
	// We expect all incoming packets to be of type DCN_UDPPacket
	// regardless of whether they came form the application or the networking layer
	// For now we simply forward the packets
	// In the future, we may support multiple applications above and then here we will
	// demultiplex/multiplex packets based on port numbers


	DCN_UDPPacket *udpPacket = check_and_cast<DCN_UDPPacket*>(msg);
	if (udpPacket->getArrivalGate() == upperLayerIn_) {
		send(udpPacket, lowerLayerOut_);
	} else { // It came from lowerLayerIn_
		send(udpPacket, upperLayerOut_);
	}
}

SimpleUDP::~SimpleUDP()
{

}
