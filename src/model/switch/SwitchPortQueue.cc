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
#include "ControlProcessor.h"
#include "SwitchPortQueue.h"

SwitchPortQueue::SwitchPortQueue()
{
}

uint SwitchPortQueue::getSwitchLevel() { return cp_->getSwitchLevel(); }
uint SwitchPortQueue::getStage() {
    uint levels = cp_->getNumLevels();
    if (isUpPort) { return levels - cp_->getSwitchLevel(); }
    else { return levels + cp_->getSwitchLevel(); }
}

void SwitchPortQueue::initialize(int stage)
{
	L2Queue::initialize(stage); // XXX is this not necessary?

	LOG(DEBUG) << typeid(this).name() << "stage = " << stage << endl;

	if (stage == 0) {
	    dropPktPtrSignal = registerSignal("dropPktPtr");
        dropPktSrcHostSignal = registerSignal("dropSrcHost");
        dropPktDstHostSignal = registerSignal("dropDstHost");
        updateQueueSizeBytesSignal = registerSignal("updateQueueSizeBytes");
        updateQueueSizePktsSignal = registerSignal("updateQueueSizePkts");
        WATCH(queueSizeBytes);
        WATCH(queueSizePkts);
        isUpPort = (!strcmp(this->getName(), "up_port_queue"));
        portIndex_ = this->getIndex();

        useDirectMsgSending_ = par("useDirectMsgSending");
        cp_ = NULL;
        cModule *switchModule = this->getParentModule();
        for (cModule::SubmoduleIterator iter(switchModule); !iter.end(); iter++) {
            if (!strcmp(iter()->getName(), "controlProcessor")) {
                cp_ = check_and_cast<ControlProcessor*>(iter()); break;
            }
        }

        queue.setEnabled(par("useVirtualPacketQueue").boolValue());

        // Useful for debugging
        /*
        rxPktSrcSignal = registerSignal("rxPktSrc");
        rxPktDstSignal = registerSignal("rxPktDst");
        rxPktPrioritySignal = registerSignal("rxPktPriority");*/
	}
}

void SwitchPortQueue::passUpwards(cMessage *msg)
{
    if (useDirectMsgSending_) {
        if (isUpPort) {
            cp_->upPortDirectIn(msg, portIndex_);
        } else {
            cp_->downPortDirectIn(msg, portIndex_);
        }

    } else {
        send(msg, out_);
    }
}

/*
void SwitchPortQueue::handleMessage(cMessage *msg)
{
    if (msg->getArrivalGate() == in_ && msg->isPacket()) {
        // Came from control processor
        DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);
        emit(rxPktSrcSignal, pkt->getSrcAddr());
        emit(rxPktDstSignal, pkt->getDestAddr());
        emit(rxPktPrioritySignal, pkt->getSchedulingPriority());
    }
    L2Queue::handleMessage(msg);
}*/

void SwitchPortQueue::handleMessageDirect(cMessage *msg)
{
    Enter_Method("Received msg via direct method call");
    take(msg); // XXX Necessary?
    // Pretend like the message arrived on the in gate
    msg->setArrival(this, in_->getId()); // XXX This right?
    // And handle it normally
    handleMessage(msg);
}

void SwitchPortQueue::dropPacket(DCN_EthPacket *pkt)
{
	DCN_EthPacket *packet = check_and_cast<DCN_EthPacket *>(pkt);
	if IN_MEASUREMENT_INTERVAL(pkt) {
	    emit(dropPktPtrSignal, packet);
        emit(dropPktSrcHostSignal, packet->getSrcAddr());
        emit(dropPktDstHostSignal, packet->getDestAddr());
	}
	L2Queue::dropPacket(pkt);
}

void SwitchPortQueue::updateQueueSize(long newQueueSizeBytes, long newQueueSizePkts)
{
    Enter_Method_Silent();
    LOG(DEBUG) << "queueSizeBytes = " << newQueueSizeBytes << " queueSizePkts " << newQueueSizePkts << endl;
    // Drop packets if necessary so queues respect new queue sizes
    if (newQueueSizeBytes) {
        emit(updateQueueSizeBytesSignal, newQueueSizeBytes);
        while ((queue.getByteLength() > newQueueSizeBytes)) {
            LOG(DEBUG) << "Bytes in queue " << queue.getByteLength() << " > "
                       << newQueueSizeBytes << " dropping packet at back of queue..." << endl;
            DCN_EthPacket *pkt = (DCN_EthPacket*)queue.pop_back();
            dropPacket(pkt);
        }
    }
    if (newQueueSizePkts) {
        while ((queue.getLength() > newQueueSizePkts)) {
            emit(updateQueueSizePktsSignal, newQueueSizePkts);
            LOG(DEBUG) << "Packets in queue " << queue.getLength() << " > "
                       << newQueueSizePkts << " dropping packet at back of queue..." << endl;
            DCN_EthPacket *pkt = (DCN_EthPacket*)queue.pop_back();
            dropPacket(pkt);
        }
    }
    queueSizePkts = newQueueSizePkts;
    queueSizeBytes = newQueueSizeBytes;
}

SwitchPortQueue::~SwitchPortQueue()
{
}

Define_Module(SwitchPortQueue);

