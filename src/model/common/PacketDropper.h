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

#ifndef PACKETDROPPER_H_
#define PACKETDROPPER_H_

class PacketDropper : public cSimpleModule
{
public:
	PacketDropper();
	virtual ~PacketDropper();
	virtual void initialize();
	virtual void handleMessage(cMessage *msg);

protected:
	cGate *port1in_;
	cGate *port1out_;
	cGate *port2in_;
	cGate *port2out_;

	virtual void parseScript(const char *script);
	virtual void handleDropEvent();
    struct Command
    {
		simtime_t dropTime;
        int numPktsToDrop;
    };
    typedef std::list<Command> CommandVector;
    CommandVector commands;
    cMessage *dropPacketEvent;
    int numPktsToDrop;
    simsignal_t dropPktSignal;
};

#endif /* PACKETDROPPER_H_ */
