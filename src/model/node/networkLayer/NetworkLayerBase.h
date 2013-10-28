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

#ifndef NETWORKLAYERBASE_H_
#define NETWORKLAYERBASE_H_

#include "TCPSegment.h"

class NetworkLayerBase : public cSimpleModule
{
public:
	NetworkLayerBase();
	virtual ~NetworkLayerBase();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);

	virtual void fromTcp(cMessage *msg);
	virtual void fromUdp(cMessage *msg);
	virtual void toTcp(DCN_IPPacket *msg);
	virtual void toUdp(DCN_IPPacket *msg);

protected:
	cGate *tcpGateIn_;	// From TCP module
	cGate *tcpGateOut_;	// To TCP module
	cGate *udpGateIn_;	// From UDP module
	cGate *udpGateOut_;	// To UDP module
	cGate *lowerLayerIn_;
	cGate *lowerLayerOut_;
	//cGate *rawGate_;	// Accept raw DCN packets
};

#endif /* NETWORKLAYERBASE_H_ */
