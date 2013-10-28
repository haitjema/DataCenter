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
#include "SchedulingController.h"
#include "SchedulingMessage_m.h"

SchedulingController::SchedulingController()
{

}

void SchedulingController::initialize(int stage)
{
    if (stage == 0) {
        ModuleWithControlPort::initialize();
        LOG(DEBUG) << typeid(this).name() << endl;

        // Determine the Server's link rate
        //cGate * port = getParentModule()->getParentModule()->gate("port$o"); // will throw error if it doesn't exist
        //double linkRate = port->getTransmissionChannel()->getNominalDatarate();
        linkRate = server_switch_link_speed;
        if (linkRate != 1*GBPS) opp_error("Currently assuming 1 Gbps links");

        address_ = par("address");

        VOQTimeout_ = par("VOQTimeout");
        cModule *schedLayer = getParentModule();
        sendSchedPktAsControl_ = schedLayer->par("SendSchedPktAsControl");
        enforceBacklogConstraint_ = schedLayer->par("EnforceBacklogConstraint");
        inGate_ = gate("in");
        outGate_ = gate("out");

        CheckVOQTimeoutEvent_ = new cMessage();

        scheduleVoqTimeout();
    } else {
        // Lookup the following components
        // Assume that that each is a child of the scheduling layer
        // and that the scheduling layer is our parent
        demux_ = check_and_cast<Demultiplexer *>(getParentModule()->getSubmodule("demux"));
        mux_ = check_and_cast<Multiplexer *>(getParentModule()->getSubmodule("mux"));

        // Algorithm is now a separate module instead of an owned object
        //schedulingAlgorithm_ = check_and_cast<SchedulingAlgorithm*>(createOne(par("SchedulingAlgorithm")));
        schedulingAlgorithm_ = check_and_cast<SchedulingAlgorithm*>(getParentModule()->getSubmodule("algorithm"));
        //schedulingAlgorithm_->initialize(this, linkRate);
        //WATCH_PTR(schedulingAlgorithm_);
    }
}

void SchedulingController::handleMessage(cMessage *msg)
{
	if (msg == CheckVOQTimeoutEvent_) {
		LOG(DEBUG) << "CheckVOQTimeoutEvent" << endl;
		checkVoqTimeout();
		scheduleVoqTimeout();
	} else if (msg->getArrivalGate() == controlGate) {
	    ModuleWithControlPort::handleMessage(msg);
	} else {
		// If we receive a packet from the lower layer, send it up
		DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);

		// If we receive a packet from a sender for which we do not have
		// a VOQ, proactively allocate a VOQ for return traffic.
		if (lookupVoq(pkt->getSrcAddr()) == NULL) { pktArrivedForNewDestination(pkt->getSrcAddr()); }

		if (!pkt->isDataPacket()) {
			SchedulingPacket *spkt = check_and_cast<SchedulingPacket *>(msg);
			schedulingAlgorithm_->handleSchedulingPacket(spkt);
		} else {
			LOG(DEBUG) << "Received packet from " << pkt->getSrcAddr() << " bound for " << pkt->getDestAddr() << endl;
			send(pkt, outGate_);
		}// else {
		//	opp_error("Received unknown DCN_EthPacket");
		//}
	}
}

void SchedulingController::pktArrivedForNewDestination(uint destAddr)
{
	// Received a packet for which there was no VOQ
	LOG(DEBUG) << "destAddr = " << destAddr << endl;
	// Allocate a new VOQ
	allocateVoq(destAddr);
	// If this is the first VOQ we allocate
	if (voqMap_.size() == 1) {
		// Start scheduling the timeout that removes inactive VOQs
		scheduleVoqTimeout();
	}
}

VirtualOutputQueue * SchedulingController::lookupVoq(uint destAddr)
{
    Enter_Method_Silent();
	VOQMap::iterator it = voqMap_.find(destAddr);
	if (it == voqMap_.end()) {
		// No VOQ, need to allocate one
		return NULL;
	}
	return it->second;
}

void SchedulingController::sendSchedulingPacket(SchedulingPacket *sPkt)
{
    Enter_Method("sendSchedulingPacket");
    if (sendSchedPktAsControl_) {
        SchedulingControlMessage *scMsg = new SchedulingControlMessage;
        scMsg->setControlInfo(sPkt);
        scMsg->setDstAddr(sPkt->getDestAddr());
        sendControlMessageToSameModuleInOtherServer(scMsg);
    } else {
        // Lookup the VOQ and send the control message
        VirtualOutputQueue *voq = lookupVoq(sPkt->getDestAddr());
        voq->sendSchedulingPacket(sPkt);
    }
}

void SchedulingController::broadcastSchedulingPacket(SchedulingPacket *sPkt)
{
    Enter_Method("sendSchedulingPacket");
    VirtualOutputQueue *voq;
    for (VOQMap::iterator it = voqMap_.begin(); it != voqMap_.end(); it++) {
        voq = it->second;
        SchedulingPacket *copy = sPkt->dup();
        copy->setDestAddr(voq->getDestAddr());
        sendSchedulingPacket(copy);
    }
    // Send a copy to ourselves
    sPkt->setDestAddr(getAddress());
    sendSchedulingPacket(sPkt);
}

void SchedulingController::handleControlMessage(ControlMessage *cmsg)
{
    if (cmsg->getType() == SCHEDULING_CONTROL_MSG) {
        SchedulingControlMessage *scMsg = check_and_cast<SchedulingControlMessage *>(cmsg);
        SchedulingPacket *spkt = check_and_cast<SchedulingPacket *>(scMsg->removeControlInfo());
        // If we receive a packet from a sender for which we do not have
        // a VOQ, proactively allocate a VOQ for return traffic.
        if (lookupVoq(spkt->getSrcAddr()) == NULL) { pktArrivedForNewDestination(spkt->getSrcAddr()); }
        schedulingAlgorithm_->handleSchedulingPacket(spkt);
        delete scMsg;
    } else {
        opp_error("Unknown control message type: %d", cmsg->getType());
    }
}

void SchedulingController::scheduleVoqTimeout()
{
	// To timeout inactive VOQs, we could use a separate self-message for each VOQ
	// A more efficient alternative is to use one self-message that is scheduled periodically.
	// When we receive the self-message, we check the last activity time of all
	// the VOQs and remove those that are old
	LOG(DEBUG) << endl;
	if (VOQTimeout_ == 0) return;
	if (voqMap_.size() > 0) scheduleAt(simTime() + VOQTimeout_, CheckVOQTimeoutEvent_);
}


// XXX Instead of allocating all voq's in a vector,
// assign each one a to identify it using the name _src->dst convention
void SchedulingController::allocateVoq(uint destAddr)
{
    LOG(DEBUG) << "Allocating new VOQ for " << destAddr << endl;
    // Allocate initial VOQ

    int vecIndex = voqMap_.size();

    // Could use the all in one method....
    // i.e. cModule *mod = moduleType->createScheduleInit("node", this);
    cModuleType *moduleType = cModuleType::get("datacenter.model.node.schedulingLayer.VirtualOutputQueue");
    //Instead use the following steps:
    // 1) create()
    std::stringstream voqName; voqName << "voq_" << address_ << "->" << destAddr;
    VirtualOutputQueue *newVoq = check_and_cast<VirtualOutputQueue *>(moduleType->create(voqName.str().c_str(), getParentModule())); //, vectorSize, vecIndex));
    // 2) finalizeParameters()
    newVoq->par("address") = address_;
    newVoq->finalizeParameters();
    // 3) buildInside()
    //newVoq->buildInside(); // Not necessary for simple modules
    newVoq->registerSignals();
    // 4) scheduleStart()
    newVoq->scheduleStart(simTime());
    // 5) callInitialize
    newVoq->callInitialize();

    newVoq->setDestAddr(destAddr);

    voqMap_[destAddr] = newVoq;

    // Set the visual position of the VOQ so that the VOQs form an array in TKENV
    int x = 318; // XXX temp
    int yBase = 50; int ySpace = 75;
    int y = yBase + vecIndex*ySpace;
    cDisplayString & voqDisplayString = newVoq->getDisplayString();
    voqDisplayString.setTagArg("p",x,y);
    //voqDisplayString.setTagArg("p",1,y);

    // Tell demux/mux about the new VOQ so it can connect to it
    demux_->connectToVoq(newVoq);
    mux_->connectToVoq(newVoq);

    // Notify the scheduling algorithm of the new VOQ
    schedulingAlgorithm_->newVoqAllocated(newVoq);
}


void SchedulingController::checkVoqTimeout()
{
	// Run through the list of VOQs and see if any need to be timedout
	//removeVoq(msg->getKind());
	LOG(DEBUG) << endl;
	// Must be careful when deleting while iterating over items from std::map
	// So record which ones should be removed, then remove them.
	std::vector<uint> toDelete; VirtualOutputQueue *voq;
	for (VOQMap::iterator it = voqMap_.begin(); it != voqMap_.end(); it++) {
		voq = it->second;
		LOG(DEBUG) << "Checking timeout for VOQ corresponding to destination " << voq->getDestAddr() << endl;
		if ((simTime() - voq->getLastActiveTime()) > VOQTimeout_) {
			LOG(DEBUG) << "VOQ is timed out. Last active at time " << voq->getLastActiveTime() << endl;
			toDelete.push_back(voq->getDestAddr());
		}
	}
	for (std::vector<uint>::iterator it = toDelete.begin(); it != toDelete.end(); it++) {
	    removeVoq(*it);
	}

}

void SchedulingController::removeVoq(uint destAddr)
{
	LOG(DEBUG) << "Removing VOQ for destination address " << destAddr << endl;

	// Find the VOQ
	VirtualOutputQueue *voq = lookupVoq(destAddr);

	// Notify the scheduling algorithm that the VOQ is about to be removed
	schedulingAlgorithm_->voqTimedOut(voq);

	// Have the other scheduling layer components remove any connections/state associated with the VOQ
	demux_->disconnectFromVoq(voq);
	mux_->disconnectFromVoq(voq);

	// Call finish and delete the module
	voq->callFinish();
	voq->deleteModule();

	voqMap_.erase(destAddr);
}

SchedulingController::~SchedulingController()
{
	//delete schedulingAlgorithm_; schedulingAlgorithm_ = NULL; // XXX is this necessary or how does an object created with createOne get removed
	if (CheckVOQTimeoutEvent_) cancelAndDelete(CheckVOQTimeoutEvent_); CheckVOQTimeoutEvent_ = NULL;
}

Define_Module(SchedulingController);
