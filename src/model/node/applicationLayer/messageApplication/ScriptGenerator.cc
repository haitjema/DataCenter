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
#include <fstream>
#include <time.h>

// Have to import all this crap because I'm including MessageApplication.h
#include <queue>
#include "DCCommon.h"
#include "node_id.h"
#include "FatTreeNode.h"
#include "ServerStream.h"

#include "ScriptGenerator.h"

ScriptGenerator::ScriptGenerator(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : node_id_(node_id), randomStartTimes(randomStartTimes), messageSize_(messageSize)
{
}

/*
void ScriptGenerator::createPermutation(uint_vec_t &serverAssignments)
{
    // Assign each server a random unique destination (i.e. no two servers send to the same destination)
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


    // Create  new vector "serverAssignments" so that serverAssignments[i] corresponds to server i's assigned destination
    serverAssignments.resize(numServers);
    for (uint i = 0; i < numServers; i++) {
        // Swap if server picks itself
        if (serverList.back() == i) std::swap(serverList.back(), serverList.front());
        serverAssignments[i] = serverList.back();
        serverList.pop_back();
    }
}


void ScriptGenerator::reassignServersInSameSubtree(uint_vec_t &serverAssignments)
{
    // Reassign any servers that are paired in the same SubTree
    // Note: This way is quick and dirty way and not particularly efficient

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

void ScriptGenerator::createPermutationPair(uint_vec_t &serverAssignments)
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

void ScriptGenerator::reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments)
{
    // Reassign any servers that are paired in the same SubTree
    // Note: This way is quick and dirty way and not particularly efficient

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

void ScriptGenerator::random_permutation(const char *scriptFile)
{
    uint_vec_t serverAssignments;
    createPermutation(serverAssignments);
    reassignServersInSameSubtree(serverAssignments);

    AppMessageVector messages;
    for (uint i = 0; i < serverAssignments.size(); i++) {
        AppMessage *msg = new AppMessage();
        msg->source = i;
        msg->destination = serverAssignments[i];
        msg->messageNum = 0;
        msg->startTime = 0;
        msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void ScriptGenerator::random_permutation_pair(const char *scriptFile)
{
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
        msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}
*/

void ScriptGenerator::assign_random_start_times(AppMessageVector &messages, double max_time)
{
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        simtime_t rndTime(dblrand()*max_time);
        (*i)->startTime = rndTime;
    }
}

void ScriptGenerator::writeScript(const char *scriptFile, const AppMessageVector &messages)
{
    std::ofstream myfile;
    myfile.open(scriptFile);
    myfile << "# Script: " << scriptFile << endl;
    time_t rawtime; struct tm * timeinfo;
    time ( &rawtime ); timeinfo = localtime ( &rawtime );
    myfile << "# Generated at time: " << asctime(timeinfo); // For some reason asctime adds a new line so no endl needed
    myfile << "# Number of servers = " << node_id_.getNumberOfServers() << ", levels = "
           << node_id_.getDepth() << ", paths = " << node_id_.getNumberOfPaths() << endl;
    myfile << "# Message format is as follows:" << endl;
    myfile << "# <source>;<destination>;<messageNum>;<startTime>;<messageSize>;<messageRate>" << endl;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        myfile << (*i)->source << "; " << (*i)->destination << "; " << (*i)->messageNum << "; "
               << (*i)->startTime << " s; " << (*i)->messageSize << " bytes; " << (*i)->messageRate << " bps" << endl;
    }
    myfile.close();
}


ScriptGenerator::~ScriptGenerator()
{
}

SG_PermutationTraffic::SG_PermutationTraffic(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : ScriptGenerator(node_id, randomStartTimes, messageSize)
{
}


void SG_PermutationTraffic::random_permutation(const char *scriptFile)
{
    uint_vec_t serverAssignments;
    createPermutation(serverAssignments);
    reassignServersInSameSubtree(serverAssignments);

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
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); }// Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}


void SG_PermutationTraffic::createPermutation(uint_vec_t &serverAssignments)
{
    // Assign each server a random unique destination (i.e. no two servers send to the same destination)
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


    // Create  new vector "serverAssignments" so that serverAssignments[i] corresponds to server i's assigned destination
    serverAssignments.resize(numServers);
    for (uint i = 0; i < numServers; i++) {
        // Swap if server picks itself
        if (serverList.back() == i) std::swap(serverList.back(), serverList.front());
        serverAssignments[i] = serverList.back();
        serverList.pop_back();
    }
}

void SG_PermutationTraffic::reassignServersInSameSubtree(uint_vec_t &serverAssignments)
{
    // Reassign any servers that are paired in the same SubTree
    // Note: This way is quick and dirty way and not particularly efficient

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

SG_PermutationTraffic::~SG_PermutationTraffic()
{
}


SG_PairedPermutationTraffic::SG_PairedPermutationTraffic(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : SG_PermutationTraffic(node_id, randomStartTimes, messageSize)
{
}

void SG_PairedPermutationTraffic::writeScript(const char *scriptFile, const AppMessageVector &messages)
{
    std::ofstream myfile;
    myfile.open(scriptFile);
    myfile << "# Script: " << scriptFile << endl;
    time_t rawtime; struct tm * timeinfo;
    time ( &rawtime ); timeinfo = localtime ( &rawtime );
    myfile << "# Generated by SG_PairedPermutationTraffic at time: " << asctime(timeinfo); // For some reason asctime adds a new line so no endl needed
    myfile << "# Number of servers = " << node_id_.getNumberOfServers() << ", levels = "
           << node_id_.getDepth() << ", paths = " << node_id_.getNumberOfPaths() << endl;
    myfile << "# Message format is as follows:" << endl;
    myfile << "# <source>;<destination>;<messageNum>;<startTime>;<messageSize>;<messageRate>" << endl;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        myfile << (*i)->source << "; " << (*i)->destination << "; " << (*i)->messageNum << "; "
               << (*i)->startTime << " s; " << (*i)->messageSize << " bytes; " << (*i)->messageRate << " bps" << endl;
    }
    myfile.close();
}

void SG_PairedPermutationTraffic::createPermutationPair(uint_vec_t &serverAssignments)
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

void SG_PairedPermutationTraffic::reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments)
{
    // Reassign any servers that are paired in the same SubTree
    // Note: This way is quick and dirty way and not particularly efficient

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

void SG_PairedPermutationTraffic::random_permutation_pair(const char *scriptFile)
{
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
        msg->messageSize = messageSize_;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); }// Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

SG_PairedPermutationTraffic::~SG_PairedPermutationTraffic()
{
}


SG_PairedPodTraffic::SG_PairedPodTraffic(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : ScriptGenerator(node_id, randomStartTimes, messageSize)
{
}

void SG_PairedPodTraffic::random_pod_permutation(const char *scriptFile)
{
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
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); }// Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void SG_PairedPodTraffic::createPodPermutation(uint_vec_t &serverAssignments)
{
    // Assign each server a random unique destination (i.e. no two servers send to the same destination)
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
    // Incredibly quick, dirty, and stupid way to make sure no pod is matched with itself
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

void SG_PairedPodTraffic::writeScript(const char *scriptFile, const AppMessageVector &messages)
{
    std::ofstream myfile;
    myfile.open(scriptFile);
    myfile << "# Script: " << scriptFile << endl;
    time_t rawtime; struct tm * timeinfo;
    time ( &rawtime ); timeinfo = localtime ( &rawtime );
    myfile << "# Generated by SG_PairedPodTraffic at time: " << asctime(timeinfo); // For some reason asctime adds a new line so no endl needed
    myfile << "# Number of servers = " << node_id_.getNumberOfServers() << ", levels = "
           << node_id_.getDepth() << ", paths = " << node_id_.getNumberOfPaths() << endl;
    myfile << "# Message format is as follows:" << endl;
    myfile << "# <source>;<destination>;<messageNum>;<startTime>;<messageSize>;<messageRate>" << endl;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        myfile << (*i)->source << "; " << (*i)->destination << "; " << (*i)->messageNum << "; "
               << (*i)->startTime << " s; " << (*i)->messageSize << " bytes; " << (*i)->messageRate << " bps" << endl;
    }
    myfile.close();
}

SG_PairedPodTraffic::~SG_PairedPodTraffic()
{
}

SG_LBDestImbalance::SG_LBDestImbalance(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : ScriptGenerator(node_id, randomStartTimes, messageSize)
{
}


void SG_LBDestImbalance::generateMessages(const char *scriptFile)
{
    AppMessageVector messages;
    for (uint i = 0; i < node_id_.getNumberOfServers(); i++) {
        uint server_address = i;
        add_messages_for_server(server_address, messages);
    }
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); } // Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void SG_LBDestImbalance::add_messages_for_server(uint server_address, AppMessageVector &messages)
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



void SG_LBDestImbalance::add_messages_for_server_to_one_neighbor_ToR(uint server_address, AppMessageVector &messages)
{
    // XXX This original version was incorrect, so I relabled it
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
    uint neighbor_idx_in_pod = my_tor_idx_in_pod + 1;
    if (neighbor_idx_in_pod >= tors_per_pod) { neighbor_idx_in_pod = 0; }
    uint base_idx_at_tor = my_tor * tor_dls;
    uint my_idx_at_tor = my_address - base_idx_at_tor;

    std::vector<uint> dest_idx_at_tor;
    dest_idx_at_tor.push_back(my_idx_at_tor);
    for (uint i = 1; i < flows_per_pod; i++) {
        dest_idx_at_tor.push_back(dest_idx_at_tor[i-1] + 1);
        // Wrap around
        if (dest_idx_at_tor[i] >= tor_dls) { dest_idx_at_tor[i] = 0; }
    }

    std::vector<uint> dest_address;
    for (uint p = 0; p < num_pods; p++) {
        for (uint i = 0; i < dest_idx_at_tor.size(); i++) {
            uint pod_offset = p*spp;
            uint dest_tor_offset = pod_offset + neighbor_idx_in_pod*tor_dls;
            uint dest_addr = dest_tor_offset + dest_idx_at_tor[i];
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


SG_AllToAll::SG_AllToAll(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : SG_LBDestImbalance(node_id, randomStartTimes, messageSize)
{
}

void SG_AllToAll::generateMessages(const char *scriptFile)
{
    AppMessageVector messages;
    for (uint i = 0; i < node_id_.getNumberOfServers(); i++) {
        uint server_address = i;
        add_messages_for_server(server_address, messages);
    }
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); } // Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void SG_AllToAll::add_messages_for_server(uint server_address, AppMessageVector &messages)
{
    for (uint i = 0; i < node_id_.getNumberOfServers(); i++) {
        if (i == server_address) continue;
        AppMessage *msg = new AppMessage();
        msg->source = server_address;
        msg->destination = i;
        msg->messageNum = 0;
        msg->startTime = 0;
        //msg->messageSize = (double)10*1024*1024*1024*8; // 10 GiB (large enough for 1 second at 1 Gbps), XXX Find a better way to do this
        msg->messageSize = messageSize_;
        msg->messageRate = 0; // Unlimited
        messages.push_back(msg);
    }
}


SG_AllToAllPartition::SG_AllToAllPartition(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : SG_AllToAll(node_id, randomStartTimes, messageSize)
{
}

void SG_AllToAllPartition::partitionServers(uint partitionSize)
{
    // Randomly break the list of servers into a set of partitions of the specified size
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
      partitions_.push_back(partition);
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
        partitions_.push_back(partition);
    }
}

void SG_AllToAllPartition::generateMessages(const char *scriptFile)
{
    AppMessageVector messages;
    while (!partitions_.empty()) {
        uint_vec_t *partition = partitions_.back();
        partitions_.pop_back();
        for (uint s = 0; s < partition->size(); s++) {
            uint server_address = (*partition)[s];
            add_messages_for_server(server_address, *partition, messages);
        }
        delete partition;
    }
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); } // Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void SG_AllToAllPartition::add_messages_for_server(uint server_address, uint_vec_t &partition, AppMessageVector &messages)
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

SG_AllToAllPartition::~SG_AllToAllPartition()
{
    while(!partitions_.empty()) {
        uint_vec_t *partition = partitions_.back();
        partitions_.pop_back(); delete partition;
    }
}




SG_AllToAllVictimTenant::SG_AllToAllVictimTenant(const SubTreeID &node_id, bool randomStartTimes, double messageSize) : SG_AllToAllPartition(node_id, randomStartTimes, messageSize)
{
}

void SG_AllToAllVictimTenant::generateMessages(const char *scriptFile)
{
    AppMessageVector messages;
    // Assign messages for victim tenant
    uint_vec_t *partition = partitions_.back(); partitions_.pop_back();
    for (uint s = 0; s < partition->size(); s++) {
        uint server_address = (*partition)[s];
        add_messages_for_malicious_server(server_address, *partition, messages);
    } delete partition;
    while (!partitions_.empty()) {
        uint_vec_t *partition = partitions_.back();
        partitions_.pop_back();
        for (uint s = 0; s < partition->size(); s++) {
            uint server_address = (*partition)[s];
            add_messages_for_server(server_address, *partition, messages);
        }
        delete partition;
    }
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assign_random_start_times(messages); } // Use the default maximum time
    writeScript(scriptFile, messages);
    while (!messages.empty()) { delete messages.back(); messages.pop_back(); }
}

void SG_AllToAllVictimTenant::add_messages_for_malicious_server(uint server_address, uint_vec_t &partition, AppMessageVector &messages)
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

