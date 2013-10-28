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
import datacenter.model.node.linkLayer.LinkLayerInterface;
import datacenter.model.common.BandwidthMeter;

module LinkLayer like LinkLayerInterface
{
    parameters:
        int address;
        string LoadBalancerType;
        bool measureBandwidth = default(true);
        // These are globals
        int tor_switch_up_ports;
        int switch_up_ports;
        int tree_depth;
        int number_of_paths = default(tor_switch_up_ports * (switch_up_ports ^ (tree_depth - 2)));	// The number of paths available, default is all
		//int inclMeter = measureBandwidth ? 1 : 0;
		// Signals in the BandwidthMeter module 
        @statistic[serverTxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        @statistic[serverTxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        @statistic[serverRxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        @statistic[serverRxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        @display("bgb=432,290");
    gates:
        inout upper_layer;
        inout lower_layer;
        inout control;
    submodules:
        path[number_of_paths]: Path {
            //@statistic[pathBytes](title="packet byte length sent on path";unit=bytes;record=vector,count,sum,histogram;interpolationmode=none);
            @display("p=268,134;is=l");
        }
        loadBalancer: <LoadBalancerType> like LoadBalancerNode {
            address = address;
            @display("p=178,77");
        }

        port_queue: ServerPortQueue {
            parameters:
                address = address;
                measureBandwidth = measureBandwidth;
                @display("p=178,210");
        }

        //txMeter[inclMeter]: BandwidthMeter {
        txMeter: BandwidthMeter {
            bandwidthSignalName = "serverTxBw";
            packetRateSignalName = "serverTxPktRate";
            @display("p=132,256");
        }

        //rxMeter[inclMeter]: BandwidthMeter {
        rxMeter: BandwidthMeter {
            bandwidthSignalName = "serverRxBw";
            packetRateSignalName = "serverRxPktRate";
            @display("p=220,256");
        }

    connections allowunconnected:
		// messages from the layer above are sent to the loadBalancer	    
        upper_layer$i --> loadBalancer.upper_layer$i;
        // loadBalancer sends them out
        upper_layer$o <-- port_queue.out;
        loadBalancer.lower_layer$o --> port_queue.in;

        // messages coming in from the outside are forwarded up to the next layer

        port_queue.control <--> control;
        port_queue.line$i <-- lower_layer$i;
        port_queue.line$o --> lower_layer$o;
}
