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
#include "TrafficRegulator.h"

// ------------------------------------------------------------------------------
// TrafficRegulator
// ------------------------------------------------------------------------------

TrafficRegulator::TrafficRegulator()
{

}

void TrafficRegulator::initialize()
{
	LOG(DEBUG) << typeid(this).name() << endl;
}

// ------------------------------------------------------------------------------
// SimpleTrafficRegulator
// ------------------------------------------------------------------------------

SimpleTrafficRegulator::SimpleTrafficRegulator()
{

}

void SimpleTrafficRegulator::initialize()
{
	TrafficRegulator::initialize();
	LOG(DEBUG) << typeid(this).name() << endl;
	packetDelay = &par("packetDelay");
}

simtime_t SimpleTrafficRegulator::getNextTransmitTime(DCN_EthPacket *pkt)
{
	Enter_Method("getNextTransmitTime()");

	// Get the time from the parameter, assume it's volatile
	return simTime() + *packetDelay;
}

SimpleTrafficRegulator::~SimpleTrafficRegulator()
{

}

Define_Module(SimpleTrafficRegulator);

// ------------------------------------------------------------------------------
// UniformTrafficRegulator
// ------------------------------------------------------------------------------

UniformTrafficRegulator::UniformTrafficRegulator()
{

}

void UniformTrafficRegulator::initialize()
{
	TrafficRegulator::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	// Get the Server's link rate
	cModule *server = getParentModule();
	while ( (server->getProperties()->get("server") == NULL) && (server != NULL) ) { server = server->getParentModule(); }
	if (server == NULL) { opp_error("Could not find reference to Server!"); }
	//while (strcmp(server->getClassName(), "Server") && (server != NULL)) server = getParentModule();
	//if (strcmp(server->getClassName(), "Server") ) 	opp_error("Could not find reference to Server!... WHY?!");

	cGate * port = server->gate("port$o"); // will throw error if it doesn't exist
	double linkRate = port->getTransmissionChannel()->getNominalDatarate();

	sendRate_ = linkRate*par("sendRate").doubleValue();

	LOG(DEBUG)  << "Server's linkRate = " << linkRate << " so the sendRate = " << sendRate_ << endl;
}

simtime_t UniformTrafficRegulator::getNextTransmitTime(DCN_EthPacket *pkt)
{
	Enter_Method("getNextTransmitTime()");

	simtime_t nextSendTime;
	if (!sendRate_) {
		// sendRate of 0 will yield nextSendTime of infinity which isn't a legal value
		nextSendTime = nextSendTime.getMaxTime(); // use maximum simulation time instead
	} else {
		nextSendTime = ((double)pkt->getBitLength())/sendRate_;
	}
	LOG(DEBUG) << "getNextTransmitTime = " << nextSendTime << endl;
	return simTime() + nextSendTime;
}

Define_Module(UniformTrafficRegulator);

// ------------------------------------------------------------------------------
// VariableTrafficRegulator
// ------------------------------------------------------------------------------


//Define_Module(VariableTrafficRegulator);
