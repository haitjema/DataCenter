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
import datacenter.model.node.server.TCPClientServer;
import datacenter.model.node.networkLayer.VirtualIP;


network TCPClientServerTest
{
    parameters:
        **.tree_depth = 1;
        **.int_switch_down_ports = 0;
        **.tor_switch_up_ports = 0;
        **.tor_switch_down_ports = 2;
        **.switch_up_ports = 0;
        **.switch_down_ports = 0;
        **.switch_switch_link_speed = 1Gbps;
        **.server_switch_link_speed = 1Gbps;
        **.number_of_paths = 1;

		string ClientServerType = "TCPClientServer";
		string ServerServerType = "TCPClientServer";
		

        @display("bgb=337,211");
    types:
        channel Link_1Gbps extends DatarateChannel
        {
            datarate = 1 Gbps;
        }

    submodules:
        client: TCPClientServer {
            @display("p=78,123");
            address = 0;
            connectAddress = 1;
        }
        server: TCPClientServer {
            @display("p=228,123");
            address = 1;
            connectAddress = 0;
        }

        Switch_0_0_i0: EthSwitch {
            parameters:
                @display("p=154,50,x");
                switch_id = "Switch_0_0_i0";
                depth = 0;
                sub_tree_id = 0;
            gates:
                down_port[2];
                up_port[0];
        }
    connections:
        client.port <--> Link_1Gbps <--> Switch_0_0_i0.down_port[0];
        server.port <--> Link_1Gbps <--> Switch_0_0_i0.down_port[1];
}


