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

package datacenter.model.node.applicationLayer.messageApplication;
import datacenter.model.node.applicationLayer.SimpleUDPApplicationNode;
import datacenter.model.common.FatTreeNode;

simple MessageApplication extends FatTreeNode like SimpleUDPApplicationNode
{
    parameters:
        @class(MessageApplication);
        bool enabled;

        // Stop sending traffic at the specified time
        double sendTimeLimit @unit(s) = default(0s); // This limit is ignored if set to 0
        int limitStatsToEveryPServers = default(0); // Only collect stats for every p'th server
        
        // Default Traffic Parameters:
        // -1 means minimum UDP payload size
        // -2 means maximum UDP payload size
        // -3 means uniform random between min & max UDP payload size
        // -4 means alternate between max and min payload sizes
        int payloadSize @unit(bytes) = default(-1 bytes);
        bool randomInterArrival = default(false); // false produces uniform spacing between packets
        bool randomStartTimes = default(false);
        // BURSTY TRAFFIC - To enable two-state bursty traffic, set one of the following:
        // (the other will be calculated based on the message's allowed send rate) 
        double avgBurstLength @unit(s) = default(0s);
        double avgTimeBetweenBursts @unit(s) = default(0s);
        double burstyInjectionRate = default(1.0); // Fraction of the server's send rate
        // Scale back the traffic produced by the messages to this limit. (0 means no limit)
        double maxSendRate @unit(bps) = default(0 bps); 
        // Full path and file name of send script. See exampleMessageScript.txt...
        string messageScript = default("");
        bool writeButDontLoadScript = default(true); // Having every server read from a script can be inefficient.
        											// This option writes the script but does not read from it.
		double messageSize @unit(bytes) = default(10 GiB);// default(8.58993e+10 bytes);
        string scriptGenType = default("PairedPermutationTraffic");
        int partitionSize = default(0); // XXX Temp for SG_AllToAllPartition, 0 means use # paths
        bool recordStreamStatistics = default(true); 
        bool useHardcodedStreamStatistics = default(false);
        
        @display("i=block/app");
        
    gates:
		input control @directIn; // Control messages
        inout lower_layer;
}
