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
#include "ModuleWithControlPort.h"

ModuleWithControlPort::ModuleWithControlPort() {

}

void ModuleWithControlPort::initialize()
{
	FatTreeNode::initialize();
	LOG(DEBUG) << typeid(this).name() << endl;

	controlGate = gate("control");

	// Find the Server's control gate in its ControlLogic module
	cModule *serverModule = this;
	// And the relative path of this module from the ControlLogic module
	srcSubModule = "";
	while (serverModule->getProperties()->get("server") == NULL)
	{
		if (serverModule != this) srcSubModule.insert(0, ".");
		srcSubModule.insert(0, serverModule->getFullName());
		serverModule = serverModule->getParentModule();
		if (serverModule == NULL) break;
	}
	if (serverModule == NULL) {
		opp_error("Could not find reference to Server!");
		return;
	}

	// Find the Server's ControlLogic module
	cModule *controlLogicModule = NULL;
	for (cModule::SubmoduleIterator iter(serverModule); !iter.end(); iter++) {
		if (strcmp(iter()->getComponentType()->getName(), "ControlLogic") == 0) {
			controlLogicModule = iter();
			break;
		}
	}
	if (controlLogicModule == NULL) {
		opp_error("Could not find reference to ControlLogic!");
		return;
	}

	// Find the ControlLogic module's control gate
	serverControlGate = controlLogicModule->gate("control");
}

void ModuleWithControlPort::handleMessage(cMessage *msg)
{
	if (msg->getArrivalGate() == controlGate) {
		ControlMessage* cmsg = check_and_cast<ControlMessage*>(msg);
		if (cmsg == NULL) {
			opp_error("Received non-control message on control gate!");
			delete msg; msg = NULL;
			return;
		}
		handleControlMessage(cmsg);
	}
}

void ModuleWithControlPort::handleControlMessage(ControlMessage *cmsg)
{
	// Implement
    //delete cmsg;
}

void ModuleWithControlPort::sendControlMessageToLocalModule(ControlMessage *cmsg)
{
    cmsg->setDstAddr(address_);
    sendControlMessageToModuleInOtherServer(cmsg);
}

void ModuleWithControlPort::sendControlMessageToModuleInOtherServer(ControlMessage* cmsg)
{
    cmsg->setSrcAddr(node_id_.getAddress());
    cmsg->setSrcSubModule(srcSubModule.c_str());
    sendDirect(cmsg, serverControlGate);
}

void ModuleWithControlPort::sendControlMessageToSameModuleInOtherServer(ControlMessage* cmsg)
{
    cmsg->setDstSubModule(srcSubModule.c_str());
    sendControlMessageToModuleInOtherServer(cmsg);
}

void ModuleWithControlPort::sendControlMessageToModuleInAllServers(ControlMessage* cmsg)
{
    for (uint dst = 0; dst < node_id_.getNumberOfServers(); dst++) {
        ControlMessage *copy = cmsg->dup();
        copy->setDstAddr(dst);
        sendControlMessageToModuleInOtherServer(copy);
    }
    delete cmsg; // Delete the original
}

void ModuleWithControlPort::sendControlMessageToSameModuleInAllServers(ControlMessage* cmsg)
{
    cmsg->setDstSubModule(srcSubModule.c_str());
    sendControlMessageToModuleInAllServers(cmsg);
}

void ModuleWithControlPort::broadcastToSwitches(ControlMessage *cmsg)
{
    cmsg->setDstAddr(BROADCAST_SWITCHES);
    cmsg->setSrcAddr(node_id_.getAddress());
    cmsg->setSrcSubModule(srcSubModule.c_str());
    cmsg->setDstSubModule("N/A"); // XXX how should we handle this properly?
    sendDirect(cmsg, serverControlGate);
}

ModuleWithControlPort::~ModuleWithControlPort() {

}

Define_Module(ModuleWithControlPort);

