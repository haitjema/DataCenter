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
import datacenter.model.node.server.Server;
import datacenter.model.common.FatTreeNode;

moduleinterface SubFatTree 
{	
    parameters:
        int depth;
        int sub_tree_id;
        string sub_tree_string;
        int num_up_ports;
        int num_down_ports;
        
	gates:
		inout up_port[num_up_ports];
}  

network SubFatTreeNode like SubFatTree
{
    parameters:
        int tree_depth;					// Number of levels in the FatTree
		int int_switch_down_ports;		// Number of down-ports at top of rack switches (i.e. # of "pods")
		int tor_switch_up_ports;		// Number of up ports at top of rack switches
		int tor_switch_down_ports;		// Number of down ports at top of rack switches (i.e. # servers per switch)
		int switch_up_ports;			// Number of up-ports per switch
		int switch_down_ports;			// Number of down-ports per switch
		int switch_switch_link_speed @unit(bps);	// Speed of switch-to-switch links (1*GBPS or 10*GBPS)
		int server_switch_link_speed @unit(bps);	// Speed of server-to-switch links (1*GBPS or 10*GBPS)

        int depth;
        int sub_tree_id;
        string sub_tree_string;
        
        // Defaults for switches for middle layers of the FatTree (i.e. not intermediate switches nor ToR switches)
        int down_ports_per_switch = default(switch_down_ports);
        int up_ports_per_switch = default(switch_up_ports);
        
        // Number of SubTrees this SubTreeNode has
        // Every switch connects to every SubTree on one port
        int num_sub_trees = down_ports_per_switch;

		// The number of middle layers
		int middle_layers = tree_depth - depth - 1; 
		
		int num_down_ports = default( tor_switch_down_ports * (switch_down_ports^middle_layers) );
		int num_up_ports = default( tor_switch_up_ports * (up_ports_per_switch^middle_layers) );

        // The last layer of the tree is servers (when depth == tree_depth) 
        string subTreeType = (depth == tree_depth-1) ? "ServerNode" : "SubFatTreeNode";
        
    gates:
		inout up_port[num_up_ports];
        
	types:
        channel SwitchLink extends DatarateChannel
        {
        	//datarate = switch_link_data_rate;
        	datarate = switch_switch_link_speed;
        }
        
    submodules:
        
        subTree[num_sub_trees] : <subTreeType> like SubFatTree
        {
            depth = depth + 1;
            sub_tree_id = sub_tree_id + index*subTree[index].num_down_ports;
            sub_tree_string = sub_tree_string + (sub_tree_string == "" ? "" : "_") + string(index);
        }
        
		switch[subTree[0].num_up_ports] : EthSwitch
		//switch[num_top_switches] : EthSwitch
        {
			parameters:
				switch_id = "Switch_"+sub_tree_string+"i"+string(index);
                depth = depth;
                sub_tree_id = sub_tree_id;
            gates:
                down_port[down_ports_per_switch];
                up_port[up_ports_per_switch];
        }
        
    connections:
        // Each switch connects to each subTree
        // Switch i connects to subTree j using its down_port j
        // subTree j connects to switch i using its up_port i 
        for i=0..sizeof(switch)-1, for j=0..down_ports_per_switch-1 {
            switch[i].down_port[j] <--> subTree[j].up_port[i];
        }
        for i=0..sizeof(switch)-1, for j=0..up_ports_per_switch-1 {
         	switch[i].up_port[j] <--> SwitchLink <-->  up_port[i*up_ports_per_switch+j];   
        }
}
