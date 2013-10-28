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

#ifndef APPMESSAGE_H_
#define APPMESSAGE_H_

class AppMessage
{
public:
    // Mijk = kth message from server i to server j
    uint source;                // i
    uint destination;       // j
    uint messageNum;            // k
    simtime_t startTime;    // earliest start time
    double messageSize;     // message size
    double messageRate;     // optional limit on sending rate of message (0 = no limit)
    friend std::ostream & operator <<(std::ostream &, const AppMessage *);
};


typedef std::vector<AppMessage *> AppMessageVector;
bool sortByStartTime(AppMessage *msg1, AppMessage *msg2);
std::ostream & operator <<(std::ostream &, const AppMessageVector &);


#endif /* APPMESSAGE_H_ */
