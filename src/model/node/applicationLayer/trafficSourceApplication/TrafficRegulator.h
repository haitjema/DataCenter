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

#ifndef TRAFFICREGULATOR_H_
#define TRAFFICREGULATOR_H_

// The Traffic Regulator decides when to send packet
// In other words, the spacing in time between packets
// sent from the host

// Reads the packetDelay parameter to determine when to send the packet
class TrafficRegulator : public cSimpleModule {
public:
	TrafficRegulator();
	virtual void initialize();
	virtual ~TrafficRegulator() {}

	virtual simtime_t getNextTransmitTime(DCN_EthPacket *pkt) = 0;
};

class SimpleTrafficRegulator : public TrafficRegulator {
public:
	SimpleTrafficRegulator();
	virtual void initialize();
	virtual ~SimpleTrafficRegulator();
	virtual simtime_t getNextTransmitTime(DCN_EthPacket *pkt);
protected:
	cPar *packetDelay;
};

// Provides even spacing between packets corresponding to specified sendRate parameter
class UniformTrafficRegulator : public TrafficRegulator {
public:
	UniformTrafficRegulator();
	virtual void initialize();
	virtual ~UniformTrafficRegulator() {}

	virtual simtime_t getNextTransmitTime(DCN_EthPacket *pkt);

protected:
	double sendRate_;
};


/*
class VariableTrafficRegulator : public TrafficRegulator {
	virtual void initialize();
	virtual ~VariableTrafficRegulator() {}

	virtual void getNextTransmitTime(Packet *pkt);

protected:
	double rate_;
};

*/


#endif /* TRAFFICREGULATOR_H_ */
