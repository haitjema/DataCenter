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

package datacenter.model.node.applicationLayer.BklgSchedApplication;
import datacenter.model.common.*;

simple SendBacklog extends SendStream
{
	parameters:
        @class(SendBacklog);
		@signal[BytesToSend](type="long");
        @signal[BytesSent](type="long");
        @signal[flowFinishTime](type="simtime_t");
        @statistic[BytesToSend](title="bytes left in schedule";unit=bytes;record=vector?,last?;interpolationmode=none);
        @statistic[BytesSent](title="bytes that have arrived";unit=bytes;record=vector?,last?;interpolationmode=none);
        @statistic[flowFinishTime](title="time when flow is done sending all backlog in schedule";unit=s;record=last?;interpolationmode=none);
}

simple ReceiveBacklog extends ReceiveStream
{
	parameters:
        @class(ReceiveBacklog);
        @signal[BytesToReceive](type="long");
        @signal[BytesReceived](type="long");
        @signal[flowFinishTime](type="simtime_t");
        @statistic[BytesToReceive](title="bytes left to receive";unit=bytes;record=vector?,last?;interpolationmode=none);
        @statistic[BytesReceived](title="bytes received";unit=bytes;record=vector?,last?;interpolationmode=none);
        @statistic[flowFinishTime](title="time when flow is done receiving all backlog in schedule";unit=s;record=last?;interpolationmode=none);
}
