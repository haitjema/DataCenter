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
#include "LoadBalancer.h"

LoadBalancer::LoadBalancer() : FatTreeNode()
{

}

void LoadBalancer::initialize()
{
	FatTreeNode::initialize();
	LOG(DEBUG) << typeid(this).name() << endl;

    to_lower_layer_ = gate("lower_layer$o");
	to_upper_layer_ = gate("upper_layer$o");
	from_lower_layer_ = gate("lower_layer$i");
	from_upper_layer_ = gate("upper_layer$i");

    numPaths_ = node_id_.getNumberOfPaths();

    // Create a list of all the paths (Used by subclasses)
    for (uint i = 0; i < numPaths_; i++) { pathList_.push_back(i); }
    currentIndex_ = 0;

	// Store references to paths
	paths_.resize(numPaths_);
	for (uint i = 0; i < paths_.size(); i++) {
		paths_[i] = check_and_cast<Path *>(getParentModule()->getSubmodule("path", i));
	}
}

LoadBalancer::~LoadBalancer() {
	paths_.clear();
	pathList_.clear();
}

void LoadBalancer::handleMessage(cMessage *msg)
{
	if (msg->getArrivalGate() != from_upper_layer_) {
		opp_error("LoadBalancer received packet on unexpected gate!");
	}

	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);

	uint path = choosePath(pkt);
	pkt->setPath(path);

	// XXX Need this because messages generated in scheduling layer currently don't have source addresses
	if (pkt->getSrcAddr() != address_) pkt->setSrcAddr(address_);

    Path *chosenPath = paths_[path];
    chosenPath->performAccounting(pkt);
    LOG(DEBUG) << pathsString();

    LOG(DEBUG) << "Sending packet down path " << path << endl;

    // Send the packet
    send(pkt, to_lower_layer_);

}

uint LoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    currentIndex_ = par("routeThroughPath"); // Should prompt the user, doesn't seem to work correctly
	return currentIndex_;
}

std::string LoadBalancer::pathsString()
{
    // In case the index is about to be wrapped around
    uint currIndex = (currentIndex_ < numPaths_) ? currentIndex_ : 0;
    std::ostringstream oss;
    oss << "List of paths:\n";
    for (uint i = 0; i < pathList_.size(); i++) {
        if (i == currIndex) {
            oss << "current path -> ";
        } else {
            oss << "                ";
        }
        oss << pathString(i);
    }
    return oss.str();
}

std::string LoadBalancer::pathString(uint index)
{
    std::ostringstream oss;
    oss << index << ": path " << pathList_[index] << "\n";
    return oss.str();
}

Define_Module(LoadBalancer);

// ------------------------------------------------------------------------------
// ECMPLoadBalancer
// ------------------------------------------------------------------------------


void ECMPLoadBalancer::initialize()
{
    LoadBalancer::initialize();
    LOG(DEBUG) << typeid(this).name() << endl;
}

uint ECMPLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    uint path;
    ServerPathMap::iterator it = pathAssignments_.find(pkt->getDestAddr());
    if (it == pathAssignments_.end()) {
        // Pick a random path to the destination and remember it
        path = intrand(numPaths_);
        pathAssignments_[pkt->getDestAddr()] = path;
    } else {
        // Use the same path to the same destination
        path = pathAssignments_[pkt->getDestAddr()];
    }
    return path;
}

Define_Module(ECMPLoadBalancer);

// ------------------------------------------------------------------------------
// VLBLoadBalancer
// ------------------------------------------------------------------------------

uint VLBLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    currentIndex_ = intrand(numPaths_);
	return currentIndex_;
}

Define_Module(VLBLoadBalancer);

// ------------------------------------------------------------------------------
// RRLoadBalancer
// ------------------------------------------------------------------------------

void RRLoadBalancer::initialize()
{
    LoadBalancer::initialize();
    LOG(DEBUG) << typeid(this).name() << endl;

    usePermutations = par("usePermutations");

    // Chose a random path to start with
    //currentIndex_ = intrand(numPaths_);
    pathPermutation();
    // Since choosePath() increments the index, we set index to max so that
    // we immediately cycle around to 0 and start a new round.
    // This is just to ensure we start with index 0 instead of 1.
    currentIndex_ = numPaths_;
}

void RRLoadBalancer::newRound()
{
    currentIndex_ = 0;
    if (usePermutations) { pathPermutation(); }
}

uint RRLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    // Simply proceed in round robin fashion, one packet per path
    currentIndex_++;
    if (currentIndex_ >= numPaths_) { newRound(); }

    return pathList_[currentIndex_];
}

void RRLoadBalancer::pathPermutation()
{
    // Create a random permutation on the list of paths
    for (uint i = 0; i < pathList_.size(); i++) {
        // Swap each element with a random element
        std::swap(pathList_[i],pathList_[intrand(numPaths_)]);
    }
}

Define_Module(RRLoadBalancer);

// ------------------------------------------------------------------------------
// SRRLoadBalancer
// ------------------------------------------------------------------------------

void SRRLoadBalancer::initialize()
{
    RRLoadBalancer::initialize();

    // Create a set of deficit counters to associate with the paths
    quantum_ = par("quantum");
    for (uint i = 0; i < numPaths_; i++) { deficitCounter_.push_back(0); }
    newRound();

    LOG(DEBUG) << typeid(this).name() << endl;
}

void SRRLoadBalancer::newRound()
{
    LOG(DEBUG) << typeid(this).name() << endl;
    // Give all paths a new quantum
    for (uint i = 0; i < numPaths_; i++) { deficitCounter_[i] += quantum_; }
    if (usePermutations) { pathPermutation(); }
    currentIndex_ = 0;
    LOG(DEBUG) << pathsString();
}

std::string SRRLoadBalancer::pathString(uint index)
{
    std::ostringstream oss;
    oss << index << ": path " << pathList_[index] << " credits " << deficitCounter_[pathList_[index]] << "\n";
    return oss.str();
}

uint SRRLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    // Cycle through the paths
    while (deficitCounter_[pathList_[currentIndex_]] <= 0) {
        currentIndex_++; // move to next path in list
        if (currentIndex_ >= numPaths_) { newRound(); }
    }
    uint path = pathList_[currentIndex_];

    LOG(DEBUG) << "Using path " << path << " deficitCounter = " << deficitCounter_[path] << endl;

    // Perform accounting for this packet on the current path
    deficitCounter_[path] -= pkt->getByteLength();
    LOG(DEBUG) << "Accounting for current packet, deficitCounter = " << deficitCounter_[path] << endl;

    return path;
}


SRRLoadBalancer::~SRRLoadBalancer()
{
    // Shouldn't have to do anything but let's go ahead and clear the vectors
    deficitCounter_.clear();
}

Define_Module(SRRLoadBalancer);

// ------------------------------------------------------------------------------
// RehashLoadBalancer
// ------------------------------------------------------------------------------

void RehashLoadBalancer::initialize()
{
    SRRLoadBalancer::initialize();
    LOG(DEBUG) << typeid(this).name() << endl;
}

uint RehashLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    // If current path has no credits,
    while (deficitCounter_[pathList_[currentIndex_]] <= 0) {
        // choose a new path at random
        currentIndex_ = intrand(numPaths_);
        LOG(DEBUG) << "Randomly checking path " << pathList_[currentIndex_] << endl;
        // If this new path has credits, use it4
        if (deficitCounter_[pathList_[currentIndex_]] > 0) break;
        // Otherwise, give it a quantum and select a new path.
        deficitCounter_[pathList_[currentIndex_]] += quantum_;
        currentIndex_ = intrand(numPaths_);
        LOG(DEBUG) << "Not enough credits, checking path " << pathList_[currentIndex_] << endl;
    }
    LOG(DEBUG) << "Selected path " << pathList_[currentIndex_] << endl;

    // Perform accounting for this packet on the current path
    deficitCounter_[pathList_[currentIndex_]] -= pkt->getByteLength();

    return pathList_[currentIndex_];
}

Define_Module(RehashLoadBalancer);

// ------------------------------------------------------------------------------
// SDLoadBalancer
// ------------------------------------------------------------------------------

void SDLoadBalancer::initialize()
{
    SRRLoadBalancer::initialize();
    LOG(DEBUG) << typeid(this).name() << endl;
    usePermutations = par("usePermutations");
    // Perform an initial permutation to desynchronize servers
    pathPermutation();
}

uint SDLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    // Path with the maximum credits is chosen
    currentIndex_ = 0; // Always start searching from the beginning
    uint currentPath = pathList_[currentIndex_];
    int maxCredits = deficitCounter_[currentPath];
    do {
        // Find the path with the maximum number of credits
        for (uint i = 0; i < numPaths_; i++) {
            if (deficitCounter_[pathList_[i]] > maxCredits) {
                currentIndex_ = i;
                currentPath = pathList_[currentIndex_];
                maxCredits = deficitCounter_[currentPath];
            }
        }
        // If the max. number of credits is <= 0, call newRound() to add more credits and try again
        // Note: The last path in the list to have the max. number of credits wins.
        // Thus ties are not really broken arbitrarily but performing a permutation does ensure the
        // order paths changes. Therefore, the quantum should not be set too large if we want paths to
        // preserve the random breaking of ties.
        if (maxCredits <= 0) { newRound(); }
    } while (maxCredits <= 0);

    // Perform accounting for this packet on the current path
    deficitCounter_[currentPath] -= pkt->getByteLength();
    return currentPath;
}

Define_Module(SDLoadBalancer);

// ------------------------------------------------------------------------------
// DSDLoadBalancer
// ------------------------------------------------------------------------------


DSDLoadBalancer::DestPathState::DestPathState(uint numPaths, uint quantum, bool usePermutations) : numPaths_(numPaths), quantum_(quantum), usePermutations(usePermutations)
{
    // Create a list of all the paths (Used by subclasses)
    for (uint i = 0; i < numPaths_; i++) { pathList_.push_back(i); }
    for (uint i = 0; i < numPaths_; i++) { deficitCounter_.push_back(0); }
    if (usePermutations) { pathPermutation(); }
}

void DSDLoadBalancer::DestPathState::pathPermutation()
{
    for (uint i = 0; i < pathList_.size(); i++) { std::swap(pathList_[i],pathList_[intrand(numPaths_)]); }
}

void DSDLoadBalancer::DestPathState::newRound()
{
    for (uint i = 0; i < numPaths_; i++) { deficitCounter_[i] += quantum_; }
    if (usePermutations) { pathPermutation(); }
}

uint DSDLoadBalancer::DestPathState::choosePath(DCN_EthPacket *pkt)
{
    uint currentIndex = 0; uint currentPath = pathList_[currentIndex];
    int maxCredits = deficitCounter_[currentPath];
    do {
        for (uint i = 0; i < numPaths_; i++) {
            if (deficitCounter_[pathList_[i]] > maxCredits) {
                currentIndex = i;
                currentPath = pathList_[currentIndex];
                maxCredits = deficitCounter_[currentPath];
            }
        }
        if (maxCredits <= 0) { newRound(); }
    } while (maxCredits <= 0);
    deficitCounter_[currentPath] -= pkt->getByteLength();
    return currentPath;
}


std::string DSDLoadBalancer::DestPathState::pathsString()
{
    // In case the index is about to be wrapped around
    std::ostringstream oss; oss << "List of paths:\n";
    for (uint i = 0; i < pathList_.size(); i++) {
        oss << "                "; oss << pathString(i);
    }
    return oss.str();
}

std::string DSDLoadBalancer::DestPathState::pathString(uint index)
{
    std::ostringstream oss;
    oss << index << ": path " << pathList_[index] << " credits " << deficitCounter_[pathList_[index]] << "\n";
    return oss.str();
}

uint DSDLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    uint destination = pkt->getDestAddr();
    LOG(DEBUG) << "Sending packet to " << destination << ". Looking up path state for destination." endl;
    DPSMap::iterator it = destPathState.find(destination);
    if (it == destPathState.end()) { destPathState[destination] = new DestPathState(numPaths_, quantum_, usePermutations); }
    LOG(DEBUG) << "Path state before: " << destPathState[destination]->pathsString() << endl;
    uint path = destPathState[destination]->choosePath(pkt);
    LOG(DEBUG) << "Path state after: " << destPathState[destination]->pathsString() << endl;
    LOG(DEBUG) << "Path state for " << destination << " return path " << path << endl;
    return path;
}

DSDLoadBalancer::~DSDLoadBalancer()
{
    destPathState.clear();
    //while(!destPathState.empty()) {
    //    destPathState.cleear();
    //    DestPathState *
    //}
}

Define_Module(DSDLoadBalancer);

uint TPLoadBalancer::choosePath(DCN_EthPacket *pkt)
{
    uint destination = pkt->getDestAddr();

    // Look up the per-destination path state, allocate a new instance if not found
    LOG(DEBUG) << "Sending packet to " << destination << ". Looking up path state for destination." endl;
    DPSMap::iterator it = destPathState.find(destination);
    if (it == destPathState.end()) { destPathState[destination] = new DestPathState(numPaths_, quantum_, usePermutations); }

    // We have a main set of deficit counters and a separate set of deficit counters per-destination
    // Add their credits together, always choose the path with the most credits
    currentIndex_ = 0; // Always start searching from the beginning
    uint currentPath = pathList_[currentIndex_];
    int maxCreditsMain = deficitCounter_[currentPath];
    int maxCreditsDest = destPathState[destination]->deficitCounter_[currentPath];
    int maxCredits = maxCreditsMain + maxCreditsDest;

    //  Loop through each path
    do {
        for (uint i = 0; i < numPaths_; i++) {
            uint path = pathList_[i];
            int pathCreditsMain = deficitCounter_[path];
            int pathCreditsDest = destPathState[destination]->deficitCounter_[path];
            int pathCredits = pathCreditsMain + pathCreditsDest;
            LOG(DEBUG) << "Path " << path << " main credits = " << pathCreditsMain << ", per-dest credits = " << pathCreditsDest << ", overall credits = " << pathCredits << endl;
            if (pathCreditsMain > maxCreditsMain) { maxCreditsMain = pathCreditsMain; }
            if (pathCreditsDest > maxCreditsDest) { maxCreditsDest = pathCreditsDest; }
            if (pathCredits > maxCredits) {
                maxCredits = pathCredits;
                currentIndex_ = i;
                currentPath = path;
            }
        }
        // Add new credits if needed
        if (maxCreditsMain <= 0) { newRound(); }
        if (maxCreditsDest <= 0) { destPathState[destination]->newRound(); }
    } while (maxCreditsMain <= 0 || maxCreditsDest <= 0);

    // Accounting for first half
    deficitCounter_[currentPath] -= pkt->getByteLength();

    // Accounting for second half
    destPathState[destination]->deficitCounter_[currentPath] -= pkt->getByteLength();

    return currentPath;
}

Define_Module(TPLoadBalancer);
