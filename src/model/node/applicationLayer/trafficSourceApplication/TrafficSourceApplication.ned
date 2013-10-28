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

package datacenter.model.node.applicationLayer.trafficSourceApplication;
import datacenter.model.node.applicationLayer.SimpleUDPApplicationNode;

// Simple traffic source application
module TrafficSourceApplication like SimpleUDPApplicationNode
{
    parameters:
        @display("i=block/app");
        int address;
        bool enabled = default(true);	// set to false to disable the traffic source
        volatile int packetSize @unit(bytes) = default(1500 bytes);
        double sendRate;
        double sendTimeLimit @unit(s) = default(0s);
        string TrafficSourceType;
        string TrafficRegulatorType;

		// Signals defined in TrafficSource.ned
        //@statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
        //@statistic[sendInterval](title="interval between packet transmission";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
        //@statistic[rxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
        //@statistic[rxPktDelay](title="network latecny of packet";unit=s;record=vector?,count?,sum?,histogram?;interpolationmod=none);

    gates:
        inout lower_layer;

    submodules:
        trafficSource: <TrafficSourceType> like TrafficSourceNode {
            address = address;
            enabled = enabled;
            packetSize = packetSize;
            sendTimeLimit = sendTimeLimit;
			//@statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
			//@statistic[sendInterval](title="interval between packet transmission";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
            @display("p=261,71;i=block/square");
        }

        trafficRegulator: <TrafficRegulatorType> like TrafficRegulatorNode {
            @display("p=176,39;i=block/source");
            sendRate=sendRate;
        }

        trafficSink: TrafficSink {
            address = address;
            @display("p=67,70");
        }

    connections allowunconnected:
        lower_layer$i --> trafficSink.lower_layer$i;
        trafficSource.lower_layer$o --> lower_layer$o;
}
