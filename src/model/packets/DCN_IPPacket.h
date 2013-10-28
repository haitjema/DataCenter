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

#ifndef IPPACKET_H_
#define IPPACKET_H_

#include "DCN_IPPacket_m.h"


//virtual int64 getOverheadBytes() { return ETHER_FRAME_SIZE; }
class DCN_IPPacket : public DCN_IPPacket_Base
{
  public:
	DCN_IPPacket(const char *name=NULL, int kind=0) : DCN_IPPacket_Base(name,kind) { setByteLength(DCN_MIN_PACKET_SIZE); }
	DCN_IPPacket(const DCN_IPPacket& other) : DCN_IPPacket_Base(other.getName()) { operator=(other); }
	DCN_IPPacket& operator=(const DCN_IPPacket& other) { DCN_IPPacket_Base::operator=(other); return *this; }
	virtual DCN_IPPacket *dup() const { return new DCN_IPPacket(*this); }
	virtual int64 getOverheadBytes() { return ETHER_FRAME_SIZE + IP_HEADER_SIZE; }
};


#endif /* IPPACKET_H_ */
