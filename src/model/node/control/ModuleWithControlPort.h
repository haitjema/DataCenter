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

#ifndef MODULEWITHCONTROLPORT_H_
#define MODULEWITHCONTROLPORT_H_

#include "node_id.h"
#include "FatTreeNode.h"
#include "ControlMessage.h"

// Simple modules that need to send and/or receive control messages should
// extend this class.
// Remember to write your NED definition to "extends ModuleWithControlPort".
//
// This class has a gate called "control" which is tagged as directIn in the
// NED file corresponding to this class. This gate allows the server's
// ControlLogic block to forward control messages to this module.
//
// This class also implements sendControlMessage(ControlMesssage *cmsg) which
// allows control messages to be sent to other modules that extend this class.
// This method works by sending the ControlMessage directly to the Server's
// ControlLogic input gate. The ControlLogic then decides where to route
// (i.e. sendDirect) the next message.

class ModuleWithControlPort  : public FatTreeNode {
public:
	ModuleWithControlPort();
	virtual ~ModuleWithControlPort();
	virtual void initialize();
	virtual void handleMessage(cMessage *msg);
	virtual void handleControlMessage(ControlMessage *cmsg);
	virtual void sendControlMessageToLocalModule(ControlMessage *cmsg);
	virtual void sendControlMessageToModuleInOtherServer(ControlMessage* cmsg);
	virtual void sendControlMessageToSameModuleInOtherServer(ControlMessage *cmsg);
	virtual void sendControlMessageToModuleInAllServers(ControlMessage* cmsg);
	virtual void sendControlMessageToSameModuleInAllServers(ControlMessage *cmsg);
	// Can also multicast a message to a module in all servers:

	virtual void broadcastToSwitches(ControlMessage *cmsg);
protected:
	std::string srcSubModule; // Relative path of this source module from the root

	// This is a reference to this module's directIn gate which
	// will receive all of the control messages
	cGate *controlGate;

	// Server's control gate
	// We will send any control messages using directSend to the server's control gate
	// and these messages will then be forwarded on to the appropriate place
	cGate *serverControlGate;
};


#endif /* MODULEWITHCONTROLPORT_H_ */
