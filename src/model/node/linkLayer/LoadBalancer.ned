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
import datacenter.model.common.FatTreeNode;

moduleinterface LoadBalancerNode 
{
    parameters:
        int address;
    gates:
    	inout upper_layer;
        inout lower_layer;
}

simple LoadBalancerBase extends FatTreeNode like LoadBalancerNode {
 	parameters:
 	    @signal[txBytes](type="long");
 	    @signal[pathBytes](type="long");
        //@statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector,count,sum,histogram;interpolationmode=none);
        //@statistic[pathBytes](title="bytes sent along path";unit=bytes;record=vector,count,sum,histogram;interpolationmode=none);
    gates:
        inout upper_layer;
        inout lower_layer;    
}

// Prompts the user for the path
simple SimpleLoadBalancer extends LoadBalancerBase like LoadBalancerNode {
	parameters:
	    @class(LoadBalancer);
	    volatile int routeThroughPath @prompt("Enter the path for the packet to take:");
}

// Statically hashes destination addresses to paths
simple ECMPLoadBalancer extends LoadBalancerBase like LoadBalancerNode {
    parameters:
    	@class(ECMPLoadBalancer);
}

// Chooses random path for each packet
simple VLBLoadBalancer extends LoadBalancerBase like LoadBalancerNode {
    parameters:
        @class(VLBLoadBalancer);
}

// Round-robin
simple RRLoadBalancer extends LoadBalancerBase like LoadBalancerNode {
	parameters:
	    @class(RRLoadBalancer);
	    bool usePermutations = default(false);
}

// Round-robin but perform a permutation on the list of paths after each round. 
simple PRRLoadBalancer extends RRLoadBalancer like LoadBalancerNode {
	parameters:
	    @class(RRLoadBalancer);
	    usePermutations = true;
}

// Surplus-round robin 
simple SRRLoadBalancer extends RRLoadBalancer like LoadBalancerNode {
	parameters:
	    @class(SRRLoadBalancer);
	    int quantum @unit(byte) = default(1500 bytes);    
}

simple PSRRLoadBalancer extends SRRLoadBalancer like LoadBalancerNode {
	parameters:
	    usePermutations = true;
}

// Chooses paths at random but sends at least quantum bytes worth of packets 
// along the current path before a new path is chosen
simple RehashLoadBalancer extends PSRRLoadBalancer like LoadBalancerNode {
    parameters:
        @class(RehashLoadBalancer);
}

// Sorted Deficit - Always choses the path with the most credits, break ties arbitrarily.
simple SDLoadBalancer extends SRRLoadBalancer like LoadBalancerNode {
	parameters:
	    @class(SDLoadBalancer);
}

simple PSDLoadBalancer extends SDLoadBalancer like LoadBalancerNode {
	parameters:
	    usePermutations = true;
}

// per-Destination Sorted Deficit - Keep separate state per-destination and perform the 
// sorted deficit approach on the state associated with the destination
simple DSDLoadBalancer extends SDLoadBalancer like LoadBalancerNode {
	parameters:
	    @class(DSDLoadBalancer);
	    usePermutations = default(true);
}

// Two-Phase sorted-deficit - Keep a main set of counters and a per-destination set of counters
// A path's credit is the sum of these two, choose the path with the most credits
simple TPLoadBalancer extends SDLoadBalancer like LoadBalancerNode {
	parameters:
	    @class(TPLoadBalancer);
	    usePermutations = default(true);    
}

// Multi-Phase load balancer - A generalization of the TP approach where a set of path counters
// is maintained per-subtree.
simple MPLoadBalancer extends TPLoadBalancer like LoadBalancerNode {
    parameters:
        @class(MPLoadBalancer);
        usePermutations = default(true);
}
