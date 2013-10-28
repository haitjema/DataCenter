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

import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.Server;
//import inet.linklayer.ppp.ThruputMeter;
import inet.util.ThruputMeter;
import datacenter.model.common.BandwidthMeter;

network TCPRateAdjustmentTest
{
    parameters:
        **.tree_depth = 2;
        **.int_switch_down_ports = 4;
        **.tor_switch_up_ports = 2;
        **.tor_switch_down_ports = 2;
        **.switch_up_ports = 2;
        **.switch_down_ports = 2;
        **.switch_switch_link_speed = 1000000000 bps;
        **.server_switch_link_speed = 1000000000 bps;
        string ServerType = default("TCPClientServer");
        **.number_of_paths = 2;

    types:
        channel Link_1Gbps extends DatarateChannel
        {
            datarate = 1 Gbps;
        }
        channel Link_10Gbps extends DatarateChannel
        {
            datarate = 10 Gbps;
        }

    submodules:
        Server_0_0: <ServerType> like Server {
            parameters:
                @display("p=50,450,x");
                address = 0;
            gates:
        }
        Server_0_1: <ServerType> like Server {
            parameters:
                @display("p=175,450,x");
                address = 1;
            gates:
        }
        Switch_0_i0: EthSwitch {
            parameters:
                @display("p=112,250,x");
                switch_id = "Switch_0_i0";
                depth = 1;
                sub_tree_id = 0;
            gates:
                down_port[2];
                up_port[2];
        }
        Server_1_0: <ServerType> like Server {
            parameters:
                @display("p=300,450,x");
                address = 2;
            gates:
        }
        Server_1_1: <ServerType> like Server {
            parameters:
                @display("p=425,450,x");
                address = 3;
            gates:
        }
        Switch_1_i0: EthSwitch {
            parameters:
                @display("p=362,250,x");
                switch_id = "Switch_1_i0";
                depth = 1;
                sub_tree_id = 2;
            gates:
                down_port[2];
                up_port[2];
        }
        Server_2_0: <ServerType> like Server {
            parameters:
                @display("p=550,450,x");
                address = 4;
            gates:
        }
        Server_2_1: <ServerType> like Server {
            parameters:
                @display("p=675,450,x");
                address = 5;
            gates:
        }
        Switch_2_i0: EthSwitch {
            parameters:
                @display("p=612,250,x");
                switch_id = "Switch_2_i0";
                depth = 1;
                sub_tree_id = 4;
            gates:
                down_port[2];
                up_port[2];
        }
        Server_3_0: <ServerType> like Server {
            parameters:
                @display("p=800,450,x");
                address = 6;
            gates:
        }
        Server_3_1: <ServerType> like Server {
            parameters:
                @display("p=925,450,x");
                address = 7;
            gates:
        }
        Switch_3_i0: EthSwitch {
            parameters:
                @display("p=862,250,x");
                switch_id = "Switch_3_i0";
                depth = 1;
                sub_tree_id = 6;
            gates:
                down_port[2];
                up_port[2];
        }
        Switch_i0: EthSwitch {
            parameters:
                @display("p=341,50,x");
                switch_id = "Switch_i0";
                depth = 0;
                sub_tree_id = 304;
            gates:
                down_port[4];
                up_port[0];
        }
        Switch_i1: EthSwitch {
            parameters:
                @display("p=632,50,x");
                switch_id = "Switch_i1";
                depth = 0;
                sub_tree_id = 304;
            gates:
                down_port[4];
                up_port[0];
        }

        meter1: ThruputMeter {
            @display("p=66,296");
        }

        meter2: ThruputMeter {
            @display("p=154,296");
        }

        //meter3: BandwidthMeter {
        meter3: ThruputMeter {
            @display("p=538,61");
            //@statistic[packetRate](title="packets per second";record=vector,min,max,mean;interpolationmode=none);
        	//@statistic[bandwidth](title="bits per second";record=vector,min,max,mean;interpolationmode=none);
        }

    connections:
        //Switch_0_i0.down_port[0] <--> Link_1Gbps <--> Server_0_0.port;
        Switch_0_i0.down_port$o[0] --> Link_1Gbps --> Server_0_0.port$i;
        Server_0_0.port$o --> Link_1Gbps --> meter1.in;
        meter1.out --> Switch_0_i0.down_port$i[0];

        //Switch_0_i0.down_port[1] <--> Link_1Gbps <--> Server_0_1.port;
        Switch_0_i0.down_port$o[1] --> Link_1Gbps --> Server_0_1.port$i;
        Server_0_1.port$o --> Link_1Gbps --> meter2.in;
        meter2.out --> Switch_0_i0.down_port$i[1];

        Switch_1_i0.down_port[0] <--> Link_1Gbps <--> Server_1_0.port;
        Switch_1_i0.down_port[1] <--> Link_1Gbps <--> Server_1_1.port;
        Switch_2_i0.down_port[0] <--> Link_1Gbps <--> Server_2_0.port;
        Switch_2_i0.down_port[1] <--> Link_1Gbps <--> Server_2_1.port;
        Switch_3_i0.down_port[0] <--> Link_1Gbps <--> Server_3_0.port;
        Switch_3_i0.down_port[1] <--> Link_1Gbps <--> Server_3_1.port;
        Switch_i0.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[0];

        Switch_i0.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[0];
        Switch_i0.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[0];
        Switch_i0.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[0];
        //Switch_i1.down_port[0] <--> Link_1Gbps <--> Switch_0_i0.up_port[1];
        Switch_0_i0.up_port$o[1] --> Link_1Gbps --> meter3.in;
        meter3.out --> Switch_i1.down_port$i[0];
        Switch_i1.down_port$o[0] --> Link_1Gbps --> Switch_0_i0.up_port$i[1];

        Switch_i1.down_port[1] <--> Link_1Gbps <--> Switch_1_i0.up_port[1];
        Switch_i1.down_port[2] <--> Link_1Gbps <--> Switch_2_i0.up_port[1];
        Switch_i1.down_port[3] <--> Link_1Gbps <--> Switch_3_i0.up_port[1];
}
