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

simple MAAdjustRateToThreshold extends MessageApplication
{
	parameters:
	    @class(MA_AdjustRateToThreshold);
	    // For Listener (taking action based on network-wide statistics signals):
        bool enableAutoAdjust = default(true);  
        bool useMM1K_estimation = default(true); 
        double checkNetworkLossInterval @unit(s) = default(10 ms);
        bool useMaxLossFraction = default(true); // Use loss of maximum flow by default
        double precision = default(3); // Precision of the rate parameters
        
        // Note: loss threhsold here is actually network wide whereas my results processing scripts do it on a per-flow basis
        double lossThreshold = default(0.001); // A thousandth
        //double capacity;
        @signal[sendingRateAdjustment](type="double");
        @signal[maxLossFraction](type="double");
        @signal[avgLossFraction](type="double");
        @signal[avgSendingRate](type="double");
        @signal[avgReceiveRate](type="double");
        @signal[maxQlenBytes](type="long");
        @signal[maxQlenPkts](type="long");
        @signal[lossMatchesMM1KwithK](type="long");
        @statistic[sendingRateAdjustment](title="Value of new sending rate in respond to UpdateSendingRateMessage"; record=vector?,min?,max?,count?,last?; interpolationmode=none);
        @statistic[maxLossFraction](title="Max loss of any flow in last interval"; record=vector?,min?,max?,count?; interpolationmode=none);
        // avgLoss = average network wide loss if all flows send exactly same rate
        @statistic[avgLossFraction](title="Avg loss across flows in last interval"; record=vector?,min?,max?,count?; interpolationmode=none);
        @statistic[avgSendingRate](title="Avg server sending rate"; record=vector?,min?,max?,count?; interpolationmode=none);
        @statistic[avgReceiveRate](title="Avg server receive rate"; record=vector?,min?,max?,count?; interpolationmode=none);
		@statistic[maxQlenBytes](title="Max queue length (bytes) observed"; record=vector?,min?,max?,count?,last?; interpolationmode=none);
        @statistic[maxQlenPkts](title="Max queue length (pkts) observed"; record=vector?,min?,max?,count?,last?; interpolationmode=none);
        @statistic[lossMatchesMM1KwithK](title="observed loss matches M/M/1/K queue with capacity K";record=vector?,count?,min?,max?,last?;interpolationmode=none);
} 
