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

package datacenter.model.networks.testNetworks;

//import inet.linklayer.ppp.ThruputMeter;
import inet.util.ThruputMeter;

import ned.DatarateChannel;
import datacenter.model.node.server.TCPClientServer;
import datacenter.model.common.L2Queue;
import datacenter.model.common.PacketDropper;

network TCPTest
{
    parameters:
        // Needed by modules that extend FatTreeNode
        **.tree_depth = 1;
        **.int_switch_down_ports = 0;
        **.tor_switch_up_ports = 0;
        **.tor_switch_down_ports = 2;
        **.switch_up_ports = 0;
        **.switch_down_ports = 0;
        **.switch_switch_link_speed = 1Gbps;
        **.server_switch_link_speed = 1Gbps;
        **.number_of_paths = 1;


        double link1rate @unit(bps) = default(1 Gbps);
        double link2rate @unit(bps) = default(0.5 Gbps);
        double link1delay @unit(s) = default(0s);
        double link2delay @unit(s) = default(0s);

    types:
        channel Link_1 extends DatarateChannel
        {
            delay = link1delay;
            datarate = link1rate;
        }
        channel Link_2 extends DatarateChannel
        {
            delay = link2delay;
            datarate = link2rate;
        }

    submodules:
        client: TCPClientServer {
            @display("p=78,123");
            address = 0;
            connectAddress = 1;
        }
        server: TCPClientServer {
            // We just want the server to receive what the client sends
            @display("p=263,123");
            address = 1;
            connectAddress = 0; // don't have the server send to the client
            tcpServerEchoFactor = 0; // don't send back what the client sends
            clientAppActive = false;
        }
        queue1: L2Queue {
            @display("p=176,84");
            qlenPktsSignalName = default("qlenPkts");
            qlenBytesSignalName = default("qlenBytes");
            queueingTimeSignalName = default("queueingTime");
            busySignalName = default("queueBusy");
            txBytesSignalName = default("queueTxBytes");
            rxBytesSignalName = default("queueRxBytes");
            dropSignalName = default("queueDrop");
            @statistic[queueBusy](title="server busy state"; record=vector,timeavg; interpolationmode=sample-hold);
            @statistic[queueRxBytes](title="received packet byte length"; unit=bytes; record=vector,count,sum,histogram; interpolationmode=none);
            @statistic[queueTxBytes](title="transmitting packet byte length"; unit=bytes; record=vector,count,sum,histogram; interpolationmode=none);
            @statistic[qlenBytes](title="queue length (bytes)"; unit=bytes; record=vector,timeavg,max; interpolationmode=sample-hold);
            @statistic[qlenPkts](title="queue length (pkts)"; record=vector,timeavg,max; interpolationmode=sample-hold);
            @statistic[queueDrop](title="dropped packet byte length"; unit=bytes; record=vector,min,max,mean,count,sum; interpolationmode=none);
        }
        queue2: L2Queue {
            @display("p=176,175");
        }

        meter1: ThruputMeter {
            @display("p=136,86");
        }

        packetDrop1: PacketDropper {
            @display("p=229,110");
        }


    connections allowunconnected:
        client.port$o --> Link_1 --> meter1.in;
        meter1.out --> queue1.in;
        // meter1.in; meter1.out --> 
        queue1.line$o --> Link_2 --> packetDrop1.port$i[0];
        packetDrop1.port$o[1] --> server.port$i;
        server.port$o --> Link_2 --> queue2.in;
        queue2.line$o --> Link_1 --> client.port$i;

}
