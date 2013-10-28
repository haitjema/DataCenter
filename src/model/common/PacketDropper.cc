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

#include "DCCommon.h"
#include "PacketDropper.h"

Define_Module(PacketDropper);

PacketDropper::PacketDropper()
{

}

void PacketDropper::initialize()
{
	LOG(DEBUG) << endl;
	port1in_ = gate("port$i", 0);
	port1out_ = gate("port$o", 0);
	port2in_ = gate("port$i", 1);
	port2out_ = gate("port$o", 1);

	numPktsToDrop = 0;
	WATCH(numPktsToDrop);
	dropPktSignal = registerSignal("dropPkt");
	dropPacketEvent = NULL;
    const char *script = par("dropScript");
    parseScript(script);

    if (commands.size() > 0) {
    	dropPacketEvent = new cMessage();
    	handleDropEvent();
    }
}

void PacketDropper::handleDropEvent()
{
	numPktsToDrop = dropPacketEvent->getKind();
	LOG(DEBUG) << "Dropping the next " << numPktsToDrop << " packets" << endl;
	if (commands.size() > 0) {
		Command cmd = commands.front();
		LOG(DEBUG) << "Schedule event to drop the next " << cmd.numPktsToDrop
		    	   << " packet(s) after time " << cmd.dropTime << endl;
		dropPacketEvent->setKind((short)cmd.numPktsToDrop);
		scheduleAt(cmd.dropTime, dropPacketEvent);
		commands.pop_front();
	} else {
		LOG(DEBUG) << "No more drop events to schedule." << endl;
		delete dropPacketEvent;
		dropPacketEvent = NULL;
	}
}

void PacketDropper::handleMessage(cMessage *msg)
{
	if (msg == dropPacketEvent) {
		handleDropEvent();
		return;
	} else if (numPktsToDrop > 0) {
	    emit(dropPktSignal, msg); // Always emit so that listener modules can know packet was lost
		delete msg;
		numPktsToDrop--;
		LOG(DEBUG) << "Dropping incoming packet, numPktsToDrop = " << numPktsToDrop << endl;
		return;
	}

	if (msg->getArrivalGate() == port1in_) {
		send(msg, port2out_);
	} else if (msg->getArrivalGate() == port2in_) {
		send(msg, port2out_);
	}
}

void PacketDropper::parseScript(const char *script)
{
    const char *s = script;
    while (*s)
    {
        Command cmd;

        // parse time
        while (isspace(*s)) s++;
        if (!*s || *s==';') break;
        const char *s0 = s;
        cmd.dropTime = strtod(s,&const_cast<char *&>(s));
        if (s==s0)
            throw cRuntimeError("syntax error in script: simulation time expected");

        // parse number of bytes
        while (isspace(*s)) s++;
        if (!isdigit(*s))
            throw cRuntimeError("syntax error in script: expected number of packets to drop");
        cmd.numPktsToDrop = atoi(s);
        while (isdigit(*s)) s++;

        // add command
        commands.push_back(cmd);

        // skip delimiter
        while (isspace(*s)) s++;
        if (!*s) break;
        if (*s!=';')
            throw cRuntimeError("syntax error in script: separator ';' missing");
        s++;
        while (isspace(*s)) s++;
    }
}

PacketDropper::~PacketDropper()
{
	cancelAndDelete(dropPacketEvent);
}

