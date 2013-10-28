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

package datacenter.model.node.schedulingLayer;
import datacenter.model.common.ServerBuffer;

simple VirtualOutputQueue extends ServerBuffer
{
    parameters:
        @display("i=block/boundedqueue");
        @class(VirtualOutputQueue);
        int address;
        
        // Different options for accounting for control traffic
        bool noSchedAccounting = default(true); // If true, scheduling packets do not affect send times of data packets 
        bool queueSchedPkts = default(false); // Enqueue all scheduling packets  
        
        // XXX Signal names are dynamic. TODO: Decide if this is the best way and document.
		// From ServerBuffer
		@signal[voqQlenPkts](type="long");
        @signal[voqQlenBytes](type="long");
        @signal[voqDrop](type="long");
        @signal[voqRxBytes](type="long");
        @signal[voqTxBytes](type="long");
        @signal[voqTxBytesSched](type="long");
        @signal[voqTxBytesData](type="long");
        @signal[voqAdjustSendingRate](type="long");
        @signal[voqReqRate](type="double");
        @signal[voqAllocRate](type="double");
        @signal[voqRecRate](type="double");
        @signal[voqDelay](type="simtime_t");		// delay experienced in VOQ
        @statistic[voqQlenPkts](title="VOQ Queue length packets"; record=vector?,count?,sum?,mean?,min?,max?,timeavg?; interpolationmode=sample-hold);
        @statistic[voqQlenBytes](title="VOQ Queue length bytes"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?,timeavg?; interpolationmode=sample-hold);
        @statistic[voqDrop](title="VOQ packet drops"; record=vector?,count?,sum?,mean?,min?,max?; interpolationmode=none);
        @statistic[voqTxBytes](title="VOQ TX bytes"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?; interpolationmode=none);
        @statistic[voqRxBytes](title="VOQ RX bytes"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?; interpolationmode=none);
        @statistic[voqAdjustSendingRate](title="VOQ sending rate adjusted"; unit=bps; record=vector?,count?,timeavg?,mean?,min?,max?; interpolationmode=sample-hold);
        @statistic[voqReqRate](title="Requested rate"; record=vector?,count?,timeavg?,mean?,min?,max?; interpolationmode=sample-hold);
        @statistic[voqAllocRate](title="Allocated rate"; record=vector?,count?,timeavg?,mean?,min?,max?; interpolationmode=sample-hold);
        @statistic[voqRecRate](title="Allowed rate"; record=vector?,count?,timeavg?,mean?,min?,max?; interpolationmode=sample-hold);
        @statistic[voqDelay](title="time spent in VOQ";unit=s;record=vector?,count?,sum?,stats?,timeavg?;interpolationmode=sample-hold);
	gates:
        input in;
        output out;
}
