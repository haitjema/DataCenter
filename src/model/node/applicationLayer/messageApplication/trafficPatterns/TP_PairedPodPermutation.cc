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
#include "TP_PairedPodPermutation.h"


AppMessageVector TP_PairedPodPermutation::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize = messageSize;
    uint_vec_t serverAssignments;
    createPodPermutation(serverAssignments);
    AppMessageVector messages;
    for (uint i = 0; i < serverAssignments.size(); i++) {
        AppMessage *msg = new AppMessage();
        msg->source = i;
        msg->destination = serverAssignments[i];
        msg->messageNum = 0;
        msg->startTime = 0;
        //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageSize = messageSize_;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
    return messages;
}


void TP_PairedPodPermutation::createPodPermutation(uint_vec_t &serverAssignments)
{
    // Assign each server a random unique destination.
    // That is, no two servers send to the same destination.
    uint numPods = node_id_.getDownRadix(0);
    uint numServers = node_id_.getNumberOfServers();
    uint numServersInPod = numServers/numPods;
    uint_vec_t podList; podList.resize(numPods);
    serverAssignments.resize(numServers);

    // Create a vector that stores the list of pods
    for (uint i = 0; i < numPods; i++) podList[i] = i;
    // Perform a random permutation on this list
    for (uint i = 0; i < podList.size(); i++) {
        // Swap each element with a random element
        std::swap(podList[i],podList[intrand(numPods)]);
    }
    // Really quick, dirty, and stupid way to make sure no pod is matched with itself
    bool pairedWithSelf = true;
    do {
        for (uint i = 0; i < podList.size(); i++) {
            if (i == podList[i]) {
                std::swap(podList[i],podList[intrand(numPods)]);
                pairedWithSelf = true; break;
            }
            pairedWithSelf = false;
        }
    } while (pairedWithSelf);

    // Assign servers in pod i to the same servers in podList[i].
    for (uint i = 0; i < podList.size(); i++) {
        uint j = podList[i];
        uint i_offset = i*numServersInPod;
        uint j_offset = j*numServersInPod;
        for (uint s = 0; s < numServersInPod; s++) {
            serverAssignments[i_offset+s] = j_offset + s;
        }
    }
}
