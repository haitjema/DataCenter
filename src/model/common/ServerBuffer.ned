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

package datacenter.model.common;

simple ServerBuffer
{
	parameters:
		@display("i=block/boundedqueue");
		@class(ServerBuffer);
		int queueSizePackets = default(0); // max number of packets; 0 means no limit
        int queueSizeBytes @unit(bytes) = default(0 bytes);   // max number of packets; 0 means no limit
        bool emitStatsOnGlobalSignal = default(false); // added for BklgSchedApplication
        
        @signal[qlenPkts](type="long");
        @signal[qlenBytes](type="long");
        @signal[drop](type="long");
        @signal[rxBytes](type="long");
        @signal[txBytes](type="long");
}
