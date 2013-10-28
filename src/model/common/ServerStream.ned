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

package datacenter.model.common;

simple Stream
{
	parameters:
	    @class(Stream);
	    double simTimeLimit @unit(s) = default(0s); // This limit is ignored if set to 0
	    bool emitStatsOnGlobalSignal = default(false); // added for BklgSchedApplication 
}

simple SendStream extends Stream
{
    parameters:
        @class(SendStream);
        @signal[streamTxBytes](type="long");
        @signal[streamPktPath](type="long");
        @signal[txTimestamp](type="simtime_t");
        @signal[txPacketPtr](type="cPacket*"); // Used by MAAdjustRateToThreshold
        @statistic[streamTxBytes](title="Bytes sent in the stream"; unit=bytes; record=vector?,sum?; interpolationmode=none);
        @statistic[streamPktPath](title="Paths taken by packets in this stream";record=histogram?);
        @statistic[txTimestamp](title="timestamp of packet sent";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
}

simple ReceiveStream extends Stream
{
    parameters:
        @class(ReceiveStream);
        @signal[streamRxBytes](type="long");
        @signal[streamRxLatency](type="simtime_t");
        @signal[outOfOrderArrival](type="simtime_t");
        @signal[streamPktPath](type="long");
        @signal[pktSeqNo](type="long");
        @signal[rxTimestamp](type="simtime_t");
        @signal[rxPacketPtr](type="cPacket*"); // Used by MAAdjustRateToThreshold
        @statistic[streamRxBytes](title="Bytes received in the stream"; unit=bytes; record=vector?,sum?; interpolationmode=none);
        @statistic[streamRxLatency](title="received packet latency";unit=s;record=vector?,stats?);
        @statistic[outOfOrderArrival](title="the amount of time a packet is out-of-order by"; unit=s;record=vector?,stats?);
        @statistic[streamPktPath](title="Paths taken by packets in this stream";record=histogram?);
        @statistic[pktSeqNo](title="sequence no of received packet";record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[rxTimestamp](title="timestamp of received packet";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
}
