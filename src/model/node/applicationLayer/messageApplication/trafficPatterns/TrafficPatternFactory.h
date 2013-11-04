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

#ifndef TRAFFIC_PATTERN_FACTORY_H_
#define TRAFFIC_PATTERN_FACTORY_H_

#include "TrafficPattern.h"
#include "TP_Permutation.h"
#include "TP_PairedPermutation.h"
#include "TP_PairedPodPermutation.h"
#include "TP_LBDestImbalance.h"
#include "TP_AllToAll.h"
#include "TP_AllToAllPartition.h"
#include "TP_AllToAllVictimTenant.h"


class TrafficPatternFactory {
public:
    TrafficPattern* createTrafficPattern(std::string type)
    {
        TrafficPattern* pattern = NULL;
        if (!type.compare("PermutationTraffic")) {
            opp_error("PermutationTraffic seems to have stopped working somehow! Not a true permutation."); // XXX
            pattern = new TP_Permutation();
        } else if (!type.compare( "PairedPermutationTraffic")) {
            pattern = new TP_PairedPermutation();
        } else if (!type.compare("PairedPodTraffic")) {
            pattern = new TP_PairedPodPermutation();
        } else if (!type.compare("LBDestImbalance")) {
            pattern = new TP_LBDestImbalance();
        } else if (!type.compare("AllToAll")) {
            pattern = new TP_AllToAll();
        } else if (!type.compare("AllToAllPartition")) {
            pattern = new TP_AllToAllPartition();
        } else if (!type.compare("AllToAllVictim")) {
            pattern = new TP_AllToAllVictimTenant();
        } else {
            opp_error("Unknown traffic pattern.");
        }
        return pattern;
    }
};

#endif /* TRAFFIC_PATTERN_FACTORY_H_ */
