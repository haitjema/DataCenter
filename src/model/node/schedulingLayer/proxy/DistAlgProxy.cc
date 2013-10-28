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
#include "DistAlgProxy.h"

Define_Module(DistAlgProxy);
Register_Class(LPFlow);

//----------------------------------------------------------------------------------------------------
// LPFlow
//----------------------------------------------------------------------------------------------------

LPFlow::LPFlow(const char *name) : cOwnedObject(name)
{
    sendNextCtrlPkt = NULL;
}

LPFlow::LPFlow(const LPFlow& other) : cOwnedObject(other)
{
    sendNextCtrlPkt = NULL;
    copy(other);
}

LPFlow *LPFlow::dup() const
{
    return new LPFlow(*this);
}

LPFlow& LPFlow::operator=(const LPFlow& other)
{
    if (&other==this) return *this;
    cOwnedObject::operator=(other);
    copy(other);
    return *this;
}

std::ostream& operator<<(std::ostream &os, const LPFlow &flow) {
    os << flow.info(); return os;
}

void LPFlow::copy(const LPFlow& other) {
    flow = other.flow; bklg = other.bklg; share = other.share; rate = other.rate;
    if (sendNextCtrlPkt && sendNextCtrlPkt->getOwner()==this) delete sendNextCtrlPkt;
    if (other.sendNextCtrlPkt && (other.sendNextCtrlPkt->getOwner()==const_cast<LPFlow*>(&other))) {
        take(sendNextCtrlPkt = other.sendNextCtrlPkt->dup());
    } else {
        sendNextCtrlPkt = other.sendNextCtrlPkt;
    }
}

void LPFlow::forEachChild(cVisitor *v)
{
    if (sendNextCtrlPkt) v->visit(sendNextCtrlPkt);
}

std::string LPFlow::info() const {
    sstring out; out << flow << ": bklg=" << bklg << ", share=" << share << ", rate=" << rate; return out.str();
}

void LPFlow::init(Flow flow, bklg_t bklg, rate_t rate)
{
    this->flow = flow; this->bklg = bklg; share = 0; this->rate = rate;
}

LPFlow::~LPFlow()
{
}

//----------------------------------------------------------------------------------------------------
// DistAlgProxy
//----------------------------------------------------------------------------------------------------

void DistAlgProxy::initialize(int stage)
{
    SchedulingAlgorithm::initialize(stage);
    if (stage == 0) {
        schedPeriod = par("SchedulingPeriod");
        desynchSchedIntervals_ = par("DesynchSchedIntervals");
        max_min = par("MaxMin").boolValue();
    } else {
        allocateLinks();
    }
}

rate_t DistAlgProxy::calcControlOverhead()
{
    // Assume each flow sends and receives one control packet (assumed to be 84 bytes) every scheduling period.
    // Note: the factor 2 is necessary because we account for flow (i,j)'s control traffic in the forward direction
    // but not in the reverse. Since we assume j allocates a voq for i, however, we know that there will be control packets for both flows (i,j) and (j,i).
    // Thus doubling it lets us account for both flows without having to do the accounting in each direction separately.
    if (controller_->sendSchedPktAsControl_) return 0; // No overhead when using my out-of-band module-to-module control messages
    return (rate_t)2*BITS_PER_BYTE*DCN_MIN_PACKET_SIZE/schedPeriod;
}

void DistAlgProxy::allocateLinks()
{
    // XXX Currently only support virtual switch abstraction
    cModuleType *moduleType = cModuleType::get("datacenter.model.node.schedulingLayer.proxy.LinkProxy");
    // Subtract the reserve bandwidth from the capacity we can allocate to flows
    rate_t capacity = (linkRate_ - reserveBandwidth_);
    rate_t ctrlRate = calcControlOverhead();
    rate_t minRate = minVoqSendRate_;
    rate_t C_l = rate_to_frac(capacity);
    rate_t crf = rate_to_frac(ctrlRate);
    rate_t mrf = rate_to_frac(minRate);
    sstring ltgName; ltgName << "Link(" << address_ << ",G)";
    linkToGroupSwitch_ = (LinkProxy *)moduleType->createScheduleInit(ltgName.str().c_str(), this);
    linkToGroupSwitch_->init(ltgName.str(), C_l, crf, mrf);
    sstring lfgName; lfgName << "Link(G," << address_ << ")";
    linkFromGroupSwitch_ = (LinkProxy *)moduleType->createScheduleInit(lfgName.str().c_str(), this);
    linkFromGroupSwitch_->init(lfgName.str(), C_l, crf, mrf);
}

void DistAlgProxy::handleMessage(cMessage *msg)
{
    if (msg->isSelfMessage() && msg->getContextPointer()) {
        LPFlow *flow = (LPFlow*)msg->getContextPointer();
        ASSERT(flow->sendNextCtrlPkt == msg);
        sndReqPkt(flow);
        // Scheduling next control packet to send for flow
        scheduleAt(simTime() + schedPeriod, msg);
    } else {
        // XXX Should this happen?
        SchedulingAlgorithm::handleMessage(msg);
    }
}

void DistAlgProxy::rcvReqPkt(RequestPacket *reqPkt)
{
    linkFromGroupSwitch_->handleReqPkt(reqPkt);

    ResponsePacket *rspPkt = new ResponsePacket; // Generate response to send back
    rspPkt->setSrcAddr(address_); rspPkt->setDestAddr(reqPkt->getSrcAddr()); // Response packet from our outgoing link stays local
    rspPkt->share() = reqPkt->request();
    rspPkt->rate() = reqPkt->request();

    linkFromGroupSwitch_->handleRspPkt(rspPkt);
    sndCtrlPkt(rspPkt);
}

void DistAlgProxy::rcvRspPkt(ResponsePacket *rspPkt)
{
    Flow f_ij; f_ij.src = rspPkt->getDestAddr(); f_ij.dst = rspPkt->getSrcAddr();
    if (SrcFlows.find(f_ij) == SrcFlows.end()) opp_error("Couldn't find SrcFlow for rspPkt");
    LPFlow *flow = SrcFlows[f_ij];

    linkToGroupSwitch_->handleRspPkt(rspPkt);

    flow->rate  = rspPkt->rate();
    flow->share = rspPkt->share();

    if (flow->rate > flow->share) { opp_error("rate exceeds share!"); }

    setVoqRate(flow);
}

void DistAlgProxy::sndReqPkt(LPFlow *flow)
{
    // Lookup the VOQ and get updated state from the VOQ
    uint src = address_; uint dst = flow->flow.dst;
    flow->bklg = getVoqBklg(flow);

    // Skip if the VOQ is empty and the share and rate are 0
    // The flow does not need any bandwidth nor does it have any reserved at links.
    if (flow->bklg == 0 && flow->share == 0 && flow->rate == 0) return;

    // Generate request packet for flow
    RequestPacket *reqPkt = new RequestPacket;
    reqPkt->setSrcAddr(src); reqPkt->setDestAddr(dst);

    if (max_min) reqPkt->bklg() = 1;
    else reqPkt->bklg() = flow->bklg;

    if (controller_->enforceBacklogConstraint_) reqPkt->request() = flow->bklg; // bklg is already in terms of fraction of link rate
    else reqPkt->request() = rate_to_frac(linkRate_);

    linkToGroupSwitch_->handleReqPkt(reqPkt);

    controller_->sendSchedulingPacket(reqPkt);
}

rate_t DistAlgProxy::getVoqBklg(LPFlow* flow)
{
    VirtualOutputQueue *voq = controller_->lookupVoq(flow->flow.dst);
    if (!voq) opp_error("Couldn't find VOQ to match LPFlow");
    return bklg_to_frac(voq->getBacklog());
}

void DistAlgProxy::setVoqRate(LPFlow* flow) {
    VirtualOutputQueue *voq = controller_->lookupVoq(flow->flow.dst);
    uint64 ovhd = (voq->noSchedAccounting_) ? 0 : (uint64)calcControlOverhead();
    uint64 voqRate = (uint64)frac_to_rate(flow->rate) + minVoqSendRate_ + ovhd;
    voq->emitBPState(flow->bklg, flow->share, flow->rate);
    voq->setSendingRate(voqRate);
}

void DistAlgProxy::sndCtrlPkt(SchedulingPacket *sPkt)
{
    VirtualOutputQueue *voq = controller_->lookupVoq(sPkt->getDestAddr());
    controller_->sendSchedulingPacket(sPkt);
    if (!voq->noSchedAccounting_ && voq->getSendingRate() < (uint64)calcControlOverhead()) voq->setSendingRate((uint64)calcControlOverhead());
}

void DistAlgProxy::newVoqAllocated(VirtualOutputQueue *voq)
{
    Enter_Method("newVoqAllocated");
    LOG(DEBUG) << endl;
    voq->setSendingRate(0); // Don't add rate for control overhead yet...
    Flow f_ij = voq_flow(voq);
    bklg_t bklg = bklg_to_frac(voq->getBacklog());
    rate_t rate = rate_to_frac(voq->getSendingRate());
    // Allocate a new LPFlow object to represent the VOQ state for the algorithm
    std::stringstream name; name << f_ij;
    SrcFlows[f_ij] = new LPFlow(name.str().c_str());
    SrcFlows[f_ij]->init(f_ij, bklg, rate);
    cMessage *sendNextCtrlPkt = new cMessage(name.str().c_str());
    // For convenience, let the message and LPFlow objects keep pointers to each other
    sendNextCtrlPkt->setContextPointer(SrcFlows[f_ij]);
    SrcFlows[f_ij]->sendNextCtrlPkt = sendNextCtrlPkt;
    // Schedule event to send first control packet
    if (desynchSchedIntervals_) {
        // Use a random time to desynchronize flows when they all start around the same time
        scheduleAt(simTime() + dblrand()*schedPeriod, sendNextCtrlPkt);
    } else {
        scheduleAt(simTime(), sendNextCtrlPkt); // Schedule immediately
    }
}

void DistAlgProxy::voqTimedOut(VirtualOutputQueue *voq)
{
    Enter_Method("voqTimedOut");
    Flow f_ij = voq_flow(voq);
    linkToGroupSwitch_->handleFlowTimeout(f_ij);
    linkFromGroupSwitch_->handleFlowTimeout(f_ij);
    LPFlow *flow = SrcFlows[f_ij];
    cancelAndDelete(flow->sendNextCtrlPkt);
    flow->sendNextCtrlPkt = NULL;
    delete flow; SrcFlows.erase(f_ij);
}

void DistAlgProxy::handleSchedulingPacket(SchedulingPacket *pkt)
{
    Enter_Method("handleSchedulingPacket");
    if (pkt->getSchedPktType() == SCHEDULING_REQUEST) {
        RequestPacket *reqPkt = check_and_cast<RequestPacket*>(pkt);
        rcvReqPkt(reqPkt);
        delete reqPkt;
    } else if (pkt->getSchedPktType() == SCHEDULING_RESPONSE) {
        ResponsePacket *rspPkt = check_and_cast<ResponsePacket *>(pkt);
        rcvRspPkt(rspPkt);
        delete rspPkt;
    } else {
        opp_error("Unknown scheduling packet type received!");
    }
}

DistAlgProxy::~DistAlgProxy()
{
    for (LPFMIter it = SrcFlows.begin(); it != SrcFlows.end(); it++) {
        LPFlow *flow = it->second; cancelAndDelete(flow->sendNextCtrlPkt); delete flow;
    } SrcFlows.clear();
    delete linkFromGroupSwitch_; delete linkToGroupSwitch_;
    linkFromGroupSwitch_ = NULL; linkToGroupSwitch_ = NULL;
}



