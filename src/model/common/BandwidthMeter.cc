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

#include "DCCommon.h"
#include "BandwidthMeter.h"

Define_Module(BandwidthMeter);

BandwidthMeter::BandwidthMeter() : bandwidthMeasurementEvent(NULL)
{

}

void BandwidthMeter::initialize()
{
	LOG(DEBUG) << endl;
    long _batchSize = par("bandwidthMeasurementBatchSize");
    if((_batchSize < 0) || (((long)(unsigned int)_batchSize) != _batchSize))
        throw cRuntimeError("invalid 'batchSize=%ld' parameter at '%s' module",_batchSize, getFullPath().c_str());
    batchSize_ = (unsigned int)_batchSize;
    maxInterval_ = par("maxBandwidthMeasureInterval");

	bitsInInterval_ = pktsInInterval_ = 0;
	intvlStartTime_ = intvlLastPkTime_ = 0;

    WATCH(pktsInInterval_);
    WATCH(bitsInInterval_);

	inGate_ = gate("in");
	outGate_ = gate("out");

	bandwidthMeasureInterval_ = par("bandwidthMeasureInterval");
    bandwidthSignal = registerSignal(par("bandwidthSignalName"));
    packetRateSignal = registerSignal(par("packetRateSignalName"));

    if (hasListeners(bandwidthSignal) && (bandwidthMeasureInterval_ != 0)) {
    	bandwidthMeasurementEvent = new cMessage();
    	scheduleAt(bandwidthMeasureInterval_, bandwidthMeasurementEvent);
    }
}

void BandwidthMeter::handleMessage(cMessage *msg)
{
	if (msg == bandwidthMeasurementEvent) {
		measureBandwidth();
		scheduleAt(simTime() + bandwidthMeasureInterval_, bandwidthMeasurementEvent);
	} else {
		// Message came on input gate
		if (msg->isPacket()) updateStats(simTime(), ((cPacket*)msg)->getBitLength());
		send(msg, outGate_);
	}
}

void BandwidthMeter::measureBandwidth()
{
	simtime_t now = simTime();
	simtime_t duration = now - intvlStartTime_;

    // record measurements
    double bitsPerSec = bitsInInterval_/duration.dbl();
    double pktsPerSec = pktsInInterval_/duration.dbl();

    cTimestampedValue bps(intvlStartTime_, bitsPerSec);
    cTimestampedValue pps(intvlStartTime_, pktsPerSec);
	emit(bandwidthSignal, &bps);
	emit(packetRateSignal, &pps);


	// Reset statistics
	pktsInInterval_ = bitsInInterval_ = 0;
    intvlStartTime_ = now;
}

void BandwidthMeter::updateStats(simtime_t now, unsigned long bits)
{
	Enter_Method("updateStats");

    // packet should be counted to new interval
    if (pktsInInterval_ >= batchSize_ || now - intvlStartTime_ >= maxInterval_)
        measureBandwidth();

	bitsInInterval_ += bits;
	pktsInInterval_++;
	intvlLastPkTime_ = simTime();
}

BandwidthMeter::~BandwidthMeter()
{
	cancelAndDelete(bandwidthMeasurementEvent);
}
