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

package datacenter.model.node.linkLayer;

moduleinterface LinkLayerInterface
{
    parameters:
        int address;
        int number_of_paths;	// This is a global that should be in the network NED file
        bool measureBandwidth;
        string LoadBalancerType;
        @display("i=block/network");
    gates:
        inout upper_layer;
        inout lower_layer; // Must be directly connected to the transmission channel
        inout control;
}
