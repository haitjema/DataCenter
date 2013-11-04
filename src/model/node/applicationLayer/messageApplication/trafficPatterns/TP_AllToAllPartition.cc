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
#include "TP_AllToAllPartition.h"


AppMessageVector TP_AllToAllPartition::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize_ = messageSize;
    AppMessageVector messages;
    if (partitionSize == 0) {
        partitionSize = node_id_.getNumberOfServers()/node_id_.getDownRadix(0);
    }
    PartitionVector partitions = partitionServers(partitionSize);
    while (!partitions.empty()) {
        uint_vec_t *partition = partitions.back(); partitions.pop_back();
        for (uint s = 0; s < partition->size(); s++) {
            uint server_address = (*partition)[s];
            addMessagesForServer(server_address, *partition, messages);
        }
        delete partition;
    }
    return messages;
}

TP_AllToAllPartition::PartitionVector TP_AllToAllPartition::partitionServers(uint partitionSize)
{
    // Randomly break the list of servers into a set of partitions of the specified size
    PartitionVector partitions;
    uint numServers = node_id_.getNumberOfServers();
    uint_vec_t serverList;
    serverList.resize(numServers);

    // Create a vector that stores the list of servers
    for (uint i = 0; i < numServers; i++) serverList[i] = i;
    // Perform a random permutation on this list
    for (uint i = 0; i < serverList.size(); i++) {
        // Swap each element with a random element
        std::swap(serverList[i],serverList[intrand(numServers)]);
    }

    uint numPartitions = node_id_.getNumberOfServers()/partitionSize;
    for (uint p = 0; p < numPartitions; p++) {
        uint_vec_t *partition = new uint_vec_t;
        for (uint i = 0; i < partitionSize; i++) {
            uint server = serverList.back(); serverList.pop_back();
            partition->push_back(server);
      }
      partitions.push_back(partition);
    }

    if (serverList.size() > 0) {
        /*
        LOG(WARN) << "Cannot partition the servers into " << numPartitions
                  << " even size groups. There is an additional group with "
                  << serverList.size() << " servers." << endl;
        */
        uint_vec_t *partition = new uint_vec_t;
        while (!serverList.empty()) {
            uint server = serverList.back(); serverList.pop_back();
            partition->push_back(server);
        }
        partitions.push_back(partition);
    }
    return partitions;
}


void TP_AllToAllPartition::addMessagesForServer(uint server_address, uint_vec_t &partition, AppMessageVector &messages)
{
    for (uint i = 0; i < partition.size(); i++) {
        uint dest = partition[i];
        if (dest == server_address) continue;
        AppMessage *msg = new AppMessage();
        msg->source = server_address;
        msg->destination = dest;
        msg->messageNum = 0;
        msg->startTime = 0;
        //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageSize = messageSize_;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
}
