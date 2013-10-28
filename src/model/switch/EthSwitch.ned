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

package datacenter.model.switch;
import datacenter.model.common.L2Queue;

//
// TODO documentation
// We should probably replace the EthSwitch compound module with a simple module.
// That is, EthSwich should be a C++ class that includes L2Queue's (or something similar)
// as members. This would prevent the simulator from having to create events to pass 
// packets from the queue to the control processor and from the from the control processor
// to the queue.
// A simpler efficiency improvement might be to wire the input portion of the EthSwitch gates
// directly to the control processor so that the queue doesn't have to pass incoming packets 
// to the control processor (which is uncessary).
//  
// @author Mart
//
module EthSwitch
{
    parameters:
        string switch_id;
        int depth;
        int sub_tree_id;
        // When using VirtualPacketQueues, only select fields are stroed in the queue
        // and the original packet is deleted when enqueued. The dequeue cause a new
        // packet to be constructed from the stored fields. 
        bool useVirtualPacketQueues = default(false);
        volatile double processingDelay @unit(s) = default(0);
        int upPortQueueSizePkts = default(0);
        double upPortQueueSizeBytes @unit(bytes) = default(0 bytes);
        int downPortQueueSizePkts = default(0);
        double downPortQueueSizeBytes @unit(bytes) = default(0 bytes);
        // Enabling the option below enables direct message sending between the
        // switch's internal modules.
        // This can be more efficient since it avoids scheduling events to pass
        // messages between the queues and the control processor. 
        bool useDirectMsgSending = default(true);
        @display("i=abstract/router;bgb=266,322");
        
        // Statistics
        // This would lump all the qlen signals from every submodule together into one vector
        //@statistic[qlen](title="queue length";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
        
        
    gates:
        inout down_port[];
        inout up_port[];
        
    submodules:
        controlProcessor: ControlProcessor {
            @display("p=137,154");
            address = sub_tree_id;
            switch_id = switch_id;
            depth = depth;
            sub_tree_id = sub_tree_id;
			processingDelay = processingDelay;
			useDirectMsgSending = useDirectMsgSending;
            gates:
                down_port_in[sizeof(down_port)];
                down_port_out[sizeof(down_port)];
                up_port_in[sizeof(up_port)];
                up_port_out[sizeof(up_port)];
        }
        down_port_queue[sizeof(down_port)]: SwitchPortQueue {
            @display("p=133,242");
            useVirtualPacketQueue = useVirtualPacketQueues;
            queueSizePackets = downPortQueueSizePkts;
            queueSizeBytes = downPortQueueSizeBytes;
            useDirectMsgSending = useDirectMsgSending;
        }
        up_port_queue[sizeof(up_port)]: SwitchPortQueue {
            @display("p=135,66");
            useVirtualPacketQueue = useVirtualPacketQueues;
            queueSizePackets = upPortQueueSizePkts;
            queueSizeBytes = upPortQueueSizeBytes;
            useDirectMsgSending = useDirectMsgSending;
        }
    connections allowunconnected:
        for i=0..(sizeof(down_port))-1 {
            controlProcessor.down_port_out[i] --> down_port_queue[i].in;
            //controlProcessor.down_port_in[i] <-- down_port$i[i];
            //down_port_queue[i].line$o --> down_port$o[i];
            controlProcessor.down_port_in[i] <-- down_port_queue[i].out;
            down_port_queue[i].line <--> down_port[i];
        }
        for i=0..sizeof(up_port)-1 {
            controlProcessor.up_port_out[i] --> up_port_queue[i].in;
            //controlProcessor.up_port_in[i] <-- up_port$i[i];
            //up_port_queue[i].line$o --> up_port$o[i];
            controlProcessor.up_port_in[i] <-- up_port_queue[i].out;
            up_port_queue[i].line <--> up_port[i];
        }
}

