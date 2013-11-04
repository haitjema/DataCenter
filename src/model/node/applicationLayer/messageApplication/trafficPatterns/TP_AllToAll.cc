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
#include "TP_AllToAll.h"


AppMessageVector TP_AllToAll::createTraffic(const SubTreeID &node_id, double messageSize)
{
    node_id_ = node_id; messageSize_ = messageSize;
    AppMessageVector messages;
    for (uint i = 0; i < node_id_.getNumberOfServers(); i++) {
        uint server_address = i;
        addMessagesForServer(server_address, messages);
    }
    return messages;
}


void TP_AllToAll::addMessagesForServer(uint server_address, AppMessageVector &messages)
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
