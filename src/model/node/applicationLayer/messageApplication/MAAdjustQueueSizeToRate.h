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

#ifndef MAADJUSTQUEUESIZETORATE_H_
#define MAADJUSTQUEUESIZETORATE_H_

#include "MAAdjustRateToThreshold.h"

class MA_AdjustQueueSizeToRate : public MA_AdjustRateToThreshold
{
public:
    MA_AdjustQueueSizeToRate();
    virtual ~MA_AdjustQueueSizeToRate();
    //virtual void handleMessage(cMessage *msg);
    virtual void handleControlMessage(ControlMessage *cmsg);
    virtual void receiveSignal(cComponent *source, simsignal_t signalID, unsigned long l);

protected:
    virtual void initializeListener();
    //virtual void autoAdjust(); // XXX
    virtual void checkNetworkLoss();
    virtual void startMeasurement();
    virtual void autoAdjust_UseMM1Estimation();
    virtual void autoAdjust_DecrementToFindValue();
    ulong lastK_underThrehsold;
    ulong lastK_overThreshold;
    simsignal_t lossMatchesMM1KwithRhoSignal;

    simsignal_t updateQueueSizeBytesSignal;
    simsignal_t updateQueueSizePktsSignal;
    simsignal_t maxQlenBytesSignal_;
    simsignal_t maxQlenPktsSignal_;
    ulong maxQlenBytes_;
    ulong maxQlenPkts_;
};

#endif /* MAADJUSTQUEUESIZETORATE_H_ */
