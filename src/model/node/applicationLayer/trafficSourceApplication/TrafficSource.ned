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

package datacenter.model.node.applicationLayer.trafficSourceApplication;
import datacenter.model.common.FatTreeNode;
import datacenter.model.node.control.ModuleWithControlPort;

moduleinterface TrafficSourceNode {
 	parameters:
 	    int address; // Defined by FatTreeNode
 	    bool enabled;
 	    double sendTimeLimit;
 	    volatile int packetSize @unit(bytes);
 	    @signal[txBytes](type="long");
 	    @signal[sendInterval](type="long");
 	    @signal[txPktToHost](type="long");
 	    @statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
 	    @statistic[sendInterval](title="interval between packet transmission";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
 	    @statistic[txPktToHost](title="destination address of packet";record=vector?,count?,min?,max?,histogram?;interpolationmod=none);
	gates:
		inout upper_layer;
        inout lower_layer;    
}

// Don't use this one... it's effectively abstract
simple TrafficSourceBase extends ModuleWithControlPort like TrafficSourceNode {
    parameters:
 	    bool enabled;
 	    double sendTimeLimit @unit(s) = default(0s); // time at which to stop sending, 0 means no limit
 	    volatile int packetSize @unit(bytes) = default(1500 bytes);
	gates:
	    inout upper_layer;
        inout lower_layer;    
}

// Use this to specify which destination the source sends to
simple SimpleTrafficSource extends TrafficSourceBase like TrafficSourceNode {
	parameters:
	    @class(TrafficSource);
		// Add **.destinationHost = ask to ini to prompt user
	    volatile int destinationHost @prompt("Enter the destination host number");
}

// With this option, each server will send to a random unique destination
// Set the optional dontSendWithinSubtree parameter to ensure that a server
// does not pick a destination within its own sub-tree (e.g. it has to send through the root
// of the tree to reach the destination)
// XXX maybe I should rename these (e.g. TrafficSourceChooseRandomUniqueDestination)
simple SendServerPermutationTrafficSource extends TrafficSourceBase like TrafficSourceNode {
    parameters:
        @class(SendServerPermutationTrafficSource);
        // Set this to true to ensure that a server only sends to servers outside of its SubTree
        bool dontSendWithinSubtree = default(false); 
}

// Like the above, each server sends to a random unique destination but here the servers are paired up
// i.e. if server A sends to server B then server B also sends to server A 
simple ServerPairPermutationTrafficSource extends SendServerPermutationTrafficSource like TrafficSourceNode {
    parameters:
        @class(ServerPairPermutationTrafficSource);
}

// With this option, the source randomly chooses a new destination at the specified interval
simple IntervalTrafficSource extends TrafficSourceBase like TrafficSourceNode {
	parameters:
	    @class(IntervalTrafficSource);
	    double sendInterval @unit(s) = default(1s);
}

