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
#include "TP_LBDestImbalance.h"


AppMessageVector TP_LBDestImbalance::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize = messageSize;
    AppMessageVector messages;
    for (uint i = 0; i < node_id_.getNumberOfServers(); i++) {
        uint server_address = i;
        addMessagesForServer(server_address, messages);
    }
    return messages;
}


void TP_LBDestImbalance::addMessagesForServer(uint server_address, AppMessageVector &messages)
{
    // With k ports, there are p = (k/2)^2 paths
    // If we send p flows, then each flow could use only one path
    uint num_paths = node_id_.getNumberOfPaths();
    uint num_flows = num_paths;
    uint k = node_id_.getDownRadix(0);
    uint num_pods = k;
    uint spp = node_id_.getNumberOfServers()/num_pods;
    uint flows_per_pod = num_flows/num_pods;

    uint my_address = server_address;
    uint tor_dls = k/2;
    uint num_tors = node_id_.getNumberOfServers()/tor_dls;
    uint my_tor = my_address/tor_dls;
    uint tors_per_pod = num_tors/num_pods;
    uint my_pod = my_tor/tors_per_pod;
    uint my_pod_base_tor = my_pod*tors_per_pod;
    uint my_tor_idx_in_pod = my_tor - my_pod_base_tor;
    uint base_idx_at_tor = my_tor * tor_dls;
    uint my_idx_at_tor = my_address - base_idx_at_tor;

    std::vector<uint> neighbor_tors;
    uint neighbor_idx_in_pod = my_tor_idx_in_pod + 1;
    if (neighbor_idx_in_pod >= tors_per_pod) { neighbor_idx_in_pod = 0; }
    neighbor_tors.push_back(neighbor_idx_in_pod);
    for (uint i = 1; i < flows_per_pod; i++) {
        neighbor_tors.push_back(neighbor_tors[i-1] + 1);
        if (neighbor_tors[i] >= tors_per_pod) { neighbor_tors[i] = 0; }
    }

    std::vector<uint> dest_address;
    for (uint p = 0; p < num_pods; p++) {
        for (uint i = 0; i < neighbor_tors.size(); i++) {
            uint pod_offset = p*spp;
            uint dest_tor = neighbor_tors[i];
            uint dest_tor_offset = pod_offset + dest_tor*tor_dls;
            uint dest_addr = dest_tor_offset + my_idx_at_tor;
            dest_address.push_back(dest_addr);
        }
    }

    for (uint i = 0; i < dest_address.size(); i++) {
        AppMessage *msg = new AppMessage();
        msg->source = my_address;
        msg->destination = dest_address[i];
        msg->messageNum = 0;
        msg->startTime = 0;
        //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageSize = messageSize_;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
}
