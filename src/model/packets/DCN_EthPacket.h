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

#ifndef DCNPACKET_H_
#define DCNPACKET_H_

#include "DCN_EthPacket_m.h"


class DCN_EthPacket : public DCN_EthPacket_Base
{
  public:
	DCN_EthPacket(const char *name=NULL, int kind=0) : DCN_EthPacket_Base(name,kind) { setByteLength(DCN_MIN_PACKET_SIZE); }
	DCN_EthPacket(const DCN_EthPacket& other) : DCN_EthPacket_Base(other.getName()) { operator=(other); }
	DCN_EthPacket& operator=(const DCN_EthPacket& other) { DCN_EthPacket_Base::operator=(other); return *this; }
	virtual DCN_EthPacket *dup() const { return new DCN_EthPacket(*this); }
	virtual int64 getOverheadBytes() { return ETHER_FRAME_SIZE; }
	virtual void setPayloadLengthBytes(int64 payloadBytes);
	bool isDataPacket() { return dataPacket_var; }
  protected:
	// Made setPayload protected because you should be using setPayloadLengthBytes
	virtual void setPayload(unsigned short payload) { this->payload_var = payload; }
};



#endif /* DCNPACKET_H_ */
