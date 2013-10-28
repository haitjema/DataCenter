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

package datacenter.model.switch;
import datacenter.model.common.L2Queue;

simple SwitchPortQueue extends L2Queue
{
	@class(SwitchPortQueue);
	bool useVirtualPacketQueue = default(false);
	qlenPktsSignalName = default("switchQlenPkts");
    qlenBytesSignalName = default("switchQlenBytes");
    queueingTimeSignalName = default("switchQueueingTime");
    busySignalName = default("switchBusy");
	txBytesSignalName = default("switchPortTxBytes");
	rxBytesSignalName = default("switchPortRxBytes");
	dropSignalName = default("switchDrop");
	bool useDirectMsgSending;
	
	// XXX Decide what to do with string-based statistics name then finalize and document
	
	//@statistic[switchPortRxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
	//@statistic[switchPortRxBytes](title="received packet byte length";unit=bytes;record=vector,count?,sum?;interpolationmode=none);
    //@statistic[switchPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
    //@statistic[switchPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?;interpolationmode=none);
	//@statistic[switchQlenBytes](title="queue length (bytes)";unit=bytes;record=vector?,timeavg?,max?;interpolationmode=sample-hold);
	@statistic[switchQlenBytes](title="queue length (bytes)";unit=bytes;record=vector?,timeavg?,min?,mean?,max?,histogram?;interpolationmode=sample-hold);
    @statistic[switchQlenPkts](title="queue length (pkts)";record=vector?,timeavg?,min?,mean?,max?,histogram?;interpolationmode=sample-hold);
    //@statistic[switchDrop](title="dropped packet byte length";unit=bytes;record=vector?,min?,max?,mean?,count?,sum?;interpolationmode=none);
    @statistic[switchDrop](title="dropped packet byte length";unit=bytes;record=vector?,count?,sum?;interpolationmode=none);
    @signal[updateQueueSizeBytes](type="long");
    @signal[updateQueueSizePkts](type="long");
    @statistic[updateQueueSizeBytes](title="updated max byte limit for queue";unit=bytes;record=vector?,count?,min?,max?,last?;interpolationmode=none);
    @statistic[updateQueueSizePkts](title="updated max packet limit for queue";record=vector?,count?,min?,max?,last?;interpolationmode=none);
    // Names are inconsistent
    @statistic[dropSrcHost](title="dropped packet source host";record=vector?,count?;interpolationmode=none);
    @statistic[dropDstHost](title="dropped packet destination host";record=vector?,count?;interpolationmode=none);
    // Useful for debugging but disable when not needed
    //@statistic[rxPktSrc](title="source address of received packett";record=vector?, count?; interpolationmode=none);
	//@statistic[rxPktDst](title="destination address of received packet";record=vector?, count?; interpolationmode=none);
	//@statistic[rxPktPriority](title="scheduling priority of received packet";record=vector?, count?; interpolationmode=none);
}

