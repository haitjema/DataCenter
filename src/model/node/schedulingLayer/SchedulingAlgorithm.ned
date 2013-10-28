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

moduleinterface SchedulingAlgorithmInterface
{
    parameters:    
        int address;
} 

simple SchedulingAlgorithm like SchedulingAlgorithmInterface
{
    parameters:
        int address;
        @display("i=block/network2");
        double MinVOQSendRate @unit(bps) = default(1kbps);
        double ReserveBandwidth @unit(bps) = default(10*MinVOQSendRate);
        // Also support allocating out more bandwidth.
        // E.g. A factor of 1.1 means allocate out 1.1 times the server's interface
        // Note: this applies to both the server's TX and RX bandwidth and the 
        // factor is applied before subtracting the above reserve from the RX bandwidth.
        double OversubscriptionFactor = default(1); 
	gates:
        //inout port;
}

simple ScheduleFromFile extends SchedulingAlgorithm like SchedulingAlgorithmInterface
{
    parameters:
        @class(ScheduleFromFile);
        string rateScheduleScript = default("exampleRateSchedule.txt");
}

simple DistAlgProxy extends SchedulingAlgorithm like SchedulingAlgorithmInterface
{
	parameters:
	    @class(DistAlgProxy);
	     // Note that scheduling is asynchronous so each flow has its own timer
	    double SchedulingPeriod @unit(s) = default(1 ms); // Per-flow scheduling period...
	    bool MaxMin = default(false); // By default, backlog-proportional rates are used
	    bool DesynchSchedIntervals = default(true); // Desynchronize scheduling intervals by having VOQ's first req. pkt gen. at now + rand()*T
	    MinVOQSendRate @unit(bps) = default(0 bps);
        ReserveBandwidth @unit(bps) = default(0 bps);
}
