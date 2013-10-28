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
#include "node_id.h"
#include "FatTreeNode.h"
#include "ControlMessage.h"
#include "ControlLogic.h"


ControlLogic::ControlLogic()
{
}

void ControlLogic::initialize()
{
	FatTreeNode::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	serverModule = getParentModule();
	if (!strcmp(serverModule->getClassName(), "Server")) {
		opp_error("Could not find reference to Server!");
	}

	controlGate = gate("control");
	otherServersGate_in = gate("otherServers$i");
	otherServersGate_out = gate("otherServers$o");
}

void ControlLogic::handleMessage(cMessage *msg)
{
	ControlMessage* cmsg = check_and_cast<ControlMessage*>(msg);

	uint srcAddr = cmsg->getSrcAddr();
	uint dstAddr = cmsg->getDstAddr();
	opp_string srcModulePath = cmsg->getSrcSubModule();
	opp_string dstModulePath = cmsg->getDstSubModule();


	LOG(DEBUG) << "Server " << dstAddr << " received a control message from subModule '" << srcModulePath
			   << "' of Server " << srcAddr << " bound for subModule '" << dstModulePath << "' of server " << dstAddr << endl;


	if (dstAddr != node_id_.getAddress()) {
		// If message is bound for other servers send it to the Server's interface
		send(cmsg, otherServersGate_out);
	} else {
		// Local delivery
		cGate *dstGate = NULL;

		// Get the path of the destination subModule from the message
		opp_string dstModulePath = cmsg->getDstSubModule();

		// Lookup the destination subModule by its path
		cModule *dstModule = serverModule->getModuleByPath(dstModulePath.c_str());
		if (dstModule == NULL) {
			opp_error("Could not find destination path!");
			delete cmsg;
			return;
		}

		// Find the control gate for this subModule
		dstGate = dstModule->gate("control");
		if (dstModule == NULL) {
			opp_error("Could not find destination module's control gate!");
			delete cmsg;
			return;
		}

		// Send the message to its control gate
		sendDirect(cmsg, dstGate);
	}
}

ControlLogic::~ControlLogic() {

}

Define_Module(ControlLogic);

