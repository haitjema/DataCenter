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
import datacenter.model.node.applicationLayer.SimpleUDPApplicationNode;
import datacenter.model.node.applicationLayer.*;
import datacenter.model.node.applicationLayer.trafficSourceApplication.*;
import datacenter.model.node.applicationLayer.TCPMessageApplication.*;
import datacenter.model.node.applicationLayer.resequencingTestSource.*;
import datacenter.model.node.transportLayer.*;
import datacenter.model.node.transportLayer.EmptyTCP;
import datacenter.model.node.networkLayer.*;
import datacenter.model.node.schedulingLayer.*;
import datacenter.model.node.resequencingLayer.*;
import datacenter.model.node.linkLayer.*;
import datacenter.model.node.control.*;

//import inet.applications.tcpapp.TCPApp;
import inet.applications.ITCPApp;
import inet.applications.tcpapp.*;


// XXX This module is temporary for testing during the development of TCPMessageApplication

module TrafficSourceServer2 extends ServerBase
{
    parameters:
        
        string ApplicationType = default("MessageApplication");
        int connectAddress;
        // FIXED PARAMTERS
        // Get rid of unnecessary layers
        numTcpApps = default(0);
        tcpType = default("EmptyTCP");
        schedulingLayerType = default("EmptySchedulingLayer");
		resequencingLayerType = default("EmptyResequencingLayer");
		string addressString = default("0.0.0." + string(address + 1));
        string connectAddressString = default("0.0.0." + string(connectAddress + 1));
        // STATISTICS
        //@statistic[serverPortRxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
        //@statistic[serverPortTxBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,mean?,min?,max?;interpolationmode=none);
        //@statistic[serverTxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverTxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverRxBw](title="bits per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[serverRxPktRate](title="packets per second"; record=vector?,min?,max?,mean?; interpolationmode=none);
        //@statistic[txPktToHost](title="destination address of packet";unit=bytes;record=vector?,count?,min?,max?,histogram?;interpolationmod=none);
        
    submodules:
        simpleUDPApplication : <ApplicationType> like SimpleUDPApplicationNode {
            parameters:
                enabled = default(true);
                address = address;
                @display("p=225,25");
        }
        tcpServer: TCPEchoApp {
            // Echos whatever application-level message is sent to it over TCP
            parameters:
                @display("p=225,35");
                //address = addressString;
                localAddress = addressString;
                //port = 10002;
                localPort = 10002;
                echoFactor = 0.0; // Multiply the message size by this factor and send it back, 0 means don't send back
                echoDelay = 0; // 
        }
    connections allowunconnected:
        simpleUDPApplication.lower_layer <--> udp.upper_layer;
        tcpServer.tcpOut --> tcp.appIn++;
        tcpServer.tcpIn <-- tcp.appOut++;
}
