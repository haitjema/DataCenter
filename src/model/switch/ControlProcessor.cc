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
#include "ControlProcessor.h"
#include "SwitchPortQueue.h"
#include "ControlMessage.h"
#include "UpdateQueueSizeMessage_m.h"


Define_Module(ControlProcessor);

enum { START, END };

ControlProcessor::~ControlProcessor() {

}

void ControlProcessor::initialize()
{
	// Read in parameters
	FatTreeNode::initialize();

	LOG(DEBUG) << typeid(this).name() << endl;

	useDirectMsgSending_ = par("useDirectMsgSending");
	processingDelay_ = par("processingDelay"); // Expect a default of 0
	switch_id_ = par("switch_id").stdstringValue();
	//switchIndex_;
	uint pos = switch_id_.rfind('i');
	switchIndex_ = atoi(&switch_id_.c_str()[pos+1]);
	depth_ = par("depth");

	number_of_down_ports_ = gateSize("down_port_in"); // assume same # of input & output ports
	number_of_up_ports_ = gateSize("up_port_in");
	down_port_in_base_id_ = gateBaseId("down_port_in");
	down_port_out_base_id_ = gateBaseId("down_port_out");
	up_port_in_base_id_ = gateBaseId("up_port_in");
	up_port_out_base_id_ = gateBaseId("up_port_out");

	LOG(LOUD) 	<< ": switch " << switch_id_ << ":\n";
	LOG(LOUD) 	<< "Parameters:\n"
				<< "switch_id_               = " << switch_id_ << "\n"
				<< "sub_tree_id_             = " << node_id_ << "\n";
	LOG(LOUD)	<< "Ports:\n"
				<< "Downward facing ports    = " << number_of_down_ports_ << "\n"
				<< "Upward facing ports      = " << number_of_up_ports_ << "\n"
				<< "down_port_in_base_id_    = " << down_port_in_base_id_ << " .\n"
				<< "down_port_out_base_id_   = " << down_port_out_base_id_ << " .\n"
				<< "up_port_in_base_id_      = " << up_port_in_base_id_ << " .\n"
				<< "up_port_out_base_id_     = " << up_port_out_base_id_ << " .\n";


	// Find references to this switch's queue modules
	cModule *switchModule = this->getParentModule();
	downPortQueues_.resize(number_of_down_ports_);
	upPortQueues_.resize(number_of_up_ports_);
	for (int d = 0; d < number_of_down_ports_; d++) { downPortQueues_[d] = NULL; }
	for (int u = 0; u < number_of_up_ports_; u++) { upPortQueues_[u] = NULL; }
	for (cModule::SubmoduleIterator iter(switchModule); !iter.end(); iter++) {
        if (!strcmp(iter()->getName(), "down_port_queue")) {
            int index = iter()->getIndex();
            downPortQueues_[index] = check_and_cast<SwitchPortQueue*>(iter());
        } else if (!strcmp(iter()->getName(), "up_port_queue")) {
            int index = iter()->getIndex();
            upPortQueues_[index] = check_and_cast<SwitchPortQueue*>(iter());
        }
    }
}

inline bool ControlProcessor::IsDownPort(int gate_id)
{
	// Gate corresponds to an upward facing port if the gate_id is in the range of upward facing ports
	return ( (gate_id >= down_port_in_base_id_) && (gate_id < (down_port_in_base_id_ + number_of_down_ports_)) );
}

inline bool ControlProcessor::IsUpPort(int gate_id)
{
	// Gate corresponds to an upward facing port if the gate_id is in the range of upward facing ports
	return ( (gate_id >= up_port_in_base_id_) && (gate_id < (up_port_in_base_id_ + number_of_up_ports_)) );
}

void ControlProcessor::handleMessage(cMessage *msg)
{
	uint destAddr, srcAddr, path;

	if (msg->isPacket()) {
	    DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);
	    srcAddr = pkt->getSrcAddr();
	    destAddr = pkt->getDestAddr();
	    path = pkt->getPath();
	    LOG(DEBUG) << ": switch " << switch_id_	<< " received packet from address " << srcAddr
	    		   << " for address " << destAddr << " using path " << path << "\n";
	} else {
		// If it's not a packet, assume it's a control message
		ControlMessage *cmsg = check_and_cast<ControlMessage *>(msg);
		if (cmsg->isBroadcast()) {
		    LOG(DEBUG) << ": switch " << switch_id_ << " received control message to broadcast from "
		               << srcAddr << endl;
		    flood(cmsg);
		    if (cmsg->getDstAddr() == BROADCAST_SWITCHES) {
		        localDelivery(cmsg);
		    } else {
		        delete cmsg;
		    }
		    return;
		} else {
		    srcAddr = cmsg->getSrcAddr();
		    destAddr = cmsg->getDstAddr();
		    path = 0; // Just always use the first path for control messages since it doesn't really matter
		    LOG(DEBUG) << ": switch " << switch_id_ << " received control message from address "
		               << srcAddr << " for address " << destAddr << endl;
		}
	}

	if (useDirectMsgSending_) {
	    // XXX FIXME TODO This way of using direct method calls to send messages
	    // doesn't easily allow for adding the processingDelay_. May need to pass
	    // that as a parameter to the queues so that they can deal with it...
	    SwitchPortQueue *queue = lookupQueue(destAddr, path);
	    queue->handleMessageDirect(msg);
	} else {
	    int destGate = lookupGateID(destAddr, path);
	    sendDelayed(msg, processingDelay_, destGate);
	}
}

void ControlProcessor::downPortDirectIn(cMessage *msg, uint port)
{
    Enter_Method("Received msg via direct method call");
    take(msg); // XXX Necessary?
    // Pretend like the message arrived on the in gate
    msg->setArrival(this, down_port_in_base_id_ + port); // XXX This right?
    handleMessage(msg);
}

void ControlProcessor::upPortDirectIn(cMessage *msg, uint port)
{
    Enter_Method("Received msg via direct method call");
    take(msg); // XXX Necessary?
    // Pretend like the message arrived on the in gate
    msg->setArrival(this, up_port_in_base_id_ + port); // XXX This right?
    handleMessage(msg);
}

void ControlProcessor::localDelivery(cMessage *msg)
{
    LOG(DEBUG) << "Received message " << *msg << endl;
    // For now assume only control messages are sent for local delivery
    ControlMessage *cmsg = check_and_cast<ControlMessage *>(msg);
    if (cmsg->getType() == UPDATE_QUEUE_SIZE_MSG) {
        updateQueueSize(cmsg);
    } else {
        opp_error("Received unexpected control message of type: %d", cmsg->getKind());
    }
    delete msg;
}

void ControlProcessor::flood(cMessage *msg)
{
    ControlMessage *cmsg = check_and_cast<ControlMessage *>(msg);

    bool floodDown;
    if (depth_ == 0) {
        floodDown = (switchIndex_%node_id_.getUpRadix(1) == 0);
    } else {
        floodDown = (!switchIndex_);
    }

    // Messages broadcast to switches should not be delivered to servers
    bool isBroadcastToSwitches = (cmsg->getDstAddr() == BROADCAST_SWITCHES);
    bool isToRSwitch = (depth_ == (tree_depth - 1)); // Top of Rack switch

    if (floodDown && (!isToRSwitch) && isBroadcastToSwitches) {
        for (int downPort = 0; downPort < number_of_down_ports_; downPort++) {
            if ((down_port_in_base_id_ + downPort) == msg->getArrivalGateId()) { continue; }
            cMessage *copy = msg->dup();
            send(copy, down_port_out_base_id_ + downPort);
        }
    }
    // To avoid cycles, don't flood upwards if the packet arrived an up-port
    bool isFromUpPort = IsUpPort(msg->getArrivalGateId());
    if (!isFromUpPort) {
        for (int upPort = 0; upPort < number_of_up_ports_; upPort++) {
            cMessage *copy = msg->dup();
            send(copy, up_port_out_base_id_ + upPort);
        }
    }
    // Original copy will be deleted by handleMessage() or localDelivery()
}

SwitchPortQueue* ControlProcessor::lookupQueue(uint destAddr, uint path)
{
    int portNum = lookup(destAddr, path);
    if (portNum < 0) {
        portNum = -1*portNum - 1;
        return downPortQueues_[portNum];
    } else {
        return upPortQueues_[portNum];
    }

}

int ControlProcessor::lookupGateID(uint destAddr, uint path)
{
    int portNum = lookup(destAddr, path);
    int destGate;
    if (portNum < 0) {
        portNum = -1*portNum - 1;
        destGate = down_port_out_base_id_ + portNum;
    } else {
        destGate = up_port_out_base_id_ + portNum;
    }
    return destGate;
}

int ControlProcessor::lookup(uint destAddr, uint path)
{
	// Determine which gate to send the message out on
	int destPort;

	// If the destination address matches this switch's sub-tree...
	if (node_id_.compareSubTree(depth_, destAddr)) {
 		// then the message is in the right sub-tree and we need to send it down
		// so get the identifier of the next level sub-tree from the address
	    destPort = node_id_.getLevelID(depth_, destAddr);
	    destPort = -1*destPort - 1;
		LOG(DEBUG) << "Send to down-port " << destPort << "\n" << "Correct SubTree! Send downwards...\n"
				   << "send to down-port " << destPort << "\n";

	} else {

		// Otherwise, send this message up towards the root to find the correct sub-tree
		destPort = node_id_.getPathID(depth_, path);

		LOG(DEBUG) << "Send to up-port " << destPort << "\n" << "Wrong SubTree! Send upwards...\n"
				   << "send to up-port " << destPort << "\n";
	}

	return destPort;
}


void ControlProcessor::updateQueueSize(cMessage *msg)
{
    UpdateQueueSizeMessage *uqsm = check_and_cast<UpdateQueueSizeMessage*>(msg);
    // If we are working with the LogicalTree representation of the FatTree, then
    // queue sizes should be adjusted in proportion to the number of physical links
    // each queue represents.
    uint numCorrPhysDownLinks = 1, numCorrPhysUpLinks = 1;
    // XXX Assume that if the number of paths is 1, we are working with the LogicalTree.
    if (node_id_.getNumberOfPaths() == 1) {
        // Find out how many links in the corresponding FatTree each queue represents.
        numCorrPhysDownLinks = getNumCorrPhysDownLinks(node_id_, depth_);
        numCorrPhysUpLinks = getNumCorrPhysUpLinks(node_id_, depth_);
    }

    LOG(DEBUG) << "Received UpdateQueueSizeMessage: " << *uqsm << endl;
    for (std::vector<SwitchPortQueue*>::iterator iter = downPortQueues_.begin(); iter != downPortQueues_.end(); iter++) {
        (*iter)->updateQueueSize(numCorrPhysDownLinks*uqsm->getQueueSizeBytes(), numCorrPhysDownLinks*uqsm->getQueueSizePkts());
    }
    for (std::vector<SwitchPortQueue*>::iterator iter = upPortQueues_.begin(); iter != upPortQueues_.end(); iter++) {
        (*iter)->updateQueueSize(numCorrPhysUpLinks*uqsm->getQueueSizeBytes(), numCorrPhysUpLinks*uqsm->getQueueSizePkts());
    }
}

