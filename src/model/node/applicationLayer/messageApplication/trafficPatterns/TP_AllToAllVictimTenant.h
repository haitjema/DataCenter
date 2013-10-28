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
#ifndef TP_ALLTOALLVICTIMTENANT_H_
#define TP_ALLTOALLVICTIMTENANT_H_

#include "TP_AllToAllPartition.h"


class TP_AllToAllVictimTenant : public TP_AllToAllPartition {
public:
    virtual AppMessageVector createTraffic(const SubTreeID &node_id, double messageSize);
protected:
    virtual void addMessagesForMaliciousServer(uint server_address, uint_vec_t &partition, AppMessageVector &messages);
	typedef std::vector<uint_vec_t *> PartitionVector;
};

#endif /* TP_ALLTOALLVICTIMTENANT_H_ */
