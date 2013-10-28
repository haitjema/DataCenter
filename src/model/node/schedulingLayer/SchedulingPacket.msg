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


cplusplus {{
#include "DCN_EthPacket.h"
}}
packet DCN_EthPacket;

enum SchedulingPacketTypes 
{
    SCHEDULING_BACKLOG_REPORT 	= 0;
    SCHEDULING_RATE_ASSIGNMENT 	= 1;
    SCHEDULING_COMPLETE_BACKLOG	= 2;
    SCHEDULING_PKT_ASYNCHRONOUS	= 3;
    SCHEDULING_PKT_CHARNY		= 4;
    SCHEDULING_PKT_MC			= 5;
    SCHEDULING_BKLG_PROP_REQ		= 6;
    SCHEDULING_BKLG_PROP_RESP	= 7;
    SCHEDULING_REQUEST		 	= 8;
    SCHEDULING_RESPONSE		 	= 9;
}

packet SchedulingPacket extends DCN_EthPacket 
{
    kind = DCN_SCHEDULING_PACKET; 
    unsigned short schedPktType enum(SchedulingPacketTypes); 
    dataPacket = false;
}

packet BacklogReport extends SchedulingPacket
{
    schedPktType = SCHEDULING_BACKLOG_REPORT;
    unsigned long backlog;
}

packet RateAssignment extends SchedulingPacket
{
    schedPktType = SCHEDULING_RATE_ASSIGNMENT;
    unsigned long rateAssignment;
}

packet CompleteBacklogReport extends SchedulingPacket
{
	schedPktType = SCHEDULING_COMPLETE_BACKLOG;
	unsigned long backlog[];
}

// XXX Not yet used...
packet AsynchronousSchedulingPacket extends SchedulingPacket
{
    schedPktType = SCHEDULING_PKT_ASYNCHRONOUS;
    unsigned long stampedRate;
    bool ubit;
    unsigned long backlog;	// Additional field used by backlog-proportional algorithm
}
