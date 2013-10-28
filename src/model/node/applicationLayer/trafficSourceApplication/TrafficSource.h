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

#ifndef TRAFFICSOURCE_H_
#define TRAFFICSOURCE_H_

// The TrafficSource should prompt for the destination address
// and the packet size
class TrafficSource : public ModuleWithControlPort {
	public:
		TrafficSource();
		virtual ~TrafficSource();

		virtual void initialize();
		virtual void handleMessage(cMessage *msg);

	protected:
		virtual DCN_UDPPacket *getNewPacket();
		virtual void setPacketSize(DCN_UDPPacket *pkt);
		virtual void setDestination(DCN_UDPPacket *pkt);

		cPar *packetSize;

		cMessage *sendNextPacket;
		cMessage *stopSending;
		DCN_UDPPacket * nextPacket;
		TrafficRegulator *trafficRegulator_;

		// Gates
		cGate* to_lower_layer_;
		cGate* to_upper_layer_;
		cGate* from_lower_layer_;
		cGate* from_upper_layer_;

		simsignal_t sendIntervalSignal; // XXX Do I want this?
	    simsignal_t txBytesSignal;
	    simsignal_t txPktToHostSignal;
};

// Sends to a single destination based on a random permutation of the servers
// This ensures each server sends to a unique server. In other words, each
// server receives traffic from exactly one other server
class SendServerPermutationTrafficSource : public TrafficSource
{
public:
	SendServerPermutationTrafficSource();
	virtual ~SendServerPermutationTrafficSource();
	virtual void initialize();
	virtual void setDestination(DCN_UDPPacket *pkt);
	virtual void handleControlMessage(ControlMessage *cmsg);
protected:
	virtual void printServerAssignments(uint_vec_t &serverAssignments);
	virtual void createPermutation(uint_vec_t &serverAssignments);
	virtual void reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments);
	virtual void sendServerAssignments(uint_vec_t &serverAssignments);
	uint destAddr_;
};

// Similar to SendServerPermutationTrafficSource except that server's pair up
// If server A sends to Server B then Server B also sends to server A
class ServerPairPermutationTrafficSource : public SendServerPermutationTrafficSource
{
public:
	ServerPairPermutationTrafficSource();
	virtual ~ServerPairPermutationTrafficSource();
	virtual void initialize();
protected:
	virtual void reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments);
	virtual void createPermutation(uint_vec_t &serverAssignments);
};


// The IntervalTrafficSource sends to a random destination for a specified interval
// and then chooses a new destination and repeats
class IntervalTrafficSource : public TrafficSource {
public:
	IntervalTrafficSource();
	virtual ~IntervalTrafficSource();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);

protected:
	virtual void setDestination(DCN_UDPPacket *pkt);

	SimTime newSendInterval();

	SimTime nextSendTime(DCN_UDPPacket *pkt);

	cMessage *nextSendIntervalEvent;

	uint sending_rate_; 	// in bits per second
	uint currentDestAddr_;	// host we are sending to in the current interval

};

#endif /* TRAFFICSOURCE_H_ */

