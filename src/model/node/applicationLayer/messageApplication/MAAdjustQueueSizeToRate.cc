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
#include "MAAdjustQueueSizeToRate.h"
#include "UpdateQueueSizeMessage_m.h"
#include "SwitchPortQueue.h"

MA_AdjustQueueSizeToRate::MA_AdjustQueueSizeToRate()
{
    lastK_underThrehsold = 0;
    lastK_overThreshold = 0;
    maxQlenBytes_ = 0;
    maxQlenPkts_ = 0;
}

void MA_AdjustQueueSizeToRate::initializeListener()
{
    MA_AdjustRateToThreshold::initializeListener();
    simulation.getSystemModule()->subscribe("switchQlenBytes", this);
    simulation.getSystemModule()->subscribe("switchQlenPkts", this);
    updateQueueSizeBytesSignal = registerSignal("updateQueueSizeBytes");
    updateQueueSizePktsSignal = registerSignal("updateQueueSizePkts");
    maxQlenBytesSignal_ = registerSignal("maxQlenBytes");
    maxQlenPktsSignal_ = registerSignal("maxQlenPkts");
    lossMatchesMM1KwithRhoSignal = registerSignal("lossMatchesMM1KwithRho");
    lastK_underThrehsold = (ulong)-1;
    lastK_overThreshold = 0;
    WATCH(lastK_underThrehsold);
    WATCH(lastK_overThreshold);
    // These were defined in MA_AdjustRateToThreshold but was assumed to be static
    WATCH(queueSizeBytes_);
    WATCH(queueSizePkts_);
    WATCH(maxQlenBytes_);
    WATCH(maxQlenPkts_);

    // Assume enabling auto adjust with both queueSizeBytes and queueSizePkts to 0 is a mistake
    if (!queueSizeBytes_ && !queueSizePkts_ && par("enableAutoAdjust").boolValue()) {
        opp_error("MA_AdjustQueueSizeToRate::initialize() I assume you didn't mean to "
                  "set enableAutoAdjust = true with queueSizeBytes == queueSizePkts == 0.");
    }
}

void MA_AdjustQueueSizeToRate::handleControlMessage(ControlMessage *cmsg)
{
    opp_error("MA_AdjustQueueSizeToRate::handleControlMessage(ControlMessage *cmsg)"
              " Unexpected control message received.");
    delete cmsg;
}

void MA_AdjustQueueSizeToRate::receiveSignal(cComponent *source, simsignal_t signalID, unsigned long l)
{
    if (!isInMeasurementInterval(simTime())) { return; }

    SwitchPortQueue *spq = check_and_cast<SwitchPortQueue*>(source);
    // Because queue sizes can be a multiple of what is set (e.g. queues in logical tree)
    // The value should be scaled accordingly.
    uint scale = 1;
    if (queueSizeBytes_) {
        scale = (spq->getQueueSizeBytes()/queueSizeBytes_);
    } else if (queueSizePkts_) {
        scale = (spq->getQueueSizePkts()/queueSizePkts_);
    }
    //if (!strcmp(getSignalName(signalID), "switchQlenBytes")) {
    if (signalID == spq->qlenBytesSignal) {
        ulong qBytes = l/scale;
        maxQlenBytes_ = (qBytes > maxQlenBytes_) ? qBytes : maxQlenBytes_;
    } else if (signalID == spq->qlenPktsSignal) {
    //} else if (!strcmp(getSignalName(signalID), "switchQlenPkts")) {
        ulong qPkts = l/scale;
        maxQlenPkts_ = (qPkts > maxQlenPkts_) ? qPkts : maxQlenPkts_;
    } else {
        opp_error("MA_AdjustRateToThreshold::receiveSignal(cComponent *source, "
                  "simsignal_t signalID, unsigned long l): Unexpected signal received.");
    }
}

void MA_AdjustQueueSizeToRate::startMeasurement()
{
    maxQlenBytes_ = 0; maxQlenPkts_ = 0;
    MA_AdjustRateToThreshold::startMeasurement();
}

void MA_AdjustQueueSizeToRate::checkNetworkLoss()
{
    emit(maxQlenBytesSignal_, maxQlenBytes_);
    emit(maxQlenPktsSignal_, maxQlenPkts_);
    MA_AdjustRateToThreshold::checkNetworkLoss();
}



double behavesLikeMM1KwithRho(double lossObserved, uint K, uint precision=5)
{
    // This is a quick, dirty dirty method to find the value of rho.
    // The precision is 3 decimal places when 0 < rho < 0.8.
    // Use the specified number of decimal places when 0.8 < rho < 1.
    double rho = 0;
    for (rho = 0.001; rho < 0.8; rho += 0.001) {
        if (mm1_K(rho, lossObserved) >= K) { return rho; }
    }
    double step = 1.0/pow(10,precision);
    for (rho = 0.8; rho < 1; rho += step) {
        if (mm1_K(rho, lossObserved) >= K) { return rho; }
    }
    return rho;
}

// XXX
/*
void MA_AdjustQueueSizeToRate::autoAdjust()
{
    if (par("useMM1K_estimation").boolValue()) {
        autoAdjust_UseMM1Estimation();
    } else {
        autoAdjust_DecrementToFindValue();
    }
}*/

void MA_AdjustQueueSizeToRate::autoAdjust_UseMM1Estimation()
{
    // This approach uses both the maximum queue length and the loss observed to guide
    // the value of K (queue size) to the value where it exceeds the loss threshold.
    // If no loss was observed, we use the max. queue size.
    // Otherwise, we model the network as a single M/M/1/K queue and find the traffic
    // intensity, rho, that would cause the same degree of loss that we observed.
    // We can use this to calculate the value of K needed given the loss threshold.
    double lossThreshold = par("lossThreshold").doubleValue();
    ulong newK_value = queueSizePkts_;
    ulong adjustK = 1;

    // For this technique, we need to work in terms of packets.
    // If no packet limit specified, convert byte values to packets based on avg pkt size.
    if (queueSizeBytes_) {
        if (!queueSizePkts_) { queueSizePkts_ = (ulong)(queueSizeBytes_ / getAvgPayload()); }
        queueSizeBytes_ = 0; // Disable the queue size limit in terms of bytes
    }

    double lossObserved;
    if (useMaxLossFraction_) {
        lossObserved = maxLossFraction_;
    }  else {
        lossObserved = avgLossFraction_;
    }
    if (lossObserved <= lossThreshold) {
        lastK_underThrehsold = std::min(queueSizePkts_, lastK_underThrehsold);
    } else {
        lastK_overThreshold = std::max(queueSizePkts_, lastK_overThreshold);
    }
    if (!lossObserved) {
        // If no loss observed, set queue size to just below max queue length observed.
        newK_value = (maxQlenPkts_ > adjustK) ? maxQlenPkts_ : adjustK;
    } else {
        // Use the observed loss to estimate the value of the queue size we should use.
        ulong K = queueSizePkts_;
        // Estimate the traffic intensity needed to produce the loss observed on a
        // single M/M/1/K queue with capacity K.
        double rho = behavesLikeMM1KwithRho(lossObserved, K, precision_);
        emit(lossMatchesMM1KwithRhoSignal, rho);
        // Using this value, estimate the queue size needed to stay under the threshold.
        ulong est_K = mm1_K(rho, lossThreshold);
        newK_value = est_K;
    }
    if ((newK_value >= lastK_underThrehsold && queueSizePkts_ <= lastK_overThreshold) ||
        (newK_value <= lastK_overThreshold && queueSizePkts_ >= lastK_underThrehsold)) {
        // MM1K estimation didn't give a good estimate so just use a divide and conquer strategy
        newK_value = (lastK_underThrehsold + lastK_overThreshold)/2;
    }
    // Make sure the new value of K is between the largest value known to exceed the
    // threshold and the smallest value known not to.
    newK_value = std::min(newK_value, lastK_underThrehsold - adjustK);
    newK_value = std::max(newK_value, lastK_overThreshold + adjustK); // Order is important here
    if ((lastK_underThrehsold - lastK_overThreshold) <= adjustK) {
        // For safety, don't think this condition should happen...
        // but we should be done if there is no room between the upper and lower bound.
        newK_value = queueSizePkts_;
    }

    // If the new queue size is the same, we have tested all the values we need.
    if (newK_value == queueSizePkts_) {
        // The last K value not to exceed the threshold is what we were looking for
        emit(updateQueueSizePktsSignal, lastK_underThrehsold);
        endSimulation();
    } else {
        // Begin using the new value of K
        queueSizePkts_ = newK_value;
        emit(updateQueueSizePktsSignal, queueSizePkts_);
        UpdateQueueSizeMessage *cmsg = new UpdateQueueSizeMessage();
        cmsg->setQueueSizeBytes(queueSizeBytes_);
        cmsg->setQueueSizePkts(queueSizePkts_);
        broadcastToSwitches(cmsg);
    }
}

void MA_AdjustQueueSizeToRate::autoAdjust_DecrementToFindValue()
{
    double lossThreshold = par("lossThreshold").doubleValue();
    double queueAdjustValBytes = ETHER_MAX_SEG_SIZE; // Work in increments/decrements of 1 MSS
    double queueAdjustValPkts = 1;

    double newQueueSizeBytes = queueSizeBytes_; // XXX Probably should have made these ulong instead of double to be consistent.
    double newQueueSizePkts = queueSizePkts_;

    // In general, to determine if loss exceeded the threshold, we should use the maxLossFraction_
    // I.e. the maximum loss experienced by any flow.
    // However, we have to make an exception for the all-to-all traffic pattern, which we use
    // to compare with the M/M/1 analysis.
    // The reason is that with each flow sending at just 1/n, the measurement interval has to be enormous
    // in order to get a stable estimate of loss.
    // This is particularly true when using poisson sending process because a given queue can grow/shrink on
    // leading to periods of high loss lasting for relatively large periods of time (10s-100s of ms).
    // For this reason, we use the avgLossFraction with this case.
    bool overThreshold;
    std::string scriptGenType = par("scriptGenType");
    if ((scriptGenType == "AllToAll") && randomInterArrival_) {
        overThreshold = (avgLossFraction_ > lossThreshold);
    } else {
        overThreshold = (maxLossFraction_ > lossThreshold);
    }

    // The procedure is simple, shrink the queue size until we exceed the threshold
    // The last adjust queue size emitted is the value we are looking for
    // Note: this value will be in the range [queueAdjustVal, initial queue size]
    if (overThreshold) {
        endSimulation();
    } else {
        if (queueSizeBytes_)  {
            newQueueSizeBytes = std::min(maxQlenBytes_, queueSizeBytes_) - queueAdjustValBytes;
            emit(updateQueueSizeBytesSignal, newQueueSizeBytes);
            if (newQueueSizeBytes < queueAdjustValBytes) { endSimulation(); }
        }
        if (queueSizePkts_ )  {
            newQueueSizePkts = std::min(maxQlenPkts_, queueSizePkts_) - queueAdjustValPkts;
            emit(updateQueueSizePktsSignal, newQueueSizePkts);
            if (newQueueSizePkts < queueAdjustValPkts) { endSimulation(); }
        }
        UpdateQueueSizeMessage *cmsg = new UpdateQueueSizeMessage();
        cmsg->setQueueSizeBytes((ulong)newQueueSizeBytes);
        cmsg->setQueueSizePkts((ulong)newQueueSizePkts);
        broadcastToSwitches(cmsg);
    }
    queueSizeBytes_ = (ulong)newQueueSizeBytes;
    queueSizePkts_ = (ulong)newQueueSizePkts;
}

MA_AdjustQueueSizeToRate::~MA_AdjustQueueSizeToRate()
{
    unsubscribe("switchQlenBytes", this);
    unsubscribe("switchQlenPkts", this);
    // MA_AdjustRateToThreshold destructor should take care of everything else
}

Define_Module(MA_AdjustQueueSizeToRate);
