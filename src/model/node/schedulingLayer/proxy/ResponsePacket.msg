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
cplusplus {{
#include "SchedulingPacket.h"
typedef double bklg_t;
typedef double rate_t;
}}
packet SchedulingPacket;

class noncobject bklg_t;
class noncobject rate_t;

packet ResponsePacket extends SchedulingPacket {
    @customize(true);
    schedPktType = SCHEDULING_RESPONSE; // Defined in SchedulingPacket.msg
    bklg_t share;	// Minimum share along path
    rate_t rate;	// Allowed sending rate		
}
