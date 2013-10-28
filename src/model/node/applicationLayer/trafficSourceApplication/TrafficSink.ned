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

simple TrafficSink extends FatTreeNode {
	parameters:
	    @class(TrafficSink);
        @signal[rxBytes](type="long");
        @signal[rxPktDelay](type="simtime");
        @signal[rxPktFromHost](type="int");
        @statistic[rxBytes](title="received packet byte length";unit=bytes;record=vector,count,sum,histogram;interpolationmode=none);
        @statistic[rxPktDelay](title="network latecny of packet";unit=s;record=vector,count,sum,histogram;interpolationmod=none);
		@statistic[rxPktFromHost](title="source address of packet";record=vector,count,min,max,histogram;interpolationmod=none);
    gates:
        // input in;
        inout upper_layer;
        inout lower_layer;
}
