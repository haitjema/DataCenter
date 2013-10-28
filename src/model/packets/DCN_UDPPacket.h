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

#ifndef UDPPACKET_H_
#define UDPPACKET_H_

#include "DCN_UDPPacket_m.h"

//virtual int64 getOverheadBytes() { return ETHER_FRAME_SIZE; }
class DCN_UDPPacket : public DCN_UDPPacket_Base
{
  public:
	DCN_UDPPacket(const char *name=NULL, int kind=0) : DCN_UDPPacket_Base(name,kind) { setByteLength(DCN_MIN_PACKET_SIZE); }
	DCN_UDPPacket(const DCN_UDPPacket& other) : DCN_UDPPacket_Base(other.getName()) { operator=(other); }
	DCN_UDPPacket& operator=(const DCN_UDPPacket& other) { DCN_UDPPacket_Base::operator=(other); return *this; }
	virtual DCN_UDPPacket *dup() const { return new DCN_UDPPacket(*this); }
	virtual int64 getOverheadBytes() { return ETHER_FRAME_SIZE + IP_HEADER_SIZE + UDP_HEADER_SIZE; }
};


#endif /* UDPPACKET_H_ */
