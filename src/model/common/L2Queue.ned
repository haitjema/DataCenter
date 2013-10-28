//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

package datacenter.model.common;

//
// Represents the network interface for a point-to-point connection.
//
// Packets arriving from the upper layer ("in" gate) are sent out on
// the "line" gate, which is expected to be connected to a link with
// nonzero data rate. Packets that arrive while a previous packet is
// being transmitted are queued up. The maximum queue size in packets
// can be specified in a parameter. Excess frames are simply discarded
// and recorded as statistics.
//
// The model can be easily extended in several ways: to make it possible to
// query the queue length from another module via a direct method call
// interface, to implement priority queueing, or to collect link statistics
// (utilization, etc.)
//
simple L2Queue
{
    parameters:
        double simTimeLimit @unit(s) = default(0s); // This limit is ignored if set to 0
        
        int queueSizePackets = default(0); // max number of packets; 0 means no limit
        int queueSizeBytes @unit(bytes) = default(0 bytes);   // max number of packets; 0 means no limit
        
        bool useL2L2DirectMessageSending = default(true);
        
        // This parameter can be used to add a small amount of random delay to each packet sent from the queue
        // This will desynchronize sending sources to eliminate artifacts introduced by simulation determinism
        // (e.g. if two sources send in synch on a bottleneck link, first will always win)
        bool desynchronizeWithJitter = default(false); 
        volatile double desynchronizeJitterValue @unit(s) = default(0s);
        // Instead of adding jitter using the above parameters, this parameter assigns packets a random scheduling
        // priority right before they are sent. This should achieve the same effect.
        bool desynchronizeWithPriority = default(true);
        
        bool emitStatsOnGlobalSignal = default(false); // added for BklgSchedApplication
        
        string qlenPktsSignalName = default("qlenPkts");
        string qlenBytesSignalName = default("qlenBytes");
        string queueingTimeSignalName = default("queueingTime");
        string busySignalName = default("busy");   
        string txBytesSignalName = default("txBytes");
        string rxBytesSignalName = default("rxBytes");
        string dropSignalName = default("drop");
        
        
        // Note: Queue will drop packets once either of above limits are exceeded
        @display("i=block/queue;q=queue");
        @signal[qlenPkts](type="int");
        @signal[qlenBytes](type="int");
        @signal[busy](type="bool");
        @signal[queueingTime](type="simtime_t");
        @signal[drop](type="int");
        @signal[txBytes](type="long");
        @signal[rxBytes](type="long");
        @statistic[qlenPkts](title="queue length (pkts)";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
        @statistic[qlenBytes](title="queue length (bytes)";record=vector?,timeavg?,max?;interpolationmode=sample-hold);
        @statistic[busy](title="server busy state";record=vector?,timeavg?;interpolationmode=sample-hold);
        @statistic[queueingTime](title="queueing time at dequeue";unit=s;interpolationmode=none);
        @statistic[drop](title="dropped packet byte length";unit=bytes;record=vector?,count?,sum?;interpolationmode=none);
        @statistic[txBytes](title="transmitting packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
        @statistic[rxBytes](title="received packet byte length";unit=bytes;record=vector?,count?,sum?,histogram?;interpolationmode=none);
    gates:
        input in;
        output out;
        inout line;
}


