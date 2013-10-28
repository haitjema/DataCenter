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

#ifndef MPLOADBALANCER_H_
#define MPLOADBALANCER_H_

#include "LoadBalancer.h"
#include "node_id.h"

typedef std::vector<int> LinkCredits;
std::ostream & operator <<(std::ostream &, const LinkCredits &);

class MP_Node : public SubTreeID {
public:
    MP_Node(const SubTreeID &ID, uint depth);
    MP_Node(const MP_Node &node, uint daddr, uint depth);
    ~MP_Node();
    void initialize();

    std::string getString() const;
    friend std::ostream & operator <<(std::ostream &, const SubTreeID &);

    int creditsOnPath(uint daddr, uint path);
    void performAccounting(DCN_EthPacket *pkt, uint path, uint quantum);
    void newQuantum(uint quantum);
    void deleteTree();

protected:
    uint linkForPath(uint path) { return path/(getNumberOfPaths()/numLinks_); }
    uint depth_;
    uint numLinks_;
    LinkCredits linkCredits_;
    MP_Node *parentSubTree_;
    std::vector<MP_Node*> childSubTrees_;
};

// Note: While MPLoadBalancer conceptually extends TPLoadBalancer and uses the
// same parameters, the implementation is different enough that we have to go
// back to round-robin to find their common ancestor.
class MPLoadBalancer : public RRLoadBalancer {
public:
    MPLoadBalancer() {}
    ~MPLoadBalancer();
    void initialize();
    uint choosePath(DCN_EthPacket *pkt);
    void deleteTree();

protected:
    uint quantum_;
    MP_Node *mySubTree_;
    int pktsInRound_;
};

#endif /* MPLOADBALANCER_H_ */
