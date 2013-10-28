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
#include "LinkProxy.h"

Define_Module(LinkProxy);

//----------------------------------------------------------------------------------------------------
// BklogPropShares as presented in my dissertation
//----------------------------------------------------------------------------------------------------

template <typename T>
Matrix<T> BklgPropShares(Matrix<T> &B_l, Matrix<T> &Q_l, T c_l) {
    T u_l = c_l;
    T b_l = B_l.sum();
    uint n = Q_l.cols();
    Matrix<T> S_l = zeros<T>(1,n);
    Set<uint> F; uint i;
    Set<uint> U,L;
    for (i = 0; i < n; i++) F.add(i);
    while (L != F - U) {
        L = F - U;
        for (uint i_ = 0; i_ < L.size(); i_++) {
            i = L[i_];
            if (!B_l(0,i) || !b_l) S_l(0,i) = 0;
            else S_l(0,i) = u_l*B_l(0,i)/b_l;
            if (Q_l(0,i) < S_l(0,i)) {
                S_l(0,i) = Q_l(0,i);
                b_l -= B_l(0,i);
                u_l -= S_l(0,i);
                U.add(i);
            }
        }
    }
    return S_l;
}

//----------------------------------------------------------------------------------------------------
// ProxyFlowRecord
//----------------------------------------------------------------------------------------------------

std::ostream & operator<< (std::ostream &os, const ProxyFlowRecord &pfs)
{
    os << "FlowRecord: b(f)=" << pfs.bklg << ", q(f)=" << pfs.request
       << ", s(f)=" << pfs.share << ", r(f)=" << pfs.rate;
    return os;
}

//----------------------------------------------------------------------------------------------------
// LinkProxy
//----------------------------------------------------------------------------------------------------

void LinkProxy::initialize()
{
    totAllocRateSignal = registerSignal("TotalAllocatedRate");
    totAllowRateSignal = registerSignal("TotalAllowedRate");
    controlOverheadSignal = registerSignal("ControlOverhead");
    totBklgSignal = registerSignal("TotalBacklog");
    numFlowsSignal = registerSignal("NumFlows");
    // Make proxy's state inspectable
    WATCH_MAP(flows);
    WATCH(ctrlRate_);
    WATCH(minRate_);

}

void LinkProxy::handleMessage(cMessage *msg)
{
    opp_error("LinkProxy::handleMessage() unexpected");
}

void LinkProxy::init(string name, rate_t capacity, rate_t ctrlRate, rate_t minRate)
{
    c_l = capacity; ctrlRate_ = ctrlRate; minRate_ = minRate; u_l=allocatable();
}

void LinkProxy::copy(const LinkProxy& other) {
    name = ""; flows = other.flows; c_l = other.c_l; u_l= other.u_l;
    minRate_ = other.minRate_; ctrlRate_ = other.ctrlRate_;

}

std::ostream& operator <<(std::ostream& out, const LinkProxy& link) { out << link.getString(); return out; }
std::ostream& operator <<(std::ostream& out, const LinkProxy* link) { out << link->getString(); return out; }


std::string LinkProxy::info() const { return getString(); }

string LinkProxy::getString() const { sstring o; o << "Proxy:" << name << " " << getStateString(); return o.str(); }

string LinkProxy::getStateString() const
{
    sstring out;
    out << "|F|=" << flows.size() << ", ";
    out << "c_l=" << c_l << ", ";
    out << "u_l=" << u_l << ", ";
    out << "b_l=" << sumBklgs() << ", ";
    out << "q_l=" << sumRequests() << ", ";
    out << "s_l=" << sumShares() << ", ";
    out << "r_l=" << sumRates();
    return out.str();
}

void LinkProxy::addFlow(Flow flow)
{
    // Let std::map handle the allocation
    flows[flow].bklg = 0;
    flows[flow].request = 0;
    flows[flow].share = 0;
    flows[flow].rate = 0;
    u_l = allocatable();
    emit(numFlowsSignal, (ulong)flows.size());
    emit(controlOverheadSignal, controlOverhead()); // Constant so only changes when we add/remove flow
}

void LinkProxy::handleFlowTimeout(Flow flow)
{
    Enter_Method("handleFlowTimeout");
    emit(numFlowsSignal, (ulong)flows.size());
    emit(controlOverheadSignal, controlOverhead()); // Constant so only changes when we add/remove flow
    flows.erase(flow);
}

void LinkProxy::handleReqPkt(RequestPacket *reqPkt, bool debug)
{
    Enter_Method("handleReqPkt");
    Flow flow; flow.src = reqPkt->getSrcAddr(); flow.dst = reqPkt->getDestAddr();
    if (!flowExists(flow)) { addFlow(flow); }
    flows[flow].bklg = reqPkt->bklg();
    Matrix<bklg_t> B = B_l();
    Matrix<rate_t> Q = Q_l();
    uint i = flow_idx(flow);
    Q(0,i) = reqPkt->request();
    Matrix<rate_t> S = BklgPropShares(B, Q, u_l);
    if (S[i] > reqPkt->request()) { opp_error("Share > request!"); }
    reqPkt->request() = S[i];
    emit(totBklgSignal, (double)sumBklgs());
    emit(totAllocRateSignal, (double)sumShares());
    emit(totAllowRateSignal, (double)sumRates());
}

void LinkProxy::handleRspPkt(ResponsePacket *rspPkt, bool debug)
{
    // Called when we get a response from the receiver (dstLink).
    Enter_Method("handleRspPkt");
    Flow flow; flow.dst = rspPkt->getSrcAddr(); flow.src = rspPkt->getDestAddr();
    flows[flow].request = rspPkt->share();
    flows[flow].share = rspPkt->share();
    flows[flow].rate = assignRate(flow, rspPkt);
    rspPkt->rate() = flows[flow].rate;
}

rate_t LinkProxy::assignRate(Flow flow, ResponsePacket *rspPkt)
{
    rate_t in_use = sumRates() - flows[flow].rate;
    rate_t available = u_l - in_use;
    if (available < 0) available = 0; //opp_error("negative available capacity");
    return min(rspPkt->rate(), available);
}

void LinkProxy::finish() {
    emit(numFlowsSignal, (ulong)flows.size());
    emit(controlOverheadSignal, controlOverhead()); // Constant so only changes when we add/remove flow
    emit(totBklgSignal, (double)sumBklgs());
    emit(totAllocRateSignal, (double)sumShares());
    emit(totAllowRateSignal, (double)sumRates());
}
