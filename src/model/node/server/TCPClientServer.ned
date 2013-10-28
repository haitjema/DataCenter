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
import datacenter.model.node.applicationLayer.*;
import datacenter.model.node.transportLayer.*;
import datacenter.model.node.networkLayer.*;
import datacenter.model.node.schedulingLayer.*;
import datacenter.model.node.resequencingLayer.*;
import datacenter.model.node.linkLayer.*;
import datacenter.model.node.control.*;

// From INET
//import inet.transport.tcp.ITCP;
import inet.transport.ITCP;
import inet.transport.tcp.TCP;
//import inet.applications.tcpapp.TCPApp;
import inet.applications.ITCPApp;
import inet.applications.tcpapp.*;


module TCPClientServer extends ServerBase
{
    parameters:
        int connectAddress;
        string addressString = default("0.0.0." + string(address + 1));
        string connectAddressString = default("0.0.0." + string(connectAddress + 1));
        int tcpFlowBytesToSend @unit(bytes) = default(1000000B);
        bool clientAppActive = default(true);
        int tcpServerEchoFactor = default(1.0);
        numTcpApps = 0;

    submodules:
        tcpClient: TCPSessionApp {
            parameters:
                @display("p=175,35");
                active = clientAppActive;
                localAddress = addressString;
                //address = addressString;
                //port = 1001;
                localPort = 1001;
                connectAddress = connectAddressString;
                connectPort = 1000;
                sendBytes = tcpFlowBytesToSend;
                sendScript = "";
                tOpen = 0;
                tSend = 0;
                tClose = 0;
        }
        tcpClient2: TCPSessionApp {
            parameters:
                @display("p=150,35");
                active = clientAppActive;
                //address = addressString;
                localAddress = addressString;
                //port = 1002;
                localPort = 1002;
                connectAddress = connectAddressString;
                connectPort = 1003;
                sendBytes = tcpFlowBytesToSend;
                sendScript = "";
                tOpen = 0;
                tSend = 0;
                tClose = 0;
        }
        tcpServer: TCPEchoApp {
            // Echos whatever application-level message is sent to it over TCP
            parameters:
                @display("p=225,35");
                //address = addressString;
                localAddress = addressString;
                //port = 1000;
                localPort = 1000;
                echoFactor = tcpServerEchoFactor; // Multiply the message size by this factor and send it back, 0 means don't send back
                echoDelay = 0; // 
        }
        tcpServer2: TCPEchoApp {
            // Echos whatever application-level message is sent to it over TCP
            parameters:
                @display("p=225,35");
                //address = addressString;
                localAddress = addressString;
                //port = 1003;
                localPort = 1003;
                echoFactor = tcpServerEchoFactor; // Multiply the message size by this factor and send it back, 0 means don't send back
                echoDelay = 0; // 
        }

    connections allowunconnected:
        tcpClient.tcpOut --> tcp.appIn++;
        tcpClient.tcpIn <-- tcp.appOut++;
        tcpClient2.tcpOut --> tcp.appIn++;
        tcpClient2.tcpIn <-- tcp.appOut++;
        tcpServer.tcpOut --> tcp.appIn++;
        tcpServer.tcpIn <-- tcp.appOut++;
        tcpServer2.tcpOut --> tcp.appIn++;
        tcpServer2.tcpIn <-- tcp.appOut++;
}




