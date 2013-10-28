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
#ifndef LinkProxy_H_
#define LinkProxy_H_

#include "set.h"
#include "matrix.h"
#include "RequestPacket.h"
#include "ResponsePacket.h"

template <typename T> Matrix<T> BklgPropShares(Matrix<T> &B_l, Matrix<T> &Q_l, T c_l);

class LinkProxy;

// Classes
class ProxyFlowRecord { // Kept at each link object
public:
    bklg_t bklg;
    rate_t request;
    rate_t share;
    rate_t rate;
    uint index;
    friend std::ostream& operator<<(std::ostream& os, const ProxyFlowRecord&);
};

// Typedefs
typedef std::map<Flow, ProxyFlowRecord> ProxyFlowRecordMap;
typedef ProxyFlowRecordMap::iterator PFSIter;
typedef ProxyFlowRecordMap::const_iterator PFSCIter;

class LinkProxy : public cSimpleModule {
public:
    friend std::ostream& operator<<(std::ostream&, const LinkProxy &);
    friend std::ostream& operator<<(std::ostream&, const LinkProxy *);
    virtual std::string info() const;
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
private:
    void copy(const LinkProxy& other);
    // Everything above is required by cOwnedObject
public:
    string name;        // Name of the link
    rate_t c_l;         // link capacity
    rate_t u_l;         // usable capacity, i.e. allocatabale()
    rate_t ctrlRate_;   // per-flow control overhead to factor in
    rate_t minRate_;    // min-rate a flow can be assigned
    // We account for min-rate simply by removing it from u_l
    ProxyFlowRecordMap flows;
public:
    // These can be called from outside:
    virtual void handleReqPkt(RequestPacket *reqPkt, bool debug=false); // reqPkt from BPFlow
    virtual void handleRspPkt(ResponsePacket *rspPkt, bool debug=false); // rspPkt from BPDstLink
    virtual void handleFlowTimeout(Flow flow);
public:
    virtual rate_t assignRate(Flow flow, ResponsePacket *rspPkt);
    virtual void init(string name, rate_t capacity, rate_t ctrlRate=0, rate_t minRate=0);
    virtual string getString() const;
    virtual string getStateString() const;
    virtual inline rate_t allocatable() const { return (c_l - (controlOverhead() + flows.size()*minRate_)); }
    virtual inline rate_t controlOverhead() const { return ctrlRate_*flows.size(); }
    virtual bool flowExists(Flow flow) const { return (flows.find(flow) != flows.end()); }
    virtual void addFlow(Flow flow);
    virtual uint flow_idx(Flow flow) { uint i = 0; for (PFSIter it = flows.begin(); it != flows.end(); it++) { if (flow.raw_value == it->first.raw_value) break; i++; } return i; }
    #define FSUM_(FIELD, TYPE) TYPE X = 0; for (PFSCIter it = flows.begin(); it != flows.end(); it++) { X += it->second.FIELD; } return X;
    #define FILL_ROW_(M, FIELD) uint j=0; for (PFSCIter it = flows.begin(); it != flows.end(); it++) { M(0,j++) = it->second.FIELD; }
    #define GET_ARRAY_(FIELD, TYPE, n) Matrix<TYPE> M = zeros<TYPE>(1,n); FILL_ROW_(M, FIELD); return M;
    bklg_t sumBklgs() const { FSUM_(bklg, bklg_t); }
    rate_t sumRequests() const { FSUM_(request, rate_t); }
    rate_t sumShares() const { FSUM_(share, rate_t); }
    rate_t sumRates() const { FSUM_(rate, rate_t); }

    Set<Flow> F_l() const { Set<Flow> F; for (PFSCIter it = flows.begin(); it != flows.end(); it++) F.add(it->first); return F; }
    Matrix<bklg_t> B_l() const  { GET_ARRAY_(bklg, bklg_t, flows.size()); }
    Matrix<bklg_t> Q_l() const  { GET_ARRAY_(request, rate_t, flows.size()); }
    Matrix<bklg_t> S_l() const  { GET_ARRAY_(share, rate_t, flows.size()); }
    Matrix<bklg_t> R_l() const  { GET_ARRAY_(rate, rate_t, flows.size()); }

protected:
    // Statistics:
    simsignal_t totAllocRateSignal;
    simsignal_t totAllowRateSignal;
    simsignal_t controlOverheadSignal;
    simsignal_t totBklgSignal;
    simsignal_t numFlowsSignal;
};

#endif
