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

package datacenter.model.node.applicationLayer.TCPMessageApplication;
import datacenter.model.node.applicationLayer.TCPAppInterface;
import datacenter.model.common.FatTreeNode;
import datacenter.model.node.applicationLayer.messageApplication.MessageApplication;
//import inet.applications.tcpapp.TCPApp;
import inet.applications.ITCPApp;

simple TCPMessageApplication extends MessageApplication like TCPAppInterface 
{
    parameters:
        @class(TCPMessageApplication);
        enabled = default(true);
        int listenPort = default(10000);
        // How frequently to get status from socekts for statistics collection
		double getStatusPeriod @unit(s) = default(1ms);
    gates:
        input tcpIn @labels(TCPCommand/up);
        output tcpOut @labels(TCPCommand/down);
}
