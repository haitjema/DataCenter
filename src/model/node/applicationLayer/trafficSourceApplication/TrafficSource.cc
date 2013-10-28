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
#include "ModuleWithControlPort.h"
#include "TrafficRegulator.h"
#include "TrafficSource.h"
#include "TrafficSourceControlMessage_m.h"


// ------------------------------------------------------------------------------
// TrafficSource
// ------------------------------------------------------------------------------

TrafficSource::TrafficSource()
{

}

void TrafficSource::initialize()
{
	ModuleWithControlPort::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	packetSize = &par("packetSize");
	double sendTimeLimit = par("sendTimeLimit"); // XXX should this be a double?

    to_lower_layer_ = gate("lower_layer$o");
	to_upper_layer_ = gate("upper_layer$o");
	from_lower_layer_ = gate("lower_layer$i");
	from_upper_layer_ = gate("upper_layer$i");

    txBytesSignal = registerSignal("txBytes");
    txPktToHostSignal = registerSignal("txPktToHost");
    sendIntervalSignal = registerSignal("sendInterval");


    trafficRegulator_ = check_and_cast<TrafficRegulator*>(getParentModule()->getSubmodule("trafficRegulator"));

    stopSending = NULL;
    nextPacket = NULL;
    sendNextPacket = NULL;

    if (sendTimeLimit != 0) {
    	stopSending = new cMessage("stopSending");
    	LOG(DEBUG) << "Stop sending at time " << sendTimeLimit << endl;
    	scheduleAt(simTime() + sendTimeLimit, stopSending);
    }

    if (par("enabled")) {
    	sendNextPacket = new cMessage("sendNextPacket");

    	// Schedule event to send first packet
    	scheduleAt(simTime(), sendNextPacket);
    }
}

void TrafficSource::setPacketSize(DCN_UDPPacket *pkt)
{
	pkt->setPayloadLengthBytes(packetSize->longValue());
	//pkt->setByteLength(packetSize->longValue());
}

void TrafficSource::setDestination(DCN_UDPPacket *pkt)
{
	pkt->setDestAddr(par("destinationHost").longValue());
}


DCN_UDPPacket * TrafficSource::getNewPacket()
{
	DCN_UDPPacket *pkt = new DCN_UDPPacket("packet");

	pkt->setSrcAddr(address_); // XXX may not be necessary here

	setDestination(pkt);

	setPacketSize(pkt);

	LOG(DEBUG) << "New UDP packet with payload = " << pkt->getPayload() << " bytes which is " << pkt->getByteLength() << " bytes on the wire." << endl;

	// XXX Do we want to set the time stamp when the packet is generated
	// or when it leaves the host?
	//pkt->setTimeStamp(simTime());

	return pkt;
}

void TrafficSource::handleMessage(cMessage *msg)
{
	if (msg == sendNextPacket) {

		// Send the packet
		if (nextPacket != NULL) {
			send(nextPacket, to_lower_layer_);
			emit(txBytesSignal, (long)nextPacket->getByteLength());
			emit(txPktToHostSignal, nextPacket->getDestAddr());
		}

		// Get the next packet to send
		nextPacket = getNewPacket();

		// Determine when to send it
		simtime_t sendTime = trafficRegulator_->getNextTransmitTime(nextPacket);
		scheduleAt(sendTime, sendNextPacket);
		if (mayHaveListeners(sendIntervalSignal)) {
			emit(sendIntervalSignal, sendTime-simTime());
		}
	} else if (msg == stopSending) {
		cancelAndDelete(sendNextPacket);
		sendNextPacket = NULL;
	} else {
		ModuleWithControlPort::handleMessage(msg); // XXX how should we manage this? assume the base will delete the message?
	}
}

TrafficSource::~TrafficSource()
{
	cancelAndDelete(stopSending);
	cancelAndDelete(sendNextPacket);
	if (nextPacket != NULL) {
		if (nextPacket->getOwner() == this) delete nextPacket;
	}
}

Define_Module(TrafficSource);

// ------------------------------------------------------------------------------
// SendServerPermutationTrafficSource
// ------------------------------------------------------------------------------

SendServerPermutationTrafficSource::SendServerPermutationTrafficSource()
{

}

void SendServerPermutationTrafficSource::createPermutation(uint_vec_t &serverAssignments)
{
	// Assign each server a random unique destination (i.e. no two servers send to the same destination)
	uint numServers = node_id_.getNumberOfServers();
	uint_vec_t serverList;
	serverList.resize(numServers);

	// Create a vector that stores the list of servers
	for (uint i = 0; i < numServers; i++) serverList[i] = i;
	// Perform a random permutation on this list
	for (uint i = 0; i < serverList.size(); i++) {
		// Swap each element with a random element
		std::swap(serverList[i],serverList[intrand(numServers)]);
	}


	// Create  new vector "serverAssignments" so that serverAssignments[i] corresponds to server i's assigned destination
    serverAssignments.resize(numServers);
    for (uint i = 0; i < numServers; i++) {
		// Swap if server picks itself
    	if (serverList.back() == i) std::swap(serverList.back(), serverList.front());
		serverAssignments[i] = serverList.back();
		serverList.pop_back();
    }

}

void SendServerPermutationTrafficSource::reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments)
{
	// Reassign any destinations that are sending to servers in the same SubTree
	// Note: This is quick and dirty way and not particularly efficient

	if (!(node_id_.getDownRadix(0) > 1)) {
		LOG(WARN) << "There is only one SubTree, pick destinations for servers in other trees." << endl;
		return;
	}

	for (uint i = 0; i < serverAssignments.size(); i++) {
		uint A, B;
		A = i;	// Server A (the current server) ...
		B = serverAssignments[A];	// sends to server B

		// Check if server A & B are in the same SubTree
		if (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, B)) {
			// Have server A swap destinations with some other server X
			uint X, Y;
			do {
				// Pick a random server X that sends to some server Y
				X = intrand(serverAssignments.size());
				Y = serverAssignments[X];
				// Make sure neither X nor Y is in the same SubTree as A (which is in the same SubTree as B)
			} while (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, Y) ||
					node_id_.getLevelID(0, A) == node_id_.getLevelID(0, X));
			// Have A and X swap their destinations
			serverAssignments[A] = Y;
			serverAssignments[X] = B;
		}
	}
}

void SendServerPermutationTrafficSource::printServerAssignments(uint_vec_t &serverAssignments)
{
	for (uint i = 0; i < serverAssignments.size(); i++) {
		LOG(DEBUG) << "Server " << i << " is assigned to send to server " << serverAssignments[i] << endl;
	}
}

void SendServerPermutationTrafficSource::sendServerAssignments(uint_vec_t &serverAssignments)
{
	// Send a control message to each server
	for (uint i = 0; i < serverAssignments.size(); i++) {
		// The control message will be of type TrafficSourceControlMessage...
		TrafficSourceControlMessage *cmsg = new TrafficSourceControlMessage();
		cmsg->setDstAddr(i);

		// which includes a field to store the assignment
		cmsg->setSendToServer(serverAssignments[i]);
		sendControlMessageToSameModuleInOtherServer(cmsg);
	}
}

void SendServerPermutationTrafficSource::initialize()
{
	TrafficSource::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;
	LOG(DEBUG) << "RNG 0 = " << getRNG(0)->detailedInfo()  << "  numbers " << getRNG(0)->getNumbersDrawn() << endl; // XXX TEMP

	// TrafficSource may have scheduled an event to send the first packet but we can't send
	// a packet until we have been assigned a destination address so cancel this event
	if (sendNextPacket != NULL) sendNextPacket = cancelEvent(sendNextPacket);

	// Only the first server (with address 0) will calculate the permutation
	if (node_id_.getAddress() == 0) {
		uint_vec_t serverAssignments;
		createPermutation(serverAssignments);

		if (par("dontSendWithinSubtree").boolValue()) reassignServersPairedInSameSubtree(serverAssignments);

		if (DEBUG) printServerAssignments(serverAssignments);

		// Then tell each server which server it should send to
		sendServerAssignments(serverAssignments);

		serverAssignments.clear();
	}


}

void SendServerPermutationTrafficSource::handleControlMessage(ControlMessage *cmsg)
{

	TrafficSourceControlMessage *tscmsg = check_and_cast<TrafficSourceControlMessage*>(cmsg);
	if (tscmsg == NULL) {
		opp_error("Received incorrect control message!");
		delete cmsg;
		return;
	}

	// Get the destination address assignment from the control message
	destAddr_ = tscmsg->getSendToServer();

	LOG(DEBUG) << "Received assignment to send to destination " << destAddr_ << endl;

	// Now that we have a destination address, schedule the event to send a
	// packet if necessary
	if (sendNextPacket != NULL) {
		if (!sendNextPacket->isScheduled() && par("enabled")) {
			// Schedule event to send first packet
			scheduleAt(simTime(), sendNextPacket);
		}
	}

	// We don't need the control message anymore
	delete tscmsg;
}

void SendServerPermutationTrafficSource::setDestination(DCN_UDPPacket *pkt)
{
	pkt->setDestAddr(destAddr_);
}

SendServerPermutationTrafficSource::~SendServerPermutationTrafficSource()
{

}

Define_Module(SendServerPermutationTrafficSource);


// ------------------------------------------------------------------------------
// ServerPairPermutationTrafficSource
// ------------------------------------------------------------------------------


ServerPairPermutationTrafficSource::ServerPairPermutationTrafficSource()
{

}

void ServerPairPermutationTrafficSource::initialize()
{
	SendServerPermutationTrafficSource::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

}

void ServerPairPermutationTrafficSource::createPermutation(uint_vec_t &serverAssignments)
{
	// Randomly break the servers into a pairs so that server A sends to server B and server B sends to server A
	uint numServers =node_id_.getNumberOfServers();
	if (numServers % 2 != 0) {
		opp_error("ServerPairPermutationTrafficSource can only be used with an even number of servers!");
	}
	uint_vec_t serverList;
	serverList.resize(numServers);

	// Start by making a list of the servers and creating a random permutation on that list
	for (uint i = 0; i < numServers; i++) serverList[i] = i;
	for (uint i = 0; i < serverList.size(); i++) {
		// Swap each element with a random element
		std::swap(serverList[i],serverList[intrand(numServers)]);
	}

    // Break the servers into pairs
    // Match the first half of the list with the second half
    serverAssignments.resize(numServers);
    for (uint i = 0; i < numServers/2; i++) {
            uint buddy = serverList[numServers-1-i];
            serverAssignments[serverList[i]] = buddy;
            serverAssignments[buddy] = serverList[i];
    }

	serverList.clear();
}

void ServerPairPermutationTrafficSource::reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments)
{
	// Reassign any servers that are paired in the same SubTree
	// Note: This way is quick and dirty way and not particularly efficient

	if (!(node_id_.getDownRadix(0) > 1)) {
		LOG(WARN) << "There is only one SubTree, pick destinations for servers in other trees." << endl;
		return;
	}

	for (uint i = 0; i < serverAssignments.size(); i++) {
		uint A, B;
		A = i;	// Server A (the current server) ...
		B = serverAssignments[A];	// sends to server B

		// Check if server A & B are in the same SubTree
		if (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, B)) {
			// Have server A swap with some other server X
			uint X, Y;
			do {
				// Pick a random server X that sends to some server Y
				X = intrand(serverAssignments.size());
				Y = serverAssignments[X];
				// Make sure neither X nor Y is in the same SubTree as A (which is in the same SubTree as B)
			} while (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, Y) ||
					node_id_.getLevelID(0, B) == node_id_.getLevelID(0, X));
			// Have A and X swap
			serverAssignments[A] = Y;
			serverAssignments[Y] = A;
			serverAssignments[X] = B;
			serverAssignments[B] = X;
		}
	}
}

ServerPairPermutationTrafficSource::~ServerPairPermutationTrafficSource()
{
}

Define_Module(ServerPairPermutationTrafficSource);


// ------------------------------------------------------------------------------
// IntervalTrafficSource
// ------------------------------------------------------------------------------

IntervalTrafficSource::IntervalTrafficSource()
{

}

void IntervalTrafficSource::initialize()
{
	TrafficSource::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	currentDestAddr_ = 0;

    nextSendIntervalEvent = new cMessage("nextSendIntervalEvent");
    scheduleAt(newSendInterval(), nextSendIntervalEvent);
}


void IntervalTrafficSource::setDestination(DCN_UDPPacket *pkt)
{
	pkt->setDestAddr(currentDestAddr_);
}

SimTime IntervalTrafficSource::newSendInterval()
{
	// Choose a random address that doesn't match our own
	currentDestAddr_ = node_id_.getAddress();
	while (currentDestAddr_ == node_id_.getAddress()) {
		currentDestAddr_ = intrand(node_id_.getNumberOfServers());
	}

	LOG(DEBUG) << "Start sending to new destination address " << currentDestAddr_ << endl;

	double interval = par("sendInterval");

	LOG(DEBUG) << "Send for " << interval << " seconds\n";

	return simTime() + interval;
}


void IntervalTrafficSource::handleMessage(cMessage *msg)
{
	if (msg == nextSendIntervalEvent) {
		// Choose a new destination and send interval
		scheduleAt(newSendInterval(), nextSendIntervalEvent);
	} else {
		// Let the base class handle all other messages
		TrafficSource::handleMessage(msg);
	}
}

IntervalTrafficSource::~IntervalTrafficSource()
{
	cancelAndDelete(nextSendIntervalEvent);
}

Define_Module(IntervalTrafficSource);
