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

moduleinterface TrafficRegulatorNode {
 	parameters:
        double sendRate;
	gates:
		inout upper_layer;
        inout lower_layer;    
}

// Don't use this one... it's effectively abstract
simple TrafficRegulatorBase like TrafficRegulatorNode {
    parameters:
        //@class(TrafficRegulator);
        // Rate at which to produce packets corresponding to the fraction of the Server's link rate
        // E.g. 0 means send no packets, 1 means send packets to match link rate
        double sendRate = default(1.0);
	gates:
	    inout upper_layer;
        inout lower_layer;    
}

simple SimpleTrafficRegulator extends TrafficRegulatorBase like TrafficRegulatorNode {
    parameters:
        @class(SimpleTrafficRegulator);
        // Add **.packetDelay = ask to ini to prompt the user
        volatile double packetDelay @unit(s) @prompt("How long should we wait to send the next packet?") = default(1s);
}


simple UniformTrafficRegulator extends TrafficRegulatorBase like TrafficRegulatorNode {
    parameters:
        @class(UniformTrafficRegulator);
}
