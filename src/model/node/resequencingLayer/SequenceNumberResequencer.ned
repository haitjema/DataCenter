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

package datacenter.model.node.resequencingLayer;

// Sequence Number Based Resequencer
simple SequenceNumberResequencer like ResequencingLayerInterface
{
    parameters:
    	@display("i=old/ring");
    	int address;
    	// Timeout specifies how long resequencer should wait for a missing packet 
    	double Timeout @unit("s") = default(1ms); // TODO determine appropriate default
    	// Adaptively adjust the resequencing timeouts to match observed network delay
    	bool UseAdaptiveTimeout = default(false);
    	
    	// BufferTimeout determines how long resequencing state will be maintained for a given sender
    	// Note: If you set this to 0 the resequencer will not automatically timeout buffers but
    	// other modules (e.g. scheduling layer) may still remove the buffers 
    	double BufferTimeout @unit("s") = default(10s); // TODO determine appropriate default
    gates:
        inout upper_layer;
        inout lower_layer;
}
