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
#include "TrafficSink.h"

// ------------------------------------------------------------------------------
// TrafficSink
// ------------------------------------------------------------------------------

void TrafficSink::initialize()
{
	FatTreeNode::initialize();
    rxBytesSignal = registerSignal("rxBytes");
    rxPktDelaySignal = registerSignal("rxPktDelay");
    rxPktFromHostSignal = registerSignal("rxPktFromHost");
}

void TrafficSink::handleMessage(cMessage *msg)
{
	DCN_UDPPacket *pkt = check_and_cast<DCN_UDPPacket *>(msg);

	uint srcAddr = pkt->getSrcAddr();
	uint destAddr = pkt->getDestAddr();

	// check that this packet was sent to us
	if (destAddr != address_) {
		LOG_ERROR << "Wrong host! Host " << node_id_ << " received a packet destined for address " << destAddr << "\n";
		opp_error("Server received packet with wrong destination!");
	}

	// The network delay experienced by the packet
	simtime_t pktDelay = (pkt->getArrivalTime() - pkt->getTimestamp());

	LOG(DEBUG) << " host " << node_id_ << " received a packet from address " << srcAddr << "\n";

	// XXX add has listeners check for efficiency?
	emit(rxBytesSignal, (long)pkt->getByteLength());
	emit(rxPktDelaySignal, pktDelay);
	emit(rxPktFromHostSignal, pkt->getSrcAddr());

	delete pkt;

	return;
}

Define_Module(TrafficSink);
