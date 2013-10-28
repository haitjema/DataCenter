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
#include "MAAdjustRateToThreshold.h"
#include "UpdateSendingRateMessage_m.h"
#include "ServerPortQueue.h"
#include "SwitchPortQueue.h"


uint mm1_K(double rho, double threshold)
{
    double pk = threshold;
    if (rho == 1) { return (uint)ceil((rho - pk)/pk); }
    uint K = (uint)ceil(log(pk/(1 - rho + pk*rho)) / log(rho));
    return K;
}

double mm1_pk(double rho, uint K)
{
    if (rho == 1) {
        return 1/(K+1.0);
    } else {
        return ((1-rho)*pow(rho, K))/(1 - pow(rho, K+1));
    }
}

std::ostream& operator<<(std::ostream& os, const FlowRecord& f) {
    os << "f.TX=" << f.txBytes << ", f.RX=" << f.rxBytes << ", f.dropBytes=" << f.dropBytes;
    os << ", loss=" << (f.txBytes-f.rxBytes)/f.txBytes << ", unacct=" << f.txBytes-(f.rxBytes + f.dropBytes);
    os << ", stageOfLastLoss=" << f.stageOfLastLoss;
    return os;
}

MA_AdjustRateToThreshold::MA_AdjustRateToThreshold()
{
    checkNetLossEvent_ = NULL;
    startMeasurementEvent_ = NULL;
    measurementInterval = 0;
    measurementIntervalStart = MAXTIME;
    measurementIntervalEnd = MAXTIME;
    precision_ = 0;
    queueSizeBytes_ = 0;
    queueSizePkts_ = 0;
    avgLossFraction_ = 0.0;
    maxLossFraction_ = 0.0;
    avgSendingRate_ = 0.0;
    avgReceiveRate_ = 0.0;
    lastRateOverThreshold_ = 1.0;
    lastRateUnderThreshold_ = 0.0;
}

void MA_AdjustRateToThreshold::initialize(int stage)
{
    MessageApplication::initialize(stage);
    LOG(DEBUG) << endl;
    if (stage == 0) {
        WATCH(maxSendRate_);
        WATCH_MAP(flowStats);
        sendingRateAdjustmentSignal_ = registerSignal("sendingRateAdjustment");
    } else if (stage == (numInitStages()-1)) {
        // Only the first host should send control the rates
        if ((node_id_.getAddress() == 0) && par("enableAutoAdjust").boolValue()) { initializeListener(); }
        useMaxLossFraction_ = par("useMaxLossFraction");
    }
}

void MA_AdjustRateToThreshold::initializeListener()
{
    LOG(DEBUG) << endl;
    WATCH(maxSendRate_); // Declared in parent but make sure to watch here
    WATCH(avgLossFraction_);
    WATCH(maxLossFraction_);
    WATCH(avgSendingRate_);
    WATCH(avgReceiveRate_);
    WATCH(lastRateOverThreshold_);
    WATCH(lastRateUnderThreshold_);
    //WATCH(rateExceedingThreshold_); // XXX
    //WATCH(numIntervalsStable_); // XXX
    // Find the default queue size in bytes and pkts defined for the network
    cModule *parent = getParentModule(); while (!parent->getProperties()->get("isNetwork")) { parent = parent->getParentModule(); }
    queueSizeBytes_ = parent->par("DefaultQueueSizeBytes").longValue();
    queueSizePkts_ = parent->par("DefaultQueueSizePkts").longValue();
    measurementInterval = par("checkNetworkLossInterval");
    precision_ = par("precision").longValue();
    simulation.getSystemModule()->subscribe("dropPktPtr", this);
    simulation.getSystemModule()->subscribe("rxPacketPtr", this);
    simulation.getSystemModule()->subscribe("txPacketPtr", this);
    avgSendingRateSignal_ = registerSignal("avgSendingRate");
    avgReceiveRateSignal_ = registerSignal("avgReceiveRate");
    avgLossFractionSignal_ = registerSignal("avgLossFraction");
    maxLossFractionSignal_ = registerSignal("maxLossFraction");
    lossMatchesMM1KwithKSignal_ = registerSignal("lossMatchesMM1KwithK");
    startMeasurementEvent_ = new cMessage();
    checkNetLossEvent_ = new cMessage();
    // Schedule first measurement to begin right after the warmup period
    scheduleAt(simTime() + simulation.getWarmupPeriod(), startMeasurementEvent_);
}

void MA_AdjustRateToThreshold::handleMessage(cMessage *msg)
{
    if (msg->isScheduled()) opp_error("Received message that is still on the event queue!");
    if (msg == startMeasurementEvent_) {
        startMeasurement();
    } else if (msg == checkNetLossEvent_) {
        checkNetworkLoss();
        autoAdjust();
    } else {
        MessageApplication::handleMessage(msg);
    }
}

void MA_AdjustRateToThreshold::handleControlMessage(ControlMessage *cmsg)
{
    UpdateSendingRateMessage* usrm = check_and_cast<UpdateSendingRateMessage*>(cmsg);
    LOG(DEBUG) << "Received UpdateSendingRateMessage, updating send rate from " << maxSendRate_ << " to " << usrm->getSendingRate() << endl;
    maxSendRate_ = usrm->getSendingRate();
    updateSendRates();
    emit(sendingRateAdjustmentSignal_, maxSendRate_/linkRate_);
    delete cmsg; cmsg = NULL;
}

simtime_t MA_AdjustRateToThreshold::estimateDrainTime()
{
    // Estimate how long it will take all the packets sent in a measurement interval
    // to be drained from the network. Based on the maximum queueing delay.
    uint maxHops = 2*node_id_.getDepth() - 1;
    // If no value for queueSizeBytes or queueSizePkts then default to the measurement interval
    if (!queueSizeBytes_ && !queueSizePkts_) { return measurementInterval; }
    double maxQueueBytes = (queueSizeBytes_) ? queueSizeBytes_ : queueSizePkts_*ETHER_MAX_SEG_SIZE;
    double maxQueueDelay = maxQueueBytes*BITS_PER_BYTE/getLinkRate();
    double transDelay = ETHER_MAX_SEG_SIZE*BITS_PER_BYTE/getLinkRate();
    double maxDelay = maxHops*maxQueueDelay + (maxHops+1)*transDelay;
    simtime_t drainTime(maxDelay);
    return drainTime;
}

void MA_AdjustRateToThreshold::startMeasurement()
{
    // Clear previous values:
    flowStats.clear();
    // The following don't need to be cleared since they will be set in checkNetworkLoss
    // avgLossFraction_, maxLossFraction_, avgSendingRate_, avgReceiveRate_
    measurementIntervalStart = simTime();
    measurementIntervalEnd = measurementIntervalStart + measurementInterval;
    // Schedule event to check loss giving enough time for packets sent but not
    // received during the interval to be counted.
    scheduleAt(measurementIntervalEnd + estimateDrainTime(), checkNetLossEvent_);
}

bool MA_AdjustRateToThreshold::isInMeasurementInterval(simtime_t time)
{
    return ((measurementIntervalStart <= time) && (time <= measurementIntervalEnd));
}

void MA_AdjustRateToThreshold::receiveSignal(cComponent *source, simsignal_t signalID, cObject *obj)
{
    //if (strcmp(source->getOwner()->getName(), "port_queue")) { return; }
    if (typeid(*source) == typeid(SwitchPortQueue)) {
        DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket*>(obj);
        if (!isInMeasurementInterval(pkt->getTimestamp())) return;
        Flow flow; flow.src = pkt->getSrcAddr(); flow.dst = pkt->getDestAddr();
        FlowRecords::iterator it = flowStats.find(flow);
        SwitchPortQueue *spq = check_and_cast<SwitchPortQueue*>(source);
        if (it == flowStats.end()) { FlowRecord fr; fr.rxBytes = 0; fr.txBytes = 0; fr.dropBytes = 0; flowStats[flow] = fr; }
        flowStats[flow].dropBytes += pkt->getByteLength();
        flowStats[flow].stageOfLastLoss = spq->getStage();
        return;
    } else if (typeid(*source) != typeid(ServerPortQueue)) { return; }
    ServerPortQueue *spq = (ServerPortQueue *)source;

    DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket*>(obj);
    if ( isInMeasurementInterval(pkt->getTimestamp()) ) {
        Flow flow; flow.src = pkt->getSrcAddr(); flow.dst = pkt->getDestAddr();
        FlowRecords::iterator it = flowStats.find(flow);
        if (it == flowStats.end()) { FlowRecord fr; fr.rxBytes = 0; fr.txBytes = 0; fr.dropBytes = 0; flowStats[flow] = fr; }
        //if (!strcmp(getSignalName(signalID), "rxPacketPtr")) {
        if (signalID == spq->rxPacketPtrSignal_) {
            flowStats[flow].rxBytes += pkt->getByteLength();
        //} else if (!strcmp(getSignalName(signalID), "txPacketPtr")) {
        } else if (signalID == spq->txPacketPtrSignal_) {
            flowStats[flow].txBytes += pkt->getByteLength();
        } else {
            opp_error("MA_AdjustToThreshold::receiveSignal(cComponent *source, "
                      "simsignal_t signalID, cObject *obj): Unexpected signal received!");
        }
    }
}

void MA_AdjustRateToThreshold::checkNetworkLoss()
{
    avgLossFraction_ = 0; maxLossFraction_ = 0; avgSendingRate_ = 0; avgReceiveRate_ = 0;
    for (FlowRecords::iterator it = flowStats.begin(); it != flowStats.end(); it++) {
        FlowRecord fr = it->second;
        Flow flow; flow = it->first;
        double loss; //= ((double)(fr.txBytes - fr.rxBytes)) / ((double)(fr.txBytes));
        if (!fr.txBytes) loss = 0;
        else loss = fr.dropBytes / fr.txBytes;
        avgLossFraction_ += loss;
        if (loss >= 1.0) {
            // XXX Note: we can easily get a high loss rate with uniform packet spacing and fixed packet sizes
            // This is because flows can synch up so only one flow get its packets dropped when a queue fills
            LOG(ERROR) << "Loss rate of 1!" << endl; // XXX
        }
        maxLossFraction_ = (loss > maxLossFraction_) ? loss : maxLossFraction_;
        avgSendingRate_ += ( ((double)fr.txBytes) / measurementInterval.dbl() );
        avgReceiveRate_ += ( ((double)fr.rxBytes) / measurementInterval.dbl() );
    }
    avgLossFraction_ = avgLossFraction_/flowStats.size();
    avgSendingRate_ = avgSendingRate_/flowStats.size();
    avgReceiveRate_ = avgReceiveRate_/flowStats.size();

    emit(avgLossFractionSignal_, avgLossFraction_);
    emit(maxLossFractionSignal_, maxLossFraction_);
    emit(avgSendingRateSignal_, avgSendingRate_);
    emit(avgReceiveRateSignal_, avgReceiveRate_);

    // Schedule next measurement event and disable measurement in the meantime
    measurementIntervalStart = MAXTIME;
    measurementIntervalEnd = MAXTIME;
    // Measurement interval effectively also determines the warmup time before
    // a new measurement interval begins.
    scheduleAt(simTime() + measurementInterval, startMeasurementEvent_);
}

void MA_AdjustRateToThreshold::autoAdjust()
{
    if (par("useMM1K_estimation").boolValue()) {
        autoAdjust_UseMM1Estimation();
    } else {
        autoAdjust_DecrementToFindValue();
    }
}

double estimateHighestRateThatUnderThreshold(uint K, double lossThreshold, uint precision=3)
{
    // This is a quick, dirty dirty method to find the value of rho.
    // Use the specified number of decimal places when 0 < rho < 1.
    double rho = 0;
    double highestRateUnder = rho;
    double step = 1.0/pow(10,precision);
    for (rho = 0.0; rho < 1; rho += step) {
        if (mm1_pk(rho, K) >= lossThreshold) { return highestRateUnder; }
        highestRateUnder = rho;
    }
    return highestRateUnder;
}

void MA_AdjustRateToThreshold::autoAdjust_UseMM1Estimation()
{
    double lossThreshold = par("lossThreshold").doubleValue();
    //double rateAjustVal = 0.01; // Work in increments/decrements of 1% of link rate
    double rateAjustVal = 1.0/pow(10, precision_); // increment/decrement determined by precision par
    double oldRate = maxSendRate_/linkRate_;
    double newRate = oldRate;

    double lossObserved;
    if (!useMaxLossFraction_) {
        // We're using the loss averaged across all flows rather than the max loss of any flow
        lossObserved = avgLossFraction_;
    } else {
        lossObserved = maxLossFraction_;
    }

    if (lossObserved > lossThreshold) {
        /*if (oldRate <= lastRateUnderThreshold_ + rateAjustVal) {
            lastRateUnderThreshold_ = lastRateUnderThreshold_/2;
        }*/
        lastRateOverThreshold_ = newRate;
    } else {
        /*if (oldRate >= lastRateOverThreshold_ - rateAjustVal) {
            lastRateOverThreshold_ += rateAjustVal;
        }*/
        lastRateUnderThreshold_ = newRate;
    }

    if (!lossObserved) {
        // If no loss observed, set queue size to just below max queue length observed.
        newRate = 1; // Set to max
    } else {
        // Use the observed loss to estimate the value of the rate we should send at.
        // Estimate the K value needed to produce the loss observed on a
        // single M/M/1/K queue with traffic intensity rho = current send rate.
        uint K = mm1_K(oldRate, lossObserved);
        emit(lossMatchesMM1KwithKSignal_, K);
        newRate = estimateHighestRateThatUnderThreshold(K, lossThreshold, precision_);
    }
    if ((newRate >= lastRateOverThreshold_ && oldRate <= lastRateUnderThreshold_) ||
        (newRate <= lastRateUnderThreshold_ && oldRate >= lastRateOverThreshold_)) {
        // MM1K estimation didn't give a good estimate so just use a divide and conquer strategy
        newRate = (lastRateOverThreshold_ + lastRateUnderThreshold_)/2;
    }
    // Make sure the new value of rate is between the largest value known to exceed the
    // threshold and the smallest value known not to.
    newRate = std::min(newRate, lastRateOverThreshold_ - rateAjustVal);
    newRate = std::max(newRate, lastRateUnderThreshold_ + rateAjustVal); // Order is important here

    // Note the 0.99 is just a quick fix to deal with floating point accuracy causing the comparison to return false when the values are equal
    if (0.99*(lastRateOverThreshold_ - lastRateUnderThreshold_) <= rateAjustVal) {
        newRate = oldRate;
    }


    if (newRate != oldRate) {
        if (newRate < 0) { opp_error("MessageApplication::checkNetworkLoss(): newRate is less than 0!"); }
        UpdateSendingRateMessage *cmsg = new UpdateSendingRateMessage();
        cmsg->setSendingRate(newRate*linkRate_);
        sendControlMessageToSameModuleInAllServers(cmsg);
        // These will be handled by handleControlMessage()
        //updateSendRates();
        //emit(sendingRateAdjustmentSignal_, maxSendRate_);
    } else {
        emit(sendingRateAdjustmentSignal_, lastRateUnderThreshold_);
        endSimulation();
    }
}


void MA_AdjustRateToThreshold::autoAdjust_DecrementToFindValue()
{
    double lossThreshold = par("lossThreshold").doubleValue();
    //double rateAjustVal = 0.01; // Work in increments/decrements of 1% of link rate
    double rateAjustVal = 1.0/pow(10, precision_); // increment/decrement determined by precision par
    double oldRate = maxSendRate_/linkRate_;
    double newRate = oldRate;

    // We're using the loss averaged across all flows rather than the max loss of any flow
    double lossObserved;
    if (!useMaxLossFraction_) {
        // We're using the loss averaged across all flows rather than the max loss of any flow
        lossObserved = avgLossFraction_;
    } else {
        lossObserved = maxLossFraction_;
    }

    if (lossObserved > lossThreshold) {
        lastRateOverThreshold_ = newRate;
        newRate -= rateAjustVal;
    } else {
        lastRateUnderThreshold_ = newRate;
        newRate += rateAjustVal;
    }
    newRate = std::min(newRate, lastRateOverThreshold_ - rateAjustVal);
    newRate = std::max(newRate, lastRateUnderThreshold_ + rateAjustVal);
    if ((lastRateOverThreshold_ - lastRateUnderThreshold_) <= rateAjustVal) {
        // For safety, don't think this condition should happen...
        // but we should be done if there is no room between the upper and lower bound.
        newRate = oldRate;
    }
    if (newRate != oldRate) {
        UpdateSendingRateMessage *cmsg = new UpdateSendingRateMessage();
        cmsg->setSendingRate(newRate*linkRate_);
        sendControlMessageToSameModuleInAllServers(cmsg);
        // These will be handled by handleControlMessage()
        //updateSendRates();
        //emit(sendingRateAdjustmentSignal_, maxSendRate_);
    } else {
        emit(sendingRateAdjustmentSignal_, lastRateUnderThreshold_);
        endSimulation();
    }
}


MA_AdjustRateToThreshold::~MA_AdjustRateToThreshold()
{
    // Unsubscribe listeners
    unsubscribe("dropPktPtr", this);
    unsubscribe("rxPacketPtr", this);
    unsubscribe("txPacketPtr", this);
    cancelAndDelete(startMeasurementEvent_);
    cancelAndDelete(checkNetLossEvent_);
}

Define_Module(MA_AdjustRateToThreshold);
