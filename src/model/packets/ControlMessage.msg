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
// Switches flood the message
#define BROADCAST_ADDRESS		((uint)-1)
// Message is desitined for all switches
#define BROADCAST_SWITCHES		((uint)-2)
// Anything less than the value of this constant is assumed to be a regular address
#define BROADCAST_ADDRESS_RANGE ((uint)-2)

}}

enum ControlMessageType
{
    CONTROL_MESSAGE_BASE_KIND	= 1;
	TRAFFIC_SOURCE_CONTROL_MSG	= 2;
	UPDATE_SENDING_RATE_MSG		= 3;
	UPDATE_QUEUE_SIZE_MSG		= 4;
	SCHEDULING_CONTROL_MSG		= 5;
	TENANT_SERVERS_MSG			= 6;
}


message ControlMessage {
    @customize(true);
    unsigned int srcAddr;
    unsigned int dstAddr;
    string srcSubModule;
    string dstSubModule;
    unsigned short type enum(ControlMessageType) = CONTROL_MESSAGE_BASE_KIND;
};
