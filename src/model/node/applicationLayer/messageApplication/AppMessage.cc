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
#include "AppMessage.h"


bool sortByStartTime(AppMessage *msg1, AppMessage *msg2)
{ return (msg1->startTime > msg2->startTime); }

std::ostream & operator <<(std::ostream &os, const AppMessage *appMsg)
{
    os << "Application message:\n"
       << "source       = " << appMsg->source << "\n"
       << "destination  = " << appMsg->destination << "\n"
       << "messageNum   = " << appMsg->messageNum << "\n"
       << "startTime    = " << appMsg->startTime << "\n"
       << "messageSize  = " << appMsg->messageSize << "\n"
       << "messageRate  = " << appMsg->messageRate << endl;
    return os;
}

std::ostream & operator <<(std::ostream &os, const AppMessageVector &appMsgVec)
{
    for (AppMessageVector::const_iterator i=appMsgVec.begin(); i != appMsgVec.end(); ++i) { os << *(i); }
    return os;
}

