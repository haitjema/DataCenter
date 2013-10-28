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

package datacenter.model.node.resequencingLayer.test;
import datacenter.model.node.resequencingLayer.*;

network TestNetworkForResequencer
{
    parameters:

        @display("bgb=398,176");
    submodules:
        resequencer: SequenceNumberResequencer {
            parameters:
                Timeout = 5ms;
                UseAdaptiveTimeout = false;
                BufferTimeout = 1s;
                @display("p=259,74");
        }

        //trafficSourceSink: TestTrafficSource {
        //    parameters:
        //        @display("p=99,74");
        //}

    connections:
     //   resequencer.lower_layer <--> trafficSourceSink.lower_layer;
       // resequencer.upper_layer <--> trafficSourceSink.upper_layer;

}
