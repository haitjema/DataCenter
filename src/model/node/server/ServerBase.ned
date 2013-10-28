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

// From INET
//import inet.transport.tcp.ITCP;
import inet.transport.ITCP;
import inet.transport.tcp.TCP;
//import inet.applications.tcpapp.TCPApp;
//import inet.applications.udpapp.UDPApp;
import inet.applications.ITCPApp;
import inet.applications.IUDPApp;
import inet.applications.tcpapp.*;

//import datacenter.model.common.BandwidthMeter;
import datacenter.model.node.applicationLayer.*;
import datacenter.model.node.applicationLayer.TCPAppInterface;
import datacenter.model.node.transportLayer.*;
import datacenter.model.node.transportLayer.InetTCP;
import datacenter.model.node.transportLayer.TCPInterface;
import datacenter.model.node.networkLayer.*;
import datacenter.model.node.networkLayer.NetworkLayerNode;
import datacenter.model.node.schedulingLayer.*;
import datacenter.model.node.schedulingLayer.SchedulingLayerInterface;
import datacenter.model.node.resequencingLayer.*;
import datacenter.model.node.resequencingLayer.ResequencingLayerInterface;
import datacenter.model.node.linkLayer.*;
import datacenter.model.node.linkLayer.LinkLayerInterface;
import datacenter.model.node.control.*;

module ServerBase like Server
{
    parameters:
        @server; // Used to identify module as type server in code
        int address;

        string tcpAppType = default("XXX need a TCP APP");
        //string tcpType = default("inet.transport.tcp.TCP");
        string tcpType = default("InetTCP");
        string networkLayerType = default("VirtualIP");
        string resequencerType = default("HybridResequencer");
        string LinkLayerType = default("LinkLayer");
        string LoadBalancerType = default("ECMPLoadBalancer");
        bool includeSchedulingLayer = default(true);
        bool includeResequencingLayer = default(true);

		// XXX If I use this boolean trick, then I can't seem to set the submodules properties from an ini file
        string schedulingLayerType = default("SchedulingLayer");//(includeSchedulingLayer) ? "SchedulingLayer" : "EmptySchedulingLayer";
        string resequencingLayerType = default("HybridResequencer");//(includeResequencingLayer) ? resequencerType : "EmptyResequencingLayer";

        int numTcpApps = default(0);

        //@statistic[serverBusy](title="server busy state"; record=vector?,timeavg?; interpolationmode=sample-hold);
        @statistic[serverPortRxBytes](title="received packet byte length"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?,timeavg?; interpolationmode=sample-hold);
        @statistic[serverPortTxBytes](title="transmitting packet byte length"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?,timeavg?; interpolationmode=sample-hold);
        //@statistic[rxPktFromHost](title="source address of packet"; record=vector?,count?,min?,max;? interpolationmod=none);
        //@statistic[txPktToHost](title="destination address of packet"; record=vector?,count?,min?,max?; interpolationmod=none);
        @statistic[serverQlenBytes](title="queue length (bytes)"; record=vector?,timeavg?,max?; interpolationmode=sample-hold);
        @statistic[serverQlenPkts](title="queue length (pkts)"; record=vector?,timeavg?,max?; interpolationmode=sample-hold);
                
        @display("i=device/pc2;bgb=300,569");

    gates:
        inout port;


    submodules:

        tcpApp[numTcpApps]: <tcpAppType> like TCPAppInterface {
            parameters:
                @display("p=75,25");
                address = address;
        }

        tcp: <tcpType> like TCPInterface {
            parameters:
                @display("p=100,100");
        }

        udp: SimpleUDP {
            parameters:
                @display("p=200,100");
        }

        networkLayer: <networkLayerType> like NetworkLayerNode {
            parameters:
                @display("p=150,200");
                address = address;
        }

        schedulingLayer: <schedulingLayerType> like SchedulingLayerInterface {
            @display("p=150,300");
            address = address;
        }

        resequencingLayer: <resequencingLayerType> like ResequencingLayerInterface {
            @display("p=150,400");
            address = address;
        }

        linkLayer: <LinkLayerType> like LinkLayerInterface {
            LoadBalancerType = LoadBalancerType;
            address = address;
            @display("p=150,500");
        }

        controlLogic: ControlLogic {
            @display("p=50,500");
            address = address;
        }


    connections allowunconnected:

        for i=0..numTcpApps-1 {
            tcpApp[i].tcpOut --> tcp.appIn++;
            tcpApp[i].tcpIn <-- tcp.appOut++;
        }

        tcp.ipOut --> networkLayer.tcp$i;
        tcp.ipIn <-- networkLayer.tcp$o;

        udp.lower_layer$o --> networkLayer.udp$i;
        udp.lower_layer$i <-- networkLayer.udp$o;

        networkLayer.lower_layer$o --> schedulingLayer.upper_layer$i;
        networkLayer.lower_layer$i <-- schedulingLayer.upper_layer$o;

        schedulingLayer.lower_layer$o --> resequencingLayer.upper_layer$i;
        schedulingLayer.lower_layer$i <-- resequencingLayer.upper_layer$o;

        resequencingLayer.lower_layer$o --> linkLayer.upper_layer$i;
        resequencingLayer.lower_layer$i <-- linkLayer.upper_layer$o;

        linkLayer.lower_layer$o --> port$o;
        linkLayer.lower_layer$i <-- port$i;
        linkLayer.control <--> controlLogic.otherServers;
}
