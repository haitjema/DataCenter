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

package datacenter.model.common;

// Any component that needs to understand the construction of the FatTree and the addressing scheme
// being used should extend this class
simple FatTreeNode
{
 	parameters:
 	    int address;
 	       
 	    // Topology parameters
		int tree_depth;					// Number of levels in the FatTree
		int int_switch_down_ports;		// Number of down-ports at top of rack switches (i.e. # of "pods")
		int tor_switch_up_ports;		// Number of up ports at top of rack switches
		int tor_switch_down_ports;		// Number of down ports at top of rack switches (i.e. # servers per switch)
		int switch_up_ports;			// Number of up-ports per switch
		int switch_down_ports;			// Number of down-ports per switch
		int number_of_paths = default( tor_switch_up_ports * (switch_up_ports ^ (tree_depth - 2)) );			// The number of paths available, default is all
		int switch_switch_link_speed @unit(bps);	// Speed of switch-to-switch links (1*GBPS or 10*GBPS)
		int server_switch_link_speed @unit(bps);	// Speed of server-to-switch links (1*GBPS or 10*GBPS)
}
