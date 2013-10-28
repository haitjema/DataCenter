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

// This module builds the FatTree recursively
// Large topologies take a long time to setup and simulations of these recursively
// produced topologies is considerably slower, which is likely due to the large number
// of compound objects.

package datacenter.model.networks.fattree.recursive;

network FatTree extends SubFatTreeNode like SubFatTree
{
    parameters:
		depth = 0;
		sub_tree_id = 0;
		sub_tree_string = "";
		num_up_ports = 0;
		num_down_ports = tor_switch_down_ports * (switch_down_ports^middle_layers) * down_ports_per_switch;
		
		down_ports_per_switch = int_switch_down_ports;
		up_ports_per_switch = 0;		
}
