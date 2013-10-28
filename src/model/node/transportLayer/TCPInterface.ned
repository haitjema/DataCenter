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

package datacenter.model.node.transportLayer;

//import inet.transport.tcp.ITCP;
import inet.transport.ITCP;

// XXX There is a bug in OMNET with extending module interfaces
// I am suppose to be able to have TCPInterface extend ITCP here.
// However, if I do so, NED files that use TCPInterface will not 
// recognize the gates that are inherited from ITCP.

moduleinterface TCPInterface
{
	parameters:
	    int mss; // Maximum Segment Size (RFC 793) (header option)
        @display("i=block/wheelbarrow");
    gates:
        input appIn[] @labels(TCPCommand/down);
        input ipIn @labels(TCPSegment,IPControlInfo/up);
        input ipv6In @labels(TCPSegment,IPv6ControlInfo/up);
        output appOut[] @labels(TCPCommand/up);
        output ipOut @labels(TCPSegment,IPControlInfo/down);
        output ipv6Out @labels(TCPSegment,IPv6ControlInfo/down);
}


moduleinterface TCPInterface2 extends ITCP
{
	parameters:
	    int mss; // Maximum Segment Size (RFC 793) (header option)
	gates:
	            
} 