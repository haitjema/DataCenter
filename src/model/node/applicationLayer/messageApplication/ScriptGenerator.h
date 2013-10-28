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

#ifndef SCRIPTGENERATOR_H_
#define SCRIPTGENERATOR_H_

#include "MessageApplication.h"

#define DEF_MAX_START (10.0/(1000*1000)) // 10 microseconds

// class ScriptGenerator2 : public cSimpleModule {
// public:
//     //ScriptGenerator2(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
//     //virtual ~ScriptGenerator2();
//     virtual void writeScript(const char *scriptFile, const AppMessageVector &messages);
// protected:
//     virtual void assignRandomStartTimes(AppMessageVector &messages, double max_time=DEF_MAX_START);
// };

class ScriptGenerator {
public:
    ScriptGenerator(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~ScriptGenerator();
    //virtual void random_permutation(const char *scriptFile);
    //virtual void random_permutation_pair(const char *scriptFile);
    virtual void assign_random_start_times(AppMessageVector &messages, double max_time=DEF_MAX_START);

protected:
    virtual void writeScript(const char *scriptFile, const AppMessageVector &messages);
    //virtual void createPermutation(uint_vec_t &serverAssignments);
    //virtual void reassignServersInSameSubtree(uint_vec_t &serverAssignments);
    //virtual void reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments);
    //virtual void createPermutationPair(uint_vec_t &serverAssignments);
    SubTreeID node_id_;
    bool randomStartTimes;
    double messageSize_;
};

class SG_PermutationTraffic : public ScriptGenerator {
public:
    SG_PermutationTraffic(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~SG_PermutationTraffic();
    virtual void random_permutation(const char *scriptFile);

protected:
    virtual void createPermutation(uint_vec_t &serverAssignments);
    virtual void reassignServersInSameSubtree(uint_vec_t &serverAssignments);
};

class SG_PairedPermutationTraffic : public SG_PermutationTraffic {
public:
    SG_PairedPermutationTraffic(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~SG_PairedPermutationTraffic();
    virtual void random_permutation_pair(const char *scriptFile);

protected:
    virtual void writeScript(const char *scriptFile, const AppMessageVector &messages);
    virtual void createPermutationPair(uint_vec_t &serverAssignments);
    virtual void reassignServersPairedInSameSubtree(uint_vec_t &serverAssignments);
};

class SG_PairedPodTraffic : public ScriptGenerator {
public:
    SG_PairedPodTraffic(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~SG_PairedPodTraffic();
    virtual void random_pod_permutation(const char *scriptFile);

    virtual void createPodPermutation(uint_vec_t &serverAssignments);
protected:

    virtual void writeScript(const char *scriptFile, const AppMessageVector &messages);
};

class SG_LBDestImbalance : public ScriptGenerator {
public:
    SG_LBDestImbalance(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual void generateMessages(const char *scriptFile);
    void add_messages_for_server(uint server_address, AppMessageVector &messages);
protected:
    void add_messages_for_server_to_one_neighbor_ToR(uint server_address, AppMessageVector &messages); // XXX Defunct
};

class SG_AllToAll : public SG_LBDestImbalance {
public:
    SG_AllToAll(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual void generateMessages(const char *scriptFile);
    void add_messages_for_server(uint server_address, AppMessageVector &messages);
};

class SG_AllToAllPartition : public SG_AllToAll {
public:
    SG_AllToAllPartition(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~SG_AllToAllPartition();
    virtual void partitionServers(uint partitionSize);
    virtual void generateMessages(const char *scriptFile);
    virtual void add_messages_for_server(uint server_address, uint_vec_t &partition, AppMessageVector &messages);
protected:
    typedef std::vector<uint_vec_t *> PartitionVector;
    PartitionVector partitions_;
};

class SG_AllToAllVictimTenant : public SG_AllToAllPartition {
public:
    SG_AllToAllVictimTenant(const SubTreeID &node_id, bool randomStartTimes=true, double messageSize=0);
    virtual ~SG_AllToAllVictimTenant() {}
    virtual void generateMessages(const char *scriptFile);
    virtual void add_messages_for_malicious_server(uint server_address, uint_vec_t &partition, AppMessageVector &messages);
};


#endif /* SCRIPTGENERATOR_H_ */
