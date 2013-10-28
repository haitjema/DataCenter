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
#include "MPLoadBalancer.h"

std::string MP_Node::getString() const
{
    // Useful for debugging
    std::ostringstream oss;
    oss << "SubTree:" << sub_tree_id_ << "(address = " << address_
        << ", depth = " << depth_ 
        << ", # links to this subtree = " << numLinks_ 
        << ", # child subtrees = " << childSubTrees_.size() << ")";
    return oss.str();
}

std::ostream & operator<< (std::ostream &os, const MP_Node &param)
{
    os << param.getString();
    return os;
}

std::ostream & operator <<(std::ostream &os, const LinkCredits &linkCredits)
{
    for (uint i = 0; i < linkCredits.size(); i++) { 
        os << "        link " << i << " credits " << linkCredits[i] << "\n";
    }
    return os;
}

MP_Node::MP_Node(const SubTreeID &id, uint depth) : SubTreeID(id), depth_(depth)
{
    setLevelID(depth, 0);
    this->numLinks_ = up_links_[depth+1];
    initialize();
}

MP_Node::MP_Node(const MP_Node &node, uint daddr, uint depth) : 
SubTreeID::SubTreeID(node), depth_(depth)
{
    setAddress(daddr);
    for (uint i = sub_tree_id_.size() - 1; i >= depth; i--) { setLevelID(i, 0); }
    this->numLinks_ = up_links_[depth];
    initialize();
}

void MP_Node::initialize()
{
    parentSubTree_ = NULL;
    uint numChildren = down_radix_[depth_];
    linkCredits_.resize(numLinks_);
    for (uint i = 0; i < numLinks_; i++) { linkCredits_[i] = 0; }
    childSubTrees_.resize(numChildren);
    for (uint i = 0; i < numChildren; i++) { childSubTrees_[i] = NULL; }
}

int MP_Node::creditsOnPath(uint daddr, uint path)
{
    int credits = linkCredits_[linkForPath(path)];
    if (compareSubTree(depth_, daddr)) {
        if ((depth_ + 1) == sub_tree_id_.size()) { return credits; }
        uint destLink = getLevelID(depth_, daddr);
        if (!childSubTrees_[destLink]) { childSubTrees_[destLink] = new MP_Node(*this, daddr, depth_ + 1); }
        return credits + childSubTrees_[destLink]->creditsOnPath(daddr, path);
    } else {
        if (!parentSubTree_) { parentSubTree_ = new MP_Node(*this, depth_-1); }
        return credits + parentSubTree_->creditsOnPath(daddr, path);
    }
}

void MP_Node::newQuantum(uint quantum)
{
    for (uint i = 0; i < numLinks_; i++) { linkCredits_[i] += quantum; }
}

void MP_Node::performAccounting(DCN_EthPacket *pkt, uint path, uint quantum)
{
    uint daddr = pkt->getDestAddr();
    uint pktSize = pkt->getByteLength();
    // Note: Must be called after creditsOnPath() to ensure that all needed subtrees are allocated
    if (compareSubTree(depth_, daddr)) {
        if ((depth_ + 1) != sub_tree_id_.size()) { childSubTrees_[getLevelID(depth_, daddr)]->performAccounting(pkt, path, quantum); }
    } else {
        parentSubTree_->performAccounting(pkt, path, quantum);
    }

    // Perform accounting for link used
    linkCredits_[linkForPath(path)] -= pktSize;

    int maxCredits = linkCredits_[0];
    for (uint i = 0; i < numLinks_; i++) { maxCredits = (linkCredits_[i] > maxCredits) ? linkCredits_[i] : maxCredits; }
    if (maxCredits < 0) { newQuantum(quantum); }
}

void MP_Node::deleteTree()
{
    // Tell my parent to delete my siblings.
    if (parentSubTree_) { parentSubTree_->deleteTree(); }
    // Delete my parent.
    delete parentSubTree_; parentSubTree_ = NULL;
    // Delete my children.
    for (uint i = 0; i < childSubTrees_.size(); i++) {
        MP_Node *child = childSubTrees_[i];
        if (child) { child->deleteTree(); delete child; }
    }
    childSubTrees_.clear();
}

MP_Node::~MP_Node()
{
    // Note: Should call deleteTree() on the root node to properly cleanup
    if (parentSubTree_) delete parentSubTree_;
}

void MPLoadBalancer::initialize()
{
    RRLoadBalancer::initialize();
    LOG(DEBUG) << endl;
    quantum_ = par("quantum");
    pktsInRound_ = 0;

    mySubTree_ = new MP_Node(node_id_, node_id_.getDepth()-1);
}

uint MPLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    if (usePermutations && (--pktsInRound_ < 0)) { pathPermutation(); pktsInRound_ = numPaths_; }

    uint path = pathList_[0];

    int maxCredits = mySubTree_->creditsOnPath(pkt->getDestAddr(), path);
    uint maxPath = path;
    // XXX Note: I may not need to iterate over the list of paths...
    // Might be possible to get the max. path in one search of the tree
    for (uint p = 1; p < numPaths_; p++) {
        path = pathList_[p];
        int credits = mySubTree_->creditsOnPath(pkt->getDestAddr(), path);
        // Remember the path with the most credits
        if (credits > maxCredits) { maxCredits = credits; maxPath = path; }
    }

    mySubTree_->performAccounting(pkt, maxPath, quantum_);
    return maxPath;
}

void MPLoadBalancer::deleteTree()
{
    if (mySubTree_) {
        mySubTree_->deleteTree();
        delete mySubTree_;
        mySubTree_ = NULL;
    }
}

MPLoadBalancer::~MPLoadBalancer()
{
    deleteTree();
}

Define_Module(MPLoadBalancer);
