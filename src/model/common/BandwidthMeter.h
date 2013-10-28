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

#ifndef BANDWIDTHMETER_H_
#define BANDWIDTHMETER_H_

// This module measures throughput and is modeled after INET's "ThruputMeter" module
// It can be dropped in and connected between modules to measure throughput on a path
// Or it can be left unconnected.

class BandwidthMeter : public cSimpleModule
{
public:
	BandwidthMeter();
	virtual ~BandwidthMeter();

	virtual void initialize();
	virtual void handleMessage(cMessage *msg);
	virtual void updateStats(simtime_t now, unsigned long bits); // Call this method if using direct method calls (tight-coupling, module is not connected)

protected:
    virtual void measureBandwidth();

protected:
    uint batchSize_;   // number of packets in a batch
    simtime_t maxInterval_; // max length of measurement interval (measurement ends
                     // if either batchSize or maxInterval is reached, whichever
                     // is reached first)

    // current measurement interval
    simtime_t intvlStartTime_;
    simtime_t intvlLastPkTime_;
    unsigned long bitsInInterval_;
    unsigned long pktsInInterval_;

    simsignal_t bandwidthSignal;
	simsignal_t packetRateSignal;

    cMessage *bandwidthMeasurementEvent;
    simtime_t bandwidthMeasureInterval_;

    cGate *inGate_, *outGate_;


};

#endif /* BANDWIDTHMETER_H_ */
