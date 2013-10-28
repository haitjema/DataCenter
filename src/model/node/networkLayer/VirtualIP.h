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

#ifndef VIRTUALIP_H_
#define VIRTUALIP_H_

#include "DCCommon.h"
#include "NetworkLayerBase.h"

// INET includes
#include "IPv4Address.h" // May not be necessary if we don't end up using IPAddress address

typedef IPv4Address IPAddress; // 9/23/2012 change to get it to work with INET 2.0

IPAddress convertDCAddressToIP(uint address);

uint convertIPAddressToDC(IPAddress address);

class VirtualIP : public NetworkLayerBase {
public:
	VirtualIP();
	virtual ~VirtualIP();

	virtual void initialize();

	virtual void fromTcp(cMessage *msg);
	virtual void fromUdp(cMessage *msg);
	virtual void toTcp(DCN_IPPacket *msg);
	virtual void toUdp(DCN_IPPacket *msg);

protected:

	IPAddress address;

	// Any statistics?

};

#endif /* VIRTUALIP_H_ */
