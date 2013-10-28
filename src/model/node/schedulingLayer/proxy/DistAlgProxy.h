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

#ifndef DISTALGPROXY_H_
#define DISTALGPROXY_H_

#include "RequestPacket.h"
#include "ResponsePacket.h"
#include "LinkProxy.h"
#include "VirtualOutputQueue.h"
#include "SchedulingAlgorithm.h"

class LPFlow : public cOwnedObject { // Reflects the VOQ state
public:
    LPFlow(const char *name=NULL);
    LPFlow(const LPFlow& other);
    friend std::ostream& operator<<(std::ostream&, const LPFlow &);
    virtual LPFlow *dup() const;
    LPFlow& operator=(const LPFlow& other);
    friend bool operator<( const LPFlow& lhs, const LPFlow& rhs ) { return (lhs.flow < rhs.flow); }
    virtual ~LPFlow();
    virtual void forEachChild(cVisitor *v);
    virtual std::string info() const;
private:
    void copy(const LPFlow& other);
public:
    virtual void init(Flow flow, bklg_t bklg, rate_t rate);
    cMessage *sendNextCtrlPkt; // Owned by DistAlgProxy
    Flow flow;
    bklg_t bklg;
    rate_t share; // Not really needed but useful for debugging
    rate_t rate;
};

typedef std::map<Flow, LPFlow*> LPFlowMap;
typedef LPFlowMap::iterator LPFMIter;

class DistAlgProxy : public SchedulingAlgorithm {
public:
    DistAlgProxy() {}
    virtual ~DistAlgProxy();
    virtual void initialize(int stage);
    virtual void handleMessage(cMessage *);

public:
    // The API for our scheduling algorithm class
    virtual void newVoqAllocated(VirtualOutputQueue *voq);
    virtual void voqTimedOut(VirtualOutputQueue *voq); // VOQ timeouts currently disabled
    virtual void handleSchedulingPacket(SchedulingPacket *pkt);
protected:
    virtual void allocateLinks();
    virtual void sndReqPkt(LPFlow *flow);
    virtual void rcvReqPkt(RequestPacket *reqPkt);
    virtual void rcvRspPkt(ResponsePacket *rspPkt);
    virtual rate_t calcControlOverhead();

    virtual void setVoqRate(LPFlow* flow);
    virtual rate_t getVoqBklg(LPFlow* flow);
    virtual void sndCtrlPkt(SchedulingPacket *sPkt);

protected:
    Flow voq_flow(VirtualOutputQueue *voq) { Flow flow; flow.src = address_; flow.dst = voq->getDestAddr(); return flow; }
    inline rate_t rate_to_frac(rate_t rate) { return rate/linkRate_; }
    inline rate_t frac_to_rate(rate_t rate) { return rate*linkRate_; }
    // can transfer linkRate_*schedPeriod bklg units per schedPeriod
    inline bklg_t bklg_to_frac(bklg_t bklg) { return 8*bklg/(schedPeriod.dbl()*linkRate_); }
    inline bklg_t frac_to_bklg(bklg_t bklg) { return bklg*(schedPeriod.dbl()*linkRate_)/8; }
    bool max_min;
    bool desynchSchedIntervals_;
    simtime_t schedPeriod;
    //uint64 minVoqSendRate_; // Already declared by parent class
    LPFlowMap SrcFlows; // One-to-one mapping with VOQs
    LinkProxy *linkToGroupSwitch_;
    LinkProxy *linkFromGroupSwitch_;
};

#endif /* DISTALGPROXY_H_ */
