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
#ifndef TRAFFICPATTERN_H_
#define TRAFFICPATTERN_H_

#include "AppMessage.h"
#include "node_id.h"


class TrafficPattern {
public:
    TrafficPattern();
    virtual ~TrafficPattern();
    virtual AppMessageVector createTraffic(const SubTreeID &node_id, double messageSize=0) = 0;
protected:
    SubTreeID node_id_;
    double messageSize_;
};


#endif /* TRAFFICPATTERN_H_ */
