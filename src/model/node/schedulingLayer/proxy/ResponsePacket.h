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

#ifndef RESPONSEPACKET_H_
#define RESPONSEPACKET_H_

#include "ResponsePacket_m.h"

// Link-Proxy Response Packet
class ResponsePacket : public ResponsePacket_Base
{
public:
    ResponsePacket(const char *name=NULL, int kind=0) : ResponsePacket_Base(name, kind) {}
    ResponsePacket(const ResponsePacket& other) : ResponsePacket_Base(other) {}
    ResponsePacket& operator=(const ResponsePacket& other) { ResponsePacket_Base::operator=(other); return *this; }
    virtual ResponsePacket *dup() { return new ResponsePacket(*this); }
    bklg_t &share() { return share_var; }
    rate_t &rate() { return rate_var; }
};

#endif /* RESPONSEPACKET_H_ */
