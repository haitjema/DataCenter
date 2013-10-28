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

simple BandwidthMeter
{
    parameters:
        @display("i=block/timer_vs");
        string bandwidthSignalName = default("bandwidth");
        string packetRateSignalName = default("packetRate");
        
        // Interval at which to emit rx/tx bandwidth measurements
        // XXX Important! using the periodic measurement interval below causes an event
        // to be placed on the queue with the specified interval. Not only is this ineffecitent
        // but the simulation will never terminate.
        double bandwidthMeasureInterval @unit(seconds) = default(0 s); // 0 Means don't use interval
        
        // Instead of using a fixed period, specify the batchSize and max interval but
        // let the period be flexible and let measurements be triggered by activity
        int bandwidthMeasurementBatchSize = default(50); // Size of the measurement period in terms of packets
        double maxBandwidthMeasureInterval @unit("s") = default(1s); // Size of the measurement period in terms of seconds
        
        @signal[packetRate](type="double"); // with timestamp
        @signal[bandwidth](type="double"); // with timestamp
        @statistic[packetRate](title="packets per second";record=vector?,min?,max?,mean?;interpolationmode=none);
        @statistic[bandwidth](title="bits per second";record=vector?,min?,max?,mean?;interpolationmode=none);
        
	gates:
	    input in;
	    output out;	    
}