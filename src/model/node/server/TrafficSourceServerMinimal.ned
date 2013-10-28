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

package datacenter.model.node.server;

import datacenter.model.node.server.*;
import datacenter.model.node.applicationLayer.messageApplication.MessageApplication;
import datacenter.model.node.applicationLayer.messageApplication.MAAdjustRateToThreshold;
import datacenter.model.node.applicationLayer.messageApplication.MAAdjustQueueSizeToRate;
import datacenter.model.node.applicationLayer.SimpleUDPApplicationNode;
import datacenter.model.node.applicationLayer.*;
import datacenter.model.node.applicationLayer.trafficSourceApplication.*;
import datacenter.model.node.transportLayer.*;
import datacenter.model.node.transportLayer.EmptyTCP;
import datacenter.model.node.networkLayer.*;
import datacenter.model.node.schedulingLayer.*;
import datacenter.model.node.resequencingLayer.*;
import datacenter.model.node.linkLayer.*;
import datacenter.model.node.linkLayer.LinkLayerInterface;
import datacenter.model.node.control.*;



// The idea is to bury as much of the un-changing server-specific configuration
// for the load balancing experiments here
// This way the configuration files stay simple, clean, and easily understandable

module TrafficSourceServerMinimal like Server
{
    parameters:
        @server; // Used to identify module as type server in code
        int address;
        string ApplicationType = default("MessageApplication");
        string LinkLayerType = default("LinkLayer");
        string LoadBalancerType = default("ECMPLoadBalancer");

        // STATISTICS
        //@statistic[serverPortRxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
        //@statistic[serverPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
        //@statistic[serverTxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverTxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverRxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverRxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[txPktToHost](title="destination address of packet";unit=bytes;record=vector?,count?,min?,max?,histogram?;interpolationmod=none);

    gates:
        inout port;

    submodules:
        simpleUDPApplication: <ApplicationType> like SimpleUDPApplicationNode {
         //simpleUDPApplication: MessageApplication {// like SimpleUDPApplicationNode {   
            parameters:
                enabled = default(true);
                address = address;
                @display("p=152,38");
        }

        linkLayer: LinkLayer {//<LinkLayerType> like LinkLayerInterface {
            LoadBalancerType = LoadBalancerType;
            address = address;
            @display("p=152,166");
        }

        controlLogic: ControlLogic {
            @display("p=52,166");
            address = address;
        }

    connections allowunconnected:
        simpleUDPApplication.lower_layer <--> linkLayer.upper_layer;

        linkLayer.lower_layer$o --> port$o;
        linkLayer.lower_layer$i <-- port$i;
        linkLayer.control <--> controlLogic.otherServers;
}
