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
#include "TP_PairedPermutation.h"

AppMessageVector TP_PairedPermutation::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize_ = messageSize;
    uint_vec_t serverAssignments;
    createPermutationPair(serverAssignments);
    reassignServersPairedInSameSubtree(serverAssignments);

    AppMessageVector messages;
    for (uint i = 0; i < serverAssignments.size(); i++) {
        AppMessage *msg = new AppMessage();
        msg->source = i;
        msg->destination = serverAssignments[i];
        msg->messageNum = 0;
        msg->startTime = 0;
        //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageSize = messageSize;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
    return messages;
}


void TP_PairedPermutation::createPermutationPair(uint_vec_t &serverAssignments)
{
    // Randomly break the servers into a pairs so that server A sends to server B and server B sends to server A
    uint numServers =node_id_.getNumberOfServers();
    if (numServers % 2 != 0) {
    //    opp_error("ServerPairPermutationTrafficSource can only be used with an even number of servers!");
    }
    uint_vec_t serverList;
    serverList.resize(numServers);

    // Start by making a list of the servers and creating a random permutation on that list
    for (uint i = 0; i < numServers; i++) serverList[i] = i;
    for (uint i = 0; i < serverList.size(); i++) {
        // Swap each element with a random element
        std::swap(serverList[i],serverList[intrand(numServers)]);
    }

    // Break the servers into pairs
    // Match the first half of the list with the second half
    serverAssignments.resize(numServers);
    for (uint i = 0; i < numServers/2; i++) {
            uint buddy = serverList[numServers-1-i];
            serverAssignments[serverList[i]] = buddy;
            serverAssignments[buddy] = serverList[i];
    }

    serverList.clear();
}


void TP_PairedPermutation::reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments)
{
    // Reassign any servers that are paired in the same SubTree
    // Note: This way is quick and dirty and not particularly efficient
    if (!(node_id_.getDownRadix(0) > 1)) {
        //LOG(WARN) << "There is only one SubTree, pick destinations for servers in other trees." << endl;
        return;
    }

    for (uint i = 0; i < serverAssignments.size(); i++) {
        uint A, B;
        A = i;  // Server A (the current server) ...
        B = serverAssignments[A];   // sends to server B

        // Check if server A & B are in the same SubTree
        if (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, B)) {
            // Have server A swap with some other server X
            uint X, Y;
            do {
                // Pick a random server X that sends to some server Y
                X = intrand(serverAssignments.size());
                Y = serverAssignments[X];
                // Make sure neither X nor Y is in the same SubTree as A (which is in the same SubTree as B)
            } while (node_id_.getLevelID(0, A) == node_id_.getLevelID(0, Y) ||
                    node_id_.getLevelID(0, B) == node_id_.getLevelID(0, X));
            // Have A and X swap
            serverAssignments[A] = Y;
            serverAssignments[Y] = A;
            serverAssignments[X] = B;
            serverAssignments[B] = X;
        }
    }
}

