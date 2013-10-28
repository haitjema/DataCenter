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
#include "TP_AllToAllVictimTenant.h"


AppMessageVector TP_AllToAllVictimTenant::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize = messageSize;
    AppMessageVector messages;
    // Assign messages for victim tenant
    PartitionVector partitions = partitionServers(partitionSize);
    uint_vec_t *partition = partitions.back(); partitions.pop_back();
    for (uint s = 0; s < partition->size(); s++) {
        uint server_address = (*partition)[s];
        addMessagesForMaliciousServer(server_address, *partition, messages);
    } delete partition;
    while (!partitions.empty()) {
        uint_vec_t *partition = partitions.back();
        partitions.pop_back();
        for (uint s = 0; s < partition->size(); s++) {
            uint server_address = (*partition)[s];
            addMessagesForServer(server_address, *partition, messages);
        }
        delete partition;
    }
    return messages;
}

void TP_AllToAllVictimTenant::addMessagesForMaliciousServer(uint server_address, uint_vec_t &partition, AppMessageVector &messages)
{
    // Create all-to-one traffic pattern within malicious tenant
    uint dest = partition[0]; // All send to target server = partition[0]
    if (dest == server_address) { dest = partition[1]; } // Except the target which sends to server 1
    if (dest == server_address) opp_error("whoops: dest == server_address");
    AppMessage *msg = new AppMessage();
    msg->source = server_address;
    msg->destination = dest;
    msg->messageNum = 1; // XXX Quick hack... if 1, code will set maxSendRate = link rate so that malicious tenant always sends at max rate
    msg->startTime = 0;
    //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
    msg->messageSize = messageSize_;
    msg->messageRate = 0; // Unlimited
    messages.push_back(msg);
}

