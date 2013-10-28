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

#ifndef MAADJUSTRATETOTHRESHOLD_H_
#define MAADJUSTRATETOTHRESHOLD_H_

#include "MessageApplication.h"

// This extension of the MessageApplication listens globally to server tx/rx signals
// and switch drop signals to periodically estimate the loss rate network wide.
// The purpose of this extension is to automatically find the maximum offered load
// that the network can support before exceeding the loss threshold.
// This functionality is only active in the first server (with address 0).
// It works by sending control messages to all other instances of this class
// residing at other servers. In response to the control message
// (UpdateSendingRateMessage.msg) a server adjusts its "maxSendRate" parameter
// which regulates the rate of traffic produced by the MessageApplication.

class FlowRecord {
public:
    FlowRecord() {
        txBytes = 0; rxBytes = 0; dropBytes = 0; stageOfLastLoss = 0;
    }
    double txBytes;
    double rxBytes;
    double dropBytes;
    uint stageOfLastLoss;
};
std::ostream& operator<<(std::ostream& os, const FlowRecord& f);

// Note: The rate is adjust in response to the rate of total traffic lost,
// not the loss rate seen by any individual flow.
class MA_AdjustRateToThreshold : public MessageApplication, public cListener
{
public:
    MA_AdjustRateToThreshold();
    virtual ~MA_AdjustRateToThreshold();
    virtual void initialize(int stage);
    virtual void handleMessage(cMessage *msg);
    virtual void handleControlMessage(ControlMessage *cmsg);

    // Listener interface
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, cObject *obj);

protected:
    // Listener related
    virtual void initializeListener();
    //virtual void requestLossReports();
    virtual simtime_t estimateDrainTime();
    virtual void checkNetworkLoss();
    virtual void autoAdjust();
    virtual void autoAdjust_UseMM1Estimation();
    virtual void autoAdjust_DecrementToFindValue();
    virtual bool isInMeasurementInterval(simtime_t);
    virtual void startMeasurement();

    cMessage *startMeasurementEvent_;
    cMessage *checkNetLossEvent_;
    typedef std::map<Flow, FlowRecord> FlowRecords;
    FlowRecords flowStats;

    // Constant values:
    bool useMaxLossFraction_;
    ulong queueSizeBytes_;
    ulong queueSizePkts_;
    simtime_t measurementInterval;
    simtime_t measurementIntervalStart;
    simtime_t measurementIntervalEnd;
    int precision_;
    // Keep track of values over the last interval:
    double avgLossFraction_;
    double maxLossFraction_;
    double avgSendingRate_;
    double avgReceiveRate_;
    double lastRateOverThreshold_;
    double lastRateUnderThreshold_;
    simsignal_t avgLossFractionSignal_;
    simsignal_t maxLossFractionSignal_;
    simsignal_t avgSendingRateSignal_;
    simsignal_t avgReceiveRateSignal_;
    simsignal_t sendingRateAdjustmentSignal_;
    simsignal_t lossMatchesMM1KwithKSignal_;
    // Keep track of across all intervals:
    //double rateExceedingThreshold_; // XXX
    //int numIntervalsStable_; // XXX
};

double mm1_pk(double rho, uint K);
uint mm1_K(double rho, double threshold);


#endif /* MAADJUSTRATETOTHRESHOLD_H_ */
