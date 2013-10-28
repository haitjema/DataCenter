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

#ifndef REQUESTPACKET_H_
#define REQUESTPACKET_H_

#include "RequestPacket_m.h"

// Link-Proxy Request Packet
class RequestPacket : public RequestPacket_Base
{
public:
    RequestPacket(const char *name=NULL, int kind=0) : RequestPacket_Base(name, kind) {}
    RequestPacket(const RequestPacket& other) : RequestPacket_Base(other) {}
    RequestPacket& operator=(const RequestPacket& other) { RequestPacket_Base::operator=(other); return *this; }
    virtual RequestPacket *dup() { return new RequestPacket(*this); }
    bklg_t &bklg() { return bklg_var; }
    rate_t &request() { return request_var; }
};

#endif /* REQUESTPACKET_H_ */
