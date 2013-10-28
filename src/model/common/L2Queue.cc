//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

#include "DCCommon.h"
#include "L2Queue.h"


L2Queue::L2Queue()
{
    endTransmissionEvent = NULL;
}

void L2Queue::initialize(int stage)
{
    LOG(DEBUG) << typeid(this).name() << "(stage=" << stage << ")" << endl;
    if (stage == 0)
    {
        // Do this in stage 0 so that we have a way to skip this if
        // we dynamically instantiate the queues from within another module
        // E.g. for FastSwitchPortQueue

        // Store references to gates for efficiency so that we don't have to keep looking them up
        in_ = gate("in");
        out_ = gate("out");
        line_in_ = gate("line$i");
        line_out_ = gate("line$o");
        transmissionChannel_ = line_out_->getTransmissionChannel();

        // XXX
        useL2L2DirectMessageSending_ = par("useL2L2DirectMessageSending").boolValue();
        if (useL2L2DirectMessageSending_) {
            lineOutDest_ = check_and_cast<L2Queue*>(line_out_->getPathEndGate()->getOwnerModule());
        }

    // XXX TEMP: disabled the else here so that I could get the l2queue working again
    //} else {
        queue.setName("queue");
        endTransmissionEvent = new cMessage("endTxEvent");

        queueSizeBytes = par("queueSizeBytes");
        queueSizePkts = par("queueSizePackets");


        desynchronizeJitterValue = NULL;
        // XXX LEFT OFF HERE ... this logic doesn't work when I set this to a random variable in a config file
        if (par("desynchronizeWithJitter").boolValue()) {
            desynchronizeJitterValue = &par("desynchronizeJitterValue");
        }
        desynchronizeWithPriority = par("desynchronizeWithPriority").boolValue();
        //qlenPktsSignal = registerSignal("qlenPkts");
        //qlenBytesSignal = registerSignal("qlenBytes");
        //busySignal = registerSignal("busy");
        //queueingTimeSignal = registerSignal("queueingTime");
        //dropSignal = registerSignal("drop");
        //txBytesSignal = registerSignal("txBytes");
        //rxBytesSignal = registerSignal("rxBytes");
        // XXX
        // Name of the signals set by a parameter so that switch and server queues can have the option of specify differnt signal names
        // which can be useful if you want to define a statistic at the network layer to capture all signals from a given component
        qlenPktsSignal = registerSignal(par("qlenPktsSignalName"));
        qlenBytesSignal = registerSignal(par("qlenBytesSignalName"));
        busySignal = registerSignal(par("busySignalName"));
        queueingTimeSignal = registerSignal(par("queueingTimeSignalName"));
        dropSignal = registerSignal(par("dropSignalName"));
        txBytesSignal = registerSignal(par("txBytesSignalName"));
        rxBytesSignal = registerSignal(par("rxBytesSignalName"));
        dropPktSignal = registerSignal("dropPkt"); // Always emit this, this is used by modules that listen for lost packets

        statsOnSignal = par("emitStatsOnGlobalSignal");
        if (statsOnSignal) simulation.getSystemModule()->subscribe("EmitStats", this);

        sim_time_limit_ = par("simTimeLimit");
        // Simple way to disable the check on sim_time_limit, set to max time when not specified
        if (sim_time_limit_ == 0) { sim_time_limit_ = MAXTIME; }

        emit(qlenPktsSignal, (ulong)queue.length());
        emit(qlenBytesSignal, (ulong)queue.getByteLength());
        emit(busySignal, 0);
    }
}

void L2Queue::handleMessageDirectLineIn(cMessage *msg)
{
    Enter_Method("Received msg via direct method call");
    take(msg); // XXX Necessary?
    // Pretend like the message arrived on the line_in gate
    msg->setArrival(this, line_in_->getId()); // XXX This right?
    // And handle it normally
    handleMessage(msg);
}

void L2Queue::startTransmitting(DCN_EthPacket *pkt)
{
    if (ev.isGUI()) displayStatus(true);

    // XXX I could probably just do this in ServerPortQueue for efficiency, doesn't seem to matter a lot
    if (desynchronizeWithPriority) { pkt->setSchedulingPriority(intrand(32767)); }

    if IN_MEASUREMENT_INTERVAL(pkt) {
        if (!statsOnSignal) {
            emit(txBytesSignal, (long)pkt->getByteLength());
        } else {
            intvlTxBytes_.push_back((long)pkt->getByteLength());
        }
    }

    /*if (useL2L2DirectMessageSending_) {
        lineOutDest_->handleMessageDirectLineIn(pkt);
    }*/

    // If desynchronizeWithJitter, send the packet with the delay given by the jitterValue parameter
    if (desynchronizeJitterValue == NULL) {
    	send(pkt, line_out_);
    } else {
    	sendDelayed(pkt, *desynchronizeJitterValue, line_out_);
    }

    // Schedule an event for the time when last bit will leave the gate.
    //simtime_t endTransmission = transmissionChannel_->getTransmissionFinishTime();
    scheduleAt(transmissionChannel_->getTransmissionFinishTime(), endTransmissionEvent);
}

void L2Queue::finishTransmitting()
{
    DCN_EthPacket *pkt;
    // Transmission finished, we can start next one.
    //EV << "Queue transmission finished.\n";
    if (ev.isGUI()) displayStatus(false);
    if (queue.empty()) {
        emit(busySignal, 0);
    } else {
    	pkt = dequeue();
    	if IN_MEASUREMENT_INTERVAL(pkt) {
    	    if (!statsOnSignal) {
    	        emit(queueingTimeSignal, simTime() - pkt->getTimestamp());
    	        emit(qlenPktsSignal, (ulong)queue.length());
    	        emit(qlenBytesSignal, (ulong)queue.getByteLength());
    	    } else {
    	        intvlQueueSizePkts_.push_back((ulong)queue.length());
    	        intvlQueueSizeBytes_.push_back((ulong)queue.getByteLength());
    	    }
    	}
        startTransmitting(pkt);
    }
}

void L2Queue::dropPacket(DCN_EthPacket *pkt)
{
    if IN_MEASUREMENT_INTERVAL(pkt) {
        if (!statsOnSignal) {
            emit(dropSignal, (long)pkt->getByteLength());
        } else {
            intvlQueueDrops_.push_back((long)pkt->getByteLength());
        }
    }
    emit(dropPktSignal, pkt); // Always emit this signal
    delete pkt;
}

void L2Queue::passUpwards(cMessage *msg)
{
    send(msg, out_);
}

void L2Queue::handleMessage(cMessage *msg)
{
    DCN_EthPacket *pkt;

    if (msg==endTransmissionEvent)
    {
    	finishTransmitting();
    //else if (msg->arrivedOn(line_in_->getId())) // XXX why not use (msg->getArrivedGate() == line_in__)
    }else if (msg->getArrivalGate() == line_in_)
    {
        // pass up
    	//EV << "Queue is passing packet up to router\n";
    	if (msg->isPacket()) {
    	    pkt = check_and_cast<DCN_EthPacket *>(msg);
    	    if IN_MEASUREMENT_INTERVAL(pkt) {
    	        if (!statsOnSignal) {
    	            emit(rxBytesSignal, (long)pkt->getByteLength());
    	        } else {
    	            intvlRxBytes_.push_back((long)pkt->getByteLength());
    	        }
    	    }
    	}

        //send(msg, out_);
        passUpwards(msg);
    }
    else // arrived on gate "in"
    {
    	// If it's not a packet, assume it's a control message
    	if (!msg->isPacket()) {
    		LOG(DEBUG) << "Received a control message, sending immediately out line_out" << endl;
    		// simply forward it out line_out_
    		cChannel *channel = line_out_->getTransmissionChannel();
    		if (channel->isBusy()) {
    		    simtime_t ftime = channel->getTransmissionFinishTime();
    		    channel->forceTransmissionFinishTime(simTime());
    		    send(msg, line_out_);
    		    channel->forceTransmissionFinishTime(ftime);
    		} else {
    		    send(msg, line_out_);
    		}
    	} else {

			pkt = check_and_cast<DCN_EthPacket *>(msg);
			//EV << "Queue received packet from router\n";
			if (endTransmissionEvent->isScheduled())
			{
				// We are currently busy, so just queue up the packet.
				if ( (queueSizePkts && queue.length()>=queueSizePkts) ||
					 (queueSizeBytes && ( (queue.getByteLength() + pkt->getByteLength()) > queueSizeBytes)) )
				{
					//EV << "Received " << msg << " but transmitter busy and queue full: discarding\n";
					dropPacket(pkt);
				}
				else
				{
					//EV << "Received " << msg << " but transmitter busy: queueing up\n";
					// msg->setTimestamp(); // XXX
                    if IN_MEASUREMENT_INTERVAL(pkt) {
                        if (!statsOnSignal) {
                            emit(qlenPktsSignal, (ulong)queue.length());
                            emit(qlenBytesSignal, (ulong)queue.getByteLength());
                        } else {
                            intvlQueueSizePkts_.push_back((ulong)queue.length());
                            intvlQueueSizeBytes_.push_back((ulong)queue.getByteLength());
                        }
                    }
				    enqueue(pkt);
				}
			}
			else
			{
				// We are idle, so we can start transmitting right away.
				//EV << "Received " << msg << endl;
			    if IN_MEASUREMENT_INTERVAL(pkt) {
			        emit(queueingTimeSignal, 0.0);
			        emit(busySignal, 1);
			    }
				startTransmitting(pkt);
			}
    	}
    }
}

inline void L2Queue::enqueue(DCN_EthPacket *pkt)
{
    queue.insert(pkt);
}

inline DCN_EthPacket *L2Queue::dequeue()
{
    return (DCN_EthPacket*)queue.pop();
}

void L2Queue::displayStatus(bool isBusy)
{
    getDisplayString().setTagArg("t",0, isBusy ? "transmitting" : "idle");
    getDisplayString().setTagArg("i",1, isBusy ? (queue.length()>=3 ? "red" : "yellow") : "");
}

void L2Queue::receiveSignal(cComponent *source, simsignal_t signalID, long l)
{
    emitStats();
}

void L2Queue::emitStats()
{
    // Emit average values over the interval
    emit(qlenPktsSignal, sum(intvlQueueSizePkts_)); // XXX May not be what we want...
    emit(qlenBytesSignal, sum(intvlQueueSizeBytes_)); // ...would need to sample-hold to get time-avg
    emit(dropSignal, sum(intvlQueueDrops_)); // (bytes not count)
    emit(txBytesSignal, sum(intvlTxBytes_));
    emit(rxBytesSignal, sum(intvlRxBytes_));
    // Clear the stats for the next round
    intvlQueueSizePkts_.clear();
    intvlQueueSizeBytes_.clear();
    intvlQueueDrops_.clear();
    intvlTxBytes_.clear();
    intvlRxBytes_.clear();
}


L2Queue::~L2Queue()
{
    if (statsOnSignal) unsubscribe("EmitStats", this);
    cancelAndDelete(endTransmissionEvent); endTransmissionEvent = NULL;
}

Define_Module(L2Queue);

