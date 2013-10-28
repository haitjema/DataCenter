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
#include "SchedulingAlgorithm.h"

void SchedulingAlgorithm::initialize(int stage)
{
    LOG(DEBUG) << endl;
    if (stage == 0) {
        address_ = par("address");
        minVoqSendRate_ = par("MinVOQSendRate").longValue();
        reserveBandwidth_ = par("ReserveBandwidth").longValue();
        OversubscriptionFactor_ = par("OversubscriptionFactor").doubleValue();
    } else {
        // Make sure the controller exists before we try to connect to it
        controller_ = check_and_cast<SchedulingController*>(getParentModule()->getSubmodule("controller"));
        linkRate_ = controller_->linkRate;
        rxRateToAllocate_ = (uint64)(OversubscriptionFactor_*linkRate_) - reserveBandwidth_;
        txRateToAllocate_ = (uint64)(OversubscriptionFactor_*linkRate_);
        WATCH(linkRate_);
        WATCH(rxRateToAllocate_);
        WATCH(txRateToAllocate_);
        WATCH(minVoqSendRate_);
        WATCH(reserveBandwidth_);
        WATCH(OversubscriptionFactor_);
    }
}

void SchedulingAlgorithm::handleSchedulingPacket(SchedulingPacket *pkt)
{
    opp_error("Not implemented");
}


void SchedulingAlgorithm::newVoqAllocated(VirtualOutputQueue *voq)
{
    LOG(DEBUG) << endl;
    // Initialize scheduling algorithm state for the VOQ
    voq->setSendingRate(minVoqSendRate_);
    // Initialize the backlog and rate assignment for the server since
    // we anticipate to receive traffic from it as well
    if (serverBacklogs_.find(voq->getDestAddr()) == serverBacklogs_.end()) { // XXX check is probably unnecessary
        serverBacklogs_[voq->getDestAddr()] = 0;
        serverRateAssignments_[voq->getDestAddr()] = minVoqSendRate_;
    }
}

void SchedulingAlgorithm::voqTimedOut(VirtualOutputQueue *voq)
{
    LOG(DEBUG) << endl;
    // Perform any actions needed to remove VOQ state
    // Assume we are no longer receiving from the destination either
    // so we can remove its backlog and rate assignment
    serverBacklogs_.erase(voq->getDestAddr());
    serverRateAssignments_.erase(voq->getDestAddr());
}


SchedulingAlgorithm::~SchedulingAlgorithm()
{
}
