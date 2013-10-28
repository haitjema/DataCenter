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

package datacenter.model.networks.fattree.recursive;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.*;

network ServerNode like SubFatTree
{
    parameters:        
		int depth;
        int sub_tree_id;
        string sub_tree_string;
        int num_up_ports = 1;
        int num_down_ports = 1;
        string ServerType = default(TCPClientServer);
        
		int server_switch_link_speed @unit(bps);
        
 
	gates:
	    inout up_port[num_up_ports];
	    
	types:
		channel ServerSwitchLink extends DatarateChannel
        {
        	datarate = server_switch_link_speed;
        }
                    
    submodules:
        server : <ServerType> like Server {
            parameters:
                address = sub_tree_id;
            gates:
        }
        
    connections:
		server.port <--> ServerSwitchLink <--> up_port[0];
}
