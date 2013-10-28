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

package datacenter.model.node.resequencingLayer;
import datacenter.model.common.ServerBuffer;

simple ResequencerBuffer extends ServerBuffer
{
	parameters:
		@display("i=block/boundedqueue");
		@class(ResequencerBuffer);
		
		// From ServerBuffer
		@signal[qlenPkts](type="long");
        @signal[qlenBytes](type="long");
        @signal[drop](type="long");
        @signal[rxBytes](type="long");	// Note that rx means arrived at buffer from network
        @signal[txBytes](type="long");	// and tx means delivered to host from buffer

		// Resequencer buffer signals
		@signal[rxSeqNo](type="long");				// arriving packet sequence number 
		@signal[rxTimestamp](type="simtime_t");		// arriving packet timestamp
		@signal[txSeqNo](type="long");				// released packet sequence number
		@signal[txTimestamp](type="simtime_t");		// released packet timestamp
		@signal[networkDelay](type="simtime_t");	// delay experienced in network
		@signal[reseqDelay](type="simtime_t");		// delay experienced in resequencer (by packets that were buffered)
		@signal[reseqDelayAll](type="simtime_t");		// delay experienced in resequencer (by all packets whether or not they were buffered)
		@signal[reseqDelayFrac](type="double");	// fraction of overall delay spent in resequencer
		@signal[reseqDelayNetFrac](type="double");	// fraction of overall delay spent in resequencer (net+rsq)
		@signal[totalDelay](type="simtime_t");		// Total delay (voq + network + resequencer)
		@signal[expSeqNo](type="long");				// expected sequence number upon pkt arrival
		@signal[OOArrival](type="long");			// diff between arriving and expected seq. #
		@signal[OODelivery](type="long");			// diff between arriving and expected seq. #
		@signal[setTimeout](type="simtime_t");		// value of the new timeout
		@signal[replaceThreshold](type="simtime_t"); 	// discard pkts older than this time XXX 
		@signal[latePkt](type="simtime_t");  		// lateness of late packet
		@signal[timeout](type="simtime_t");      	// length of timeout that occurred
		@signal[minDelay](type="minDelay");      	// min observed delay
		@signal[maxDelay](type="maxDelay");      	// max observed delay        
		
		// Are these necessary?
		@statistic[qlenPkts](title="queue length (pkts)";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
        @statistic[qlenBytes](title="queue length (bytes)";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
        @statistic[drop](title="dropped packet byte length";unit=bytes;record=vector?,count?,sum?;interpolationmode=none);
        @statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
        @statistic[rxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);

		@statistic[rxSeqNo](title="sequence no of arriving packet";record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[txSeqNo](title="sequence no of released packet";record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[expSeqNo](title="sequence no expected";record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[OOArrival](title="# of seq. numbers between expected and arriving";record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[OODelivery](title="# of seq. numbers between currnet and delivered";record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[rxTimestamp](title="timestamp of received packet";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[txTimestamp](title="timestamp of delivered packet";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[networkDelay](title="time spent in network";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[reseqDelay](title="time spent in resequencer";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[reseqDelayAll](title="time spent in resequencer (all packets)";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[reseqDelayFrac](title="fraction of overall delay spent in resequencer";record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[reseqDelayNetFrac](title="fraction of delay rsq/(net + rsq)";record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[totalDelay](title="total delay (voq+net+rsq)";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
		@statistic[delayThreshold](title="current delayThreshold value";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[latePkt](title="lateness of late packet";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[setTimeout](title="set new timeout value";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
        @statistic[minDelay](title="min observed delay";unit=s;record=vector?,count?,sum?,stats?last?;interpolationmode=none);
        @statistic[maxDelay](title="max observed delay";unit=s;record=vector?,count?,sum?,stats?last?;interpolationmode=none);
        @statistic[timeout](title="length of timeout that triggered";unit=s;record=vector?,count?,sum?,stats?;interpolationmode=none);
        
}

