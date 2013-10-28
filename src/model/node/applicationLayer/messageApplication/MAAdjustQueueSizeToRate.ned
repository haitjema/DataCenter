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


simple MAAdjustQueueSizeToRate extends MAAdjustRateToThreshold
{
	parameters:
	    @class(MA_AdjustQueueSizeToRate);
	    // By default, use M/M/1/K model to guide the value of K (queue size pkts) based on loss measurements
	    // Alternative is to decrement K until the threshold is exceeded which can take much longer.
	    useMM1K_estimation = default(true); 
	    precision = default(5); // Since the queue size K is an integer, precision only refers to the precision of the value of rho with MM1K estimation and not the value being adjusted
        @signal[updateQueueSizeBytes](type="long");
        @signal[updateQueueSizePkts](type="long");
        @signal[lossMatchesMM1KwithRho](type="double"); // Only applies when using MM1K estimation to find queue size
        @statistic[updateQueueSizeBytes](title="updated max byte limit for queue";unit=bytes;record=vector?,count?,min?,max?,last?;interpolationmode=none);
        @statistic[updateQueueSizePkts](title="updated max packet limit for queue";record=vector?,count?,min?,max?,last?;interpolationmode=none);
        @statistic[lossMatchesMM1KwithRho](title="observed loss matches M/M/1/K queue with this traffic intensity";record=vector?,count?,min?,max?,last?;interpolationmode=none);
}