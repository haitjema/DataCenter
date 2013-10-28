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

package datacenter.model.networks.testNetworks;

import ned.DatarateChannel;
//import inet.networklayer.autorouting.FlatNetworkConfigurator;
import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.StandardHost;


network TCPClientServerInet
{
    submodules:
        client1: StandardHost {
            @display("p=112,84");
        }
        server: StandardHost {
            @display("p=304,84");
        }
        configurator: FlatNetworkConfigurator {
            @display("p=215,152");
        }
    connections:
        client1.pppg++ <--> DatarateChannel <--> server.pppg++;
}
