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

package datacenter.model.node.schedulingLayer;
import datacenter.model.common.FatTreeNode;

simple Controller extends FatTreeNode
{
    parameters:
        @display("i=block/wrxtx");
        @class(SchedulingController);
        //int address; 
        string SchedulingAlgorithm = default("SchedulingAlgorithm"); // XXX Remove
        double VOQTimeout @unit(s) = default(0s); // 0 to disable
    gates:
        input control @directIn;
        input in;
        output out;
}
