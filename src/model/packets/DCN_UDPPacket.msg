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

enum IPProtocolId;

cplusplus {{
#include "DCN_IPPacket.h"

#define UDP_OVERHEAD 			(IP_OVERHEAD + UDP_HEADER_SIZE)
#define MAX_UDP_PAYLOAD			(ETHER_MAX_SEG_SIZE - UDP_OVERHEAD)

}}



packet DCN_IPPacket;

packet DCN_UDPPacket extends DCN_IPPacket
{
    @customize(true);
    kind enum(DCN_EthPacketType) = DCN_UDP_PACKET;
	transportProtocol = IP_PROT_UDP;
}
