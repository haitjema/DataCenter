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

#ifndef SCHEDULEFROMFILE_H_
#define SCHEDULEFROMFILE_H_

#include "SchedulingAlgorithm.h"

class RSMessage
{
public:
    // Mijk = kth message from server i to server j
    simtime_t startTime;    // earliest start time
    uint source;                // i
    uint destination;       // j
    double rate;
    friend std::ostream & operator <<(std::ostream &, const RSMessage *);
};

typedef std::vector<RSMessage *> RSMessageVector;
bool sortByStartTime(RSMessage *msg1, RSMessage *msg2);
std::ostream & operator <<(std::ostream &, const RSMessageVector &);

class ScheduleFromFile : public SchedulingAlgorithm {
public:
    ScheduleFromFile();
    virtual ~ScheduleFromFile();
    virtual void initialize(int stage);
    virtual void handleMessage(cMessage *msg);

    virtual void setScheduledRate(RSMessage *msg);

    // Called after the controller has allocated a VOQ
    virtual void newVoqAllocated(VirtualOutputQueue *voq) {}
    // Called before the controller removes a VOQ
    virtual void voqTimedOut(VirtualOutputQueue *voq) {}
    // Called when the controller receives a scheduling packet
    virtual void handleSchedulingPacket(SchedulingPacket *pkt) {}
protected:
    void parseScript(const char *script);
    RSMessageVector scheduledRates;
    cMessage *startNextScheduledRate;
};

#endif /* SCHEDULEFROMFILE_H_ */
