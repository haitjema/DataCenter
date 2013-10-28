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
#include "ActiveMessage.h"
#include "MessageApplication.h" // XXX

Define_Module(ActiveMessage);
Register_Class(ActiveMessageQueue);


std::ostream & operator <<(std::ostream &os, const ActiveMessage *actMsg)
{
    os << "Active message = " << actMsg->appMsg
       << "Message state:" << "\n"
       << "nextSendTime              = " << actMsg->nextSendTime << "\n"
       << "allowedRate               = " << actMsg->allowedRate << "\n"
       << "bytesSent                 = " << actMsg->bytesSent  << "\n";
    return os;
}

inline int compareSendTime(cObject *actMsg1, cObject *actMsg2)
{
    // The front of the queue contains the highest priority.
    simtime_t_cref t1 = ((ActiveMessage *)actMsg1)->getNextSendTime();
    simtime_t_cref t2 = ((ActiveMessage *)actMsg2)->getNextSendTime();
    if (t1 == t2) return 0;
    // We want the lowest nextSendTime to be the highest priority.
    // We need to return a value greater than zero if priority of arg1
    // is greater than priority of arg2.
    // XXX It seems that OMNeT's code is wrong, if I follow what they say,
    // then higher priority packets move to the back of the queue.
    return (t1 > t2) ? 1 : -1;
}


ActiveMessageQueue::ActiveMessageQueue() : cQueue(NULL, compareSendTime)
{
    setTakeOwnership(false);
}

ActiveMessageQueue::~ActiveMessageQueue()
{
    //clear();
}

void ActiveMessageQueue::clear()
{
    /*
    while (!empty()) {
        ActiveMessage *actMsg = check_and_cast<ActiveMessage *>(front());
        remove(actMsg);
        //drop(actMsg);
        take(actMsg);
        actMsg->deleteModule();
    }
    cQueue::clear();*/
}

ActiveMessage::ActiveMessage()
{
    // XXX
    //opp_error("don't call this constructor");
}

// XXX
/*
ActiveMessage::ActiveMessage(AppMessage *appMsg, double linkRate) : linkRate(linkRate)
{
    this->appMsg = appMsg;
    nextSendTime = simTime(); // Allow the first segment to be sent immediately
    // The burst counter will be updated when a segment is sent. Thus, sending
    // the first segment will effectively be treated as the end of the first burst.
    burstCounter = 0;
    allowedRate = 0;
    bytesSent = 0;
    avgPayloadSize_ = 0;
    randomInterArrival = false;
    burstyTraffic = false;
    burstyInjectionRate = 0;
    avgBurstLen_ = 0;
    avgTimeBetweenBursts_ = 0;
}*/

void ActiveMessage::initialize()
{
    nextSendTime = simTime(); // Allow the first segment to be sent immediately
    // The burst counter will be updated when a segment is sent. Thus, sending
    // the first segment will effectively be treated as the end of the first burst.
    burstCounter = 0;
    allowedRate = 0;
    bytesSent = 0;
    avgPayloadSize_ = 0;
    randomInterArrival = false;
    burstyTraffic = false;
    burstyInjectionRate = 0;
    avgBurstLen_ = 0;
    avgTimeBetweenBursts_ = 0;
    WATCH(allowedRate);
    WATCH(bytesSent);
    WATCH(linkRate);
    WATCH(burstCounter);
    WATCH(avgPayloadSize_);
    WATCH(randomInterArrival);
    WATCH(burstyTraffic);
    WATCH(burstyInjectionRate);
    WATCH(avgBurstLen_);
    WATCH(avgTimeBetweenBursts_);
    WATCH(nextSendTime);
    // XXX
    parent_ = getParentModule();
    linkRate = ((MessageApplication *)parent_)->getLinkRate();
    //sendNextMessageEvent_->setContextPointer(this);
    sendNextMessageEvent_ = new cMessage();
    scheduleAt(nextSendTime, sendNextMessageEvent_);
}

void ActiveMessage::handleMessage(cMessage *msg)
{
    if (msg == sendNextMessageEvent_) {
        if (!isFinished()) ((MessageApplication *)parent_)->sendNextSegment(this);
        if (isFinished()) {
            cancelAndDelete(sendNextMessageEvent_); sendNextMessageEvent_ = NULL;
        } else {
            scheduleAt(nextSendTime, sendNextMessageEvent_);
        }
    } else {
        opp_error("ActiveMessage::handleMessage() Unknown message!");
    }
}

void ActiveMessage::getNextSegment(DCN_UDPPacket *segment)
{
    long bytesLeft = (long)(appMsg->messageSize - bytesSent);
    if (!bytesLeft) { opp_error("Message is finished"); }
    segment->setDestAddr(appMsg->destination);

    // Determine size of next segment
    // XXX TODO Finish generalizing
    long segmentSize = std::min(bytesLeft, (long)segment->getPayload());//MAX_UDP_PAYLOAD);
    segment->setPayloadLengthBytes(segmentSize);
    bytesSent += segmentSize;

    LOG(DEBUG) << "Sending segment of payload " << segment->getPayload() << " to server " << segment->getDestAddr() << endl;

    if (allowedRate) {
        nextSendTime = computeNextSendTime(segment);
    } else {
        LOG(DEBUG) << "No rate limit, send next segment immediately";
        nextSendTime = simTime();
    }
}


void ActiveMessage::computeBurstParameters()
{
    double bitsPerBurst;
    double burstsPerSecond;
    if (!allowedRate) {
        // Only need to calculate burst parameters if a rate is set.
        return;
    }
    double desiredAvgRate = allowedRate;
    if (avgBurstLen_) {
        bitsPerBurst = avgBurstLen_ * burstyInjectionRate * linkRate;
        // desiredAvgRate = bitsPerBurst*burstsPerSecond
        burstsPerSecond = desiredAvgRate / bitsPerBurst;
        // 1/(avgTimeBetweenBursts + avgBurstLen_) = burstsPerSecond
        avgTimeBetweenBursts_ = 1/(burstsPerSecond) - avgBurstLen_;
        //opp_error("avgTimeBetweenBursts_ = %f", avgTimeBetweenBursts_);
    } else if (avgTimeBetweenBursts_) {
        if (((burstyInjectionRate*linkRate/desiredAvgRate) - 1) <= 0) {
            avgBurstLen_ = 0; // prevent division by zero
        } else {
            avgBurstLen_ = avgTimeBetweenBursts_/((burstyInjectionRate*linkRate/desiredAvgRate) - 1);
        }
        //opp_error("avgBurstLen_ = %f, avgTimeBetweenBursts_=%f, burstyInjectionRate=%f, linkRate=%f, desiredAvgRate=%f", avgBurstLen_, avgTimeBetweenBursts_, burstyInjectionRate, linkRate, desiredAvgRate);
    }
}

simtime_t ActiveMessage::computeNextSendTime(DCN_UDPPacket *segment)
{
    double r = allowedRate;
    double r1 = burstyInjectionRate*linkRate;
    double curPktSizeBits = segment->getBitLength();
    double avgPktSizeBytes = (segment->getOverheadBytes() + avgPayloadSize_);
    if (avgPktSizeBytes < DCN_MIN_PACKET_SIZE) { avgPktSizeBytes = DCN_MIN_PACKET_SIZE; }
    double avgPktSizeBits = avgPktSizeBytes*BITS_PER_BYTE;
    //double avgPktSizeBits = (avgPayloadSize_ + UDP_OVERHEAD)*BITS_PER_BYTE; XXX this was wrong, use getOverheadBytes

    LOG(DEBUG) << "Message's allowed rate r = " << r << " curPktSizeBits = " << curPktSizeBits << " avgPktSizeBits = " << avgPktSizeBits << endl;

    // If we don't want bursty traffic...
    if ( (!avgBurstLen_) && (!avgTimeBetweenBursts_) ) {
        // Determine message's next send time
        double spacing = (randomInterArrival) ? exponential(avgPktSizeBits/r) : curPktSizeBits/r;
        if (!randomInterArrival) {
            LOG(DEBUG) << "Traffic is not bursty, spacing is uniform = " << spacing << endl;
        } else {
            LOG(DEBUG) << "Traffic is not bursty, spacing is random = " << spacing << endl;
        }
        return (allowedRate) ? simTime() + spacing : simTime();
    }

    LOG(DEBUG) << "Burst counter before = " << burstCounter << endl;
    burstCounter -= (long)curPktSizeBits; // in bytes not bits
    LOG(DEBUG) << "Burst counter after = " << burstCounter << endl;
    if (burstCounter <= 0) {
        // - OFF state: send nothing until start of next burst state
        // Determine the length of the next burst
        double lenOfNextBurst;
        if (avgBurstLen_ <= 0) {
            simtime_t maxt = MAXTIME;
            lenOfNextBurst = maxt.dbl();
        } else {
            lenOfNextBurst = exponential(avgBurstLen_);
        }
        long bitsInNextBurst = (long)(lenOfNextBurst*r1);
        burstCounter += bitsInNextBurst;
        simtime_t timeUntilNextBurst = (avgTimeBetweenBursts_ < 0) ? 0 : exponential(avgTimeBetweenBursts_);
        // Schedule message to begin at start of next burst
        simtime_t startTimeOfNextBurst = simTime() + timeUntilNextBurst;
        LOG(DEBUG) << "Bursty Off State: lenOfNextBurst = " << lenOfNextBurst << " bitsInNextBurst = " << bitsInNextBurst << " startTimeOfNextBurst = " << startTimeOfNextBurst << endl;
        return startTimeOfNextBurst;
    } else {
        // - ON state:
        double spacing = (randomInterArrival) ? exponential(avgPktSizeBits/r1) : curPktSizeBits/r1;
        if (!randomInterArrival) {
            LOG(DEBUG) << "Bursty ON State:, spacing is uniform = " << spacing << endl;
        } else {
            LOG(DEBUG) << "Bursty ON State:, spacing is random = " << spacing << endl;
        }
        return simTime() + spacing;
    }
}


/*simtime_t ActiveMessage::computeNextSendTime(DCN_UDPPacket *segment)
{
    double r = allowedRate;
    double curPktSizeBits = segment->getBitLength();
    double avgPktSizeBits = (avgPayloadSize_ + UDP_OVERHEAD)*BITS_PER_BYTE;

    // XXX TEMP
    // If this is server 350 sending to 181
    if (this->appMsg->destination == 181) {
        LOG(DEBUG) << this->appMsg->source << endl;
    }

    LOG(DEBUG) << "Message's allowed rate r = " << r << " curPktSizeBits = " << curPktSizeBits << " avgPktSizeBits = " << avgPktSizeBits << endl;

    // If we don't want bursty traffic...
    if ( (!avgBurstLen_) && (!avgTimeBetweenBursts_) ) {
        // Determine message's next send time
        double spacing = (randomInterArrival) ? exponential(avgPktSizeBits/r) : curPktSizeBits/r;
        if (!randomInterArrival) {
            LOG(DEBUG) << "Traffic is not bursty, spacing is uniform = " << spacing << endl;
        } else {
            LOG(DEBUG) << "Traffic is not bursty, spacing is random = " << spacing << endl;
        }
        return (allowedRate) ? simTime() + spacing : simTime();
    }

    // Use two-state bursty traffic generator:
    // Inspired by Principles and Practices of Interconnection Networks (pg. 477)
    // r = r1*alpha/(alpha + beta)
    // r = desired send rate
    // r1 = injection rate
    // alpha = probability of transitioning from off to on
    // beta = probability of transitioning from on to off
    // Average burst length = 1/beta
    // Average time between bursts = 1/alpha
    double r1 = burstyInjectionRate*linkRate;
    LOG(DEBUG) << "burstyInjectionRate = " << burstyInjectionRate << " r1 = " << r1 << endl;
    LOG(DEBUG) << "avgTimeBetweenBursts_ = " << avgTimeBetweenBursts_ << " avgBurstLength = " << avgBurstLen_ << endl;
    double alpha, beta;
    if (avgBurstLen_) {
        // Calculate alpha
        beta = 1/avgBurstLen_;
        alpha = beta/((r1/r) - 1);
        LOG(DEBUG) << "Traffic is bursty, burstLength specified, alpha = " << alpha << " beta = " << beta << endl;
    } else if (avgTimeBetweenBursts_) {
        // Calculate beta
        alpha = 1/avgTimeBetweenBursts_;
        beta = (r1*alpha)/r - alpha;
        LOG(DEBUG) << "Traffic is bursty, timeBetweenBursts, specified, alpha = " << alpha << " beta = " << beta << endl;
    }

    LOG(DEBUG) << "Burst counter before = " << burstCounter << endl;
    burstCounter -= curPktSizeBits; // in bytes not bits
    LOG(DEBUG) << "Burst counter after = " << burstCounter << endl;
    if (burstCounter <= 0) {
        // - OFF state: send nothing until start of next burst state
        // Determine the length of the next burst
        double lenOfNextBurst = exponential(1/beta);
        long bitsInNextBurst = lenOfNextBurst*r1;
        burstCounter += bitsInNextBurst;
        // Schedule message to begin at start of next burst
        simtime_t startTimeOfNextBurst = exponential(1/alpha);
        LOG(DEBUG) << "Bursty Off State: lenOfNextBurst = " << lenOfNextBurst << " bitsInNextBurst = " << bitsInNextBurst << " startTimeOfNextBurst = " << startTimeOfNextBurst << endl;
        return simTime() + startTimeOfNextBurst;
    } else {
        // - ON state:
        double spacing = (randomInterArrival) ? exponential(avgPktSizeBits/r1) : curPktSizeBits/r1;
        if (!randomInterArrival) {
            LOG(DEBUG) << "Bursty ON State:, spacing is uniform = " << spacing << endl;
        } else {
            LOG(DEBUG) << "Bursty ON State:, spacing is random = " << spacing << endl;
        }
        return simTime() + spacing;
    }
}
*/

// Getters and setters

const simtime_t &ActiveMessage::getNextSendTime() const
{
    return nextSendTime;
}

void ActiveMessage::setNextSendTime(simtime_t nextSendTime)
{
    this->nextSendTime = nextSendTime;
}

double ActiveMessage::getDesiredRate() const
{
    return appMsg->messageRate;
}

double ActiveMessage::getAllowedRate() const
{
    return allowedRate;
}

void ActiveMessage::setAllowedRate(double allowedRate)
{
    this->allowedRate = allowedRate;
    computeBurstParameters();
}

bool ActiveMessage::isFinished() const
{
    if (((MessageApplication*)parent_)->sendTimeLimitReached()) return true;
    return (bytesSent >= appMsg->messageSize);
}

double ActiveMessage::getAvgBurstLen() const
{
    return avgBurstLen_;
}

double ActiveMessage::getAvgPayloadSize() const
{
    return avgPayloadSize_;
}

double ActiveMessage::getAvgTimeBetweenBursts() const
{
    return avgTimeBetweenBursts_;
}

double ActiveMessage::getBurstyInjectionRate() const
{
    return burstyInjectionRate;
}

bool ActiveMessage::isBurstyTraffic() const
{
    return burstyTraffic;
}

bool ActiveMessage::isRandomInterArrival() const
{
    return randomInterArrival;
}

void ActiveMessage::setAvgBurstLen(double avgBurstLen)
{
    avgBurstLen_ = avgBurstLen;
    computeBurstParameters();
}

void ActiveMessage::setAvgPayloadSize(double avgPacketSize)
{
    this->avgPayloadSize_ = avgPacketSize;
}

void ActiveMessage::setAvgTimeBetweenBursts(double avgTimeBetweenBursts)
{
    avgTimeBetweenBursts_ = avgTimeBetweenBursts;
    computeBurstParameters();
}

void ActiveMessage::setBurstyInjectionRate(double burstyInjectionRate)
{
    this->burstyInjectionRate = burstyInjectionRate;
}

void ActiveMessage::setBurstyTraffic(bool burstyTraffic)
{
    this->burstyTraffic = burstyTraffic;
}

void ActiveMessage::setRandomInterArrival(bool randomInterArrival)
{
    this->randomInterArrival = randomInterArrival;
}

ActiveMessage::~ActiveMessage()
{
    cancelAndDelete(sendNextMessageEvent_); sendNextMessageEvent_ = NULL;
    delete appMsg;
}
