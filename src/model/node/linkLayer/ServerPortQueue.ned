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

package datacenter.model.node.linkLayer;
import datacenter.model.common.L2Queue;

simple ServerPortQueue extends L2Queue
{
    parameters:
        int address;
        bool measureBandwidth = default(true);
        bool setTimestamp = default(true);
        bool recordStreamStatistics = default(false);
        int limitStatsToEveryPServers = default(0); // Only collect stats for every p'th server
        qlenPktsSignalName = default("serverQlenPkts");
    	qlenBytesSignalName = default("serverQlenBytes");
    	queueingTimeSignalName = default("serverQueueingTime");
    	busySignalName = default("serverBusy");
		txBytesSignalName = default("serverPortTxBytes");
		rxBytesSignalName = default("serverPortRxBytes");
		dropSignalName = default("serverDrop");
		
		@class(ServerPortQueue);
        @signal[sendInterval](type="simtime_t");
        @signal[pktDestTx](type="int");
        @signal[pktDestRx](type="int");
        @statistic[sendInterval](title="interval between packet transmission";unit=bytes;record=vector?,count?,sum?;interpolationmode=none);
        @statistic[pktDestTx](title="destination address of transmitted packet";record=vector?,count?;interpolationmode=none);
		@statistic[pktDestRx](title="source address of received packet";record=vector?,count?;interpolationmode=none);
    	
    gates:
        inout control;
}

