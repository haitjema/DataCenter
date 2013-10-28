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

package datacenter.model.switch;
import datacenter.model.common.FatTreeNode;

simple ControlProcessor extends FatTreeNode
{
    parameters:
        @class(ControlProcessor);
        string switch_id;
        volatile double processingDelay @unit(s) = default(0); // Simulates processing delay in switch
        int depth;
        int sub_tree_id;	// the sub-tree id of this switch
        bool useDirectMsgSending;


	@display("i=block/switch");
    gates:
        input down_port_in[];
        output down_port_out[];
        input up_port_in[];
        output up_port_out[];
}
