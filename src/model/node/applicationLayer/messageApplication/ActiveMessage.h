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

#ifndef ACTIVEMESSAGE_H_
#define ACTIVEMESSAGE_H_

#include "AppMessage.h"

class ActiveMessage;

class ActiveMessage : public cSimpleModule
{
public:
    ActiveMessage(); // Don't use
    //ActiveMessage(AppMessage *appMsg, double linkRate);
    virtual void handleMessage(cMessage *msg); // XXX
    virtual void initialize();
    virtual ~ActiveMessage();
    void getNextSegment(DCN_UDPPacket *segment);
    const simtime_t &getNextSendTime() const;
    void setNextSendTime(simtime_t nextSendTime);
    double getAllowedRate() const;
    void setAllowedRate(double allowedRate);
    double getDesiredRate() const;
    bool isFinished() const;
    double getAvgBurstLen() const;
    double getAvgPayloadSize() const;
    double getAvgTimeBetweenBursts() const;
    double getBurstyInjectionRate() const;
    bool isBurstyTraffic() const;
    bool isRandomInterArrival() const;
    void setAvgBurstLen(double avgBurstLen);
    void setAvgPayloadSize(double avgPacketSize);
    void setAvgTimeBetweenBursts(double avgTimeBetweenBursts);
    void setBurstyInjectionRate(double burstyInjectionRate);
    void setBurstyTraffic(bool burstyTraffic);
    void setRandomInterArrival(bool randomInterArrival);
    void setAppMsg(AppMessage *appMsg) { this->appMsg = appMsg; } // XXX
protected:
    void computeBurstParameters();
    simtime_t computeNextSendTime(DCN_UDPPacket *segment);
    friend std::ostream & operator <<(std::ostream& , const ActiveMessage*);
protected:
    AppMessage *appMsg;
    cMessage *sendNextMessageEvent_; // XXX
    const cMessage *getSendMessageEvent() { return sendNextMessageEvent_; } // XXX
    cModule *parent_; // XXX
    simtime_t nextSendTime;
    double allowedRate;
    double bytesSent;
    double linkRate;
    int burstCounter;
    // Traffic parameters
    double avgPayloadSize_;
    bool randomInterArrival;
    bool burstyTraffic;
    double burstyInjectionRate;
    double avgBurstLen_;
    double avgTimeBetweenBursts_;
};

inline int compareSendTime(cObject *actMsg1, cObject *actMsg2);


class ActiveMessageQueue : public cQueue {
    public:
    ActiveMessageQueue();
    ~ActiveMessageQueue();
    void clear();
};


#endif /* ACTIVEMESSAGE_H_ */
