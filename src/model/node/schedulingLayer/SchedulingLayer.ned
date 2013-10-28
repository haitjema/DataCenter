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

package datacenter.model.node.schedulingLayer;
import datacenter.model.node.schedulingLayer.SchedulingLayerInterface;

module SchedulingLayer like SchedulingLayerInterface
{
    parameters:
        @display("bgb=651,373;i=block/subqueue");
        int address;
        int numVoqs = default(0);
        int MaxVOQSize = default(0); // No limit
        string SchedulingAlgorithm = default("SchedulingAlgorithm");
        double SchedulingPeriod @unit(s) = default(10ms);
        // Send scheduling traffic using control messages instead of packets
        // Useful because it removes the scheduling traffic overhead
        bool SendSchedPktAsControl = default(false);
        bool EnforceBacklogConstraint = default(true);

        // XXX Temporary
        @statistic[voqTxBytesSched](title="Transmitting scheduling packet byte length"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?; interpolationmode=none);
        @statistic[voqTxBytesData](title="Transmitting data packet byte length"; unit=bytes; record=vector?,count?,sum?,mean?,min?,max?; interpolationmode=none);

    gates:
        inout upper_layer;
        inout lower_layer;

    submodules:
        // Note: submodules may lookup pointers to each other by name
        // so keep that in mind if you change their names here 

        demux: Demultiplexer {
            @display("p=36,182");
        }

        mux: Multiplexer {
            @display("p=612,175");
        }

        controller: Controller {
            //controller: SynchController {
            @display("p=318,302");
            address = address;
            //SchedulingAlgorithm = SchedulingAlgorithm;
            //SchedulingPeriod = SchedulingPeriod;
        }

        algorithm: <SchedulingAlgorithm> like SchedulingAlgorithmInterface {
            @display("p=246,302");
            address = address;
        }

        voq[numVoqs]: VirtualOutputQueue {
            @display("p=318,136");
            address = address;
            queueSizePackets = MaxVOQSize;
        }


    connections allowunconnected:
        upper_layer$i --> demux.in;
        mux.out --> lower_layer$o;

        for i=0..numVoqs-1 {
            demux.out++ --> voq[i].in;
            voq[i].out --> mux.in++;
        }

        controller.in <-- lower_layer$i;
        upper_layer$o <-- controller.out;
}
