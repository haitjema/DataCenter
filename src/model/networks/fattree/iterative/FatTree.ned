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


// XXX TODO This is INCOMPLETE
// This was an attempt to build the FatTree using the for loop constructs

package datacenter.model.networks.fattree.iterative;
import ned.DatarateChannel;
import datacenter.model.switch.EthSwitch;
import datacenter.model.node.server.*;
import datacenter.model.common.FatTreeNode;

network FatTree 
{	
    parameters:
        
        int tree_depth;					// Number of levels in the FatTree
		int int_switches;//  = default(num_top_switches); 		// Number of intermediate switches
		int int_switch_down_ports;		// Number of down-ports at top of rack switches (i.e. # of "pods")
		int tor_switch_up_ports;		// Number of up ports at top of rack switches
		int tor_switch_down_ports;		// Number of down ports at top of rack switches (i.e. # servers per switch)
		int switch_up_ports;			// Number of up-ports per switch
		int switch_down_ports;			// Number of down-ports per switch
		int switch_switch_link_speed @unit(bps);	// Speed of switch-to-switch links (1*GBPS or 10*GBPS)
		int server_switch_link_speed @unit(bps);	// Speed of server-to-switch links (1*GBPS or 10*GBPS)
        string ServerType = default(TCPClientServer);
        
        int depth;
        int sub_tree_id;
        string sub_tree_string;
        int num_up_ports;
        int num_down_ports;
        //int num_top_switches;
        int down_ports_per_switch;
        int up_ports_per_switch;
        
        
        int num_middle_layers = tree_depth-2; // 1 layer for int-switches, one layer for ToR-switches
        
        int num_tor_switches = default(int_switch_down_ports * (switch_down_ports ^ num_middle_layers));
        int num_servers = default(num_tor_switches * tor_switch_down_ports);
        
        
        int num_switches = default(int_switches + tor_switch_up_ports*(switch_up_ports ^ num_middle_layers));
                
	types:
        channel SwitchLink extends DatarateChannel
        {
        	//datarate = switch_link_data_rate;
        	datarate = switch_switch_link_speed;
        }
        
        
               
    submodules:
        
        server[num_servers] : <ServerType> like Server
        {
            address = index;
        }
        
		switch[num_switches] : EthSwitch
		//switch[num_top_switches] : EthSwitch
        {
			parameters:
				switch_id = "Switch_"+sub_tree_string+"i"+string(index);
                depth = depth;
                sub_tree_id = 0;
            gates:
                down_port[down_ports_per_switch];
                up_port[up_ports_per_switch];
        }
        
    connections:
        // Each switch connects to each subTree
        // Switch i connects to subTree j using its down_port j
        // subTree j connects to switch i using its up_port i 
        
        //for i=0..sizeof(switch)-1, for j=0..down_ports_per_switch-1 {
        //    switch[i].down_port[j] <--> subTree[j].up_port[i];
       // }
        
        
}
