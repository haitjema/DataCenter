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

#ifndef CONTROLMESSAGE_H_
#define CONTROLMESSAGE_H_

#include "ControlMessage_m.h"

class ControlMessage : public ControlMessage_Base {
public:
    ControlMessage(const char *name=NULL, int kind=0) : ControlMessage_Base(name,kind) { }
    ControlMessage(const ControlMessage& other) : ControlMessage_Base(other.getName()) { operator=(other); }
    ControlMessage& operator=(const ControlMessage& other) { ControlMessage_Base::operator=(other); return *this; }
    virtual ControlMessage *dup() const { return new ControlMessage(*this); }
    virtual bool isBroadcast() { return (dstAddr_var >= (uint)BROADCAST_ADDRESS_RANGE); }
};

#endif /* CONTROLMESSAGE_H_ */
