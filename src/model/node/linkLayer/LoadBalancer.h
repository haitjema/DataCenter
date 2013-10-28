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

#ifndef LOADBALANCER_H_
#define LOADBALANCER_H_

#include "FatTreeNode.h"
#include "Path.h"

// XXX LoadBalancer may not have to extend FatTree node if it only needs numberOfPaths

// Load balancer picks a path for the outgoing packet
class LoadBalancer : public FatTreeNode {
public:
	LoadBalancer();
	virtual void initialize(); //(cSimpleModule *parent, uint number_of_paths);
	virtual void handleMessage(cMessage *msg);
	virtual ~LoadBalancer();

	virtual uint choosePath(DCN_EthPacket *pkt); // = 0; // Abstract class


protected:
    virtual std::string pathsString();
    virtual std::string pathString(uint index);

	// Gates
	cGate* to_lower_layer_;
	cGate* to_upper_layer_;
	cGate* from_lower_layer_;
	cGate* from_upper_layer_;

    std::vector<Path*> paths_; // Path modules
    // Note: instead of using the STL vector, I could use cArray (discussed in 6.5.2 of the manual)
    std::vector<int> pathList_;
    uint numPaths_;
    uint currentIndex_;
};


// Equal Cost MultiPath - hashes flows to paths.
class ECMPLoadBalancer : public LoadBalancer {
public:
    virtual void initialize();
    virtual uint choosePath(DCN_EthPacket *pkt);
protected:
    typedef std::map<uint, uint> ServerPathMap;
    ServerPathMap pathAssignments_;
};


// Valiant Load Balancing - randomly chooses a path for each packet
class VLBLoadBalancer : public LoadBalancer {
public:
	virtual uint choosePath(DCN_EthPacket *pkt);
};


// Round Robin - chooses paths in round robin fashion, sends one packet per path
class RRLoadBalancer : public LoadBalancer {
public:
    virtual void initialize();
    virtual uint choosePath(DCN_EthPacket *pkt);

protected:
    virtual void newRound();
    virtual void pathPermutation();
    bool usePermutations;
};


// Surplus Round Robin - chooses paths in round robin fashion, sends quantum bytes worth of packets per path
class SRRLoadBalancer : public RRLoadBalancer {
public:
    virtual void initialize();
    virtual uint choosePath(DCN_EthPacket *pkt);
    virtual ~SRRLoadBalancer();
protected:
    virtual void newRound();
    std::string pathString(uint index);
    std::vector<int> deficitCounter_;
    uint quantum_;
};


// Rehash - chooses a new random path after quantum bytes.
class RehashLoadBalancer : public SRRLoadBalancer {
public:
    virtual void initialize();
    virtual uint choosePath(DCN_EthPacket *pkt);
};


// Sorted Deficit - always chooses the path with the most credits.
class SDLoadBalancer : public SRRLoadBalancer {
public:
    virtual void initialize();
    virtual uint choosePath(DCN_EthPacket *pkt);
};


// Destination Sorted Deficit - same as sorted deficit except that 
// accounting is performed on a per-destination basis.
class DSDLoadBalancer : public SDLoadBalancer {
public:
    virtual uint choosePath(DCN_EthPacket *pkt);
    virtual ~DSDLoadBalancer();

    class DestPathState {
    public:
        DestPathState(uint numPaths, uint quantum, bool usePermutations);
        uint choosePath(DCN_EthPacket *pkt);
        void newRound();
        void pathPermutation();
        uint numPaths_;
        uint quantum_;
        bool usePermutations;
        std::vector<int> pathList_;
        std::vector<int> deficitCounter_;
        std::string pathsString();
        std::string pathString(uint index);
    };
    typedef std::map<uint, DestPathState*> DPSMap;
    DPSMap destPathState;
};

// Two-phase Load balancer - In addition to normal set of counters, the TP 
// load balancer maintains a separate list of counters for each destination
// and it simply adds the credits from both counters together to determine
// which path has the most credits.
class TPLoadBalancer : public DSDLoadBalancer {
    virtual uint choosePath(DCN_EthPacket *pkt);
};

// There is one more... MPLoadBalancer which I moved to its own file. See MPLoadBalancer.{cc, h}

#endif /* LOADBALANCER_H_ */
