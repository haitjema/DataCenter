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
#include <fstream>
#include "DCCommon.h"
#include "DCUtilities.h"
#include "ScheduleFromFile.h"
#include "VirtualOutputQueue.h"

Define_Module(ScheduleFromFile);

bool sortByStartTime(RSMessage *msg1, RSMessage *msg2)
{ return (msg1->startTime > msg2->startTime); }

std::ostream & operator <<(std::ostream &os, const RSMessage *rsMsg)
{
    os << "Rate schedule message:\n"
       << "startTime    = " << rsMsg->startTime << "\n"
       << "source       = " << rsMsg->source << "\n"
       << "destination  = " << rsMsg->destination << "\n"
       << "rate  = " << rsMsg->rate << endl;
    return os;
}

std::ostream & operator <<(std::ostream &os, const RSMessageVector &rsMsgVec)
{
    for (RSMessageVector::const_iterator i=rsMsgVec.begin(); i != rsMsgVec.end(); ++i) { os << *(i); }
    return os;
}


ScheduleFromFile::ScheduleFromFile()
{
}

void ScheduleFromFile::initialize(int stage)
{
    SchedulingAlgorithm::initialize(stage);
    if (stage == 0) {
        // Do nothing
    } else {
        parseScript(par("rateScheduleScript"));
        startNextScheduledRate = new cMessage;
        // Schedule event to make the next RSMessage from scheduledRates active
        if (scheduledRates.size()) { scheduleAt((scheduledRates.back())->startTime, startNextScheduledRate); }
    }
}

void ScheduleFromFile::parseScript(const char *script)
{
	LOG(DEBUG) << "Parsing script " << script << endl;
	std::string line; long lineNum = 0;
    std::ifstream scriptFile(script);
    if (scriptFile.is_open())
    {
    	while ( scriptFile.good() )
    	{
    		RSMessage msg;
    	    const char *token; cDynamicExpression expression; cNEDValue value;
    		std::getline(scriptFile, line); lineNum++;

    		// expect line to be: <send time><time unit>; <size><byte units>
    		if (!line.compare(0, 1, "#")) continue; // Ignore comment lines
    		if ( line.find_first_not_of(" \t\v\r\n") ) continue; // Ignore blank lines
    		cStringTokenizer tokenizer(line.c_str(), ";"); // Parse with ; as the delimeter

            // parse startTime
            if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: start time expected on line %u", lineNum);
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.startTime = value.doubleValueInUnit("s");

    		// parse source
    		if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: source is expected on %u", lineNum);
    		token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
    		msg.source = value.longValue();
    		if (msg.source != address_) continue; // Ignore messages belonging to other servers

    		// parse destination
    		if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: destination is expected on %u", lineNum);
    		token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
    		msg.destination = value.longValue();

    		// parse rate
    		if (tokenizer.hasMoreTokens()) {
    			token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
    			msg.rate = value.doubleValueInUnit("bps");
    		} else {
	   			//opp_error("syntax error in script: message rate is expected on line %u", lineNum);
    			msg.rate = 0; // If not specified, default is no limit
    		}

    		// add messages to list of scheduled messages
    		RSMessage *newMsg = new RSMessage; *newMsg = msg;
    		scheduledRates.push_back(newMsg);
    	}

    	// sort the scheduled messages by start time
    	std::sort(scheduledRates.begin(), scheduledRates.end(), sortByStartTime);

    } else {
    	opp_error("Couldn't open script file %s", script);
    }
}


void ScheduleFromFile::handleMessage(cMessage *msg)
{
    // The start time of a new appMessage has arrived
    if (msg == startNextScheduledRate) {

        // Get the AppMessage to activate
        RSMessage *rsMsg = scheduledRates.back(); scheduledRates.pop_back();

        setScheduledRate(rsMsg);
        delete rsMsg;

        // Determine when to activate the next message
        if (scheduledRates.size()) { scheduleAt((scheduledRates.back())->startTime, startNextScheduledRate); }
    }
}

void ScheduleFromFile::setScheduledRate(RSMessage *rsMsg)
{
    VirtualOutputQueue *voq = controller_->lookupVoq(rsMsg->destination);
    if (!voq) { // no voq exists
        controller_->pktArrivedForNewDestination(rsMsg->destination); // allocate one
        voq = controller_->lookupVoq(rsMsg->destination); // check again
        if (!voq) { opp_error("Controller failed to allocate VOQ"); }
    }
    voq->setSendingRate((uint64_t)rsMsg->rate); // set VOQ rate
}

ScheduleFromFile::~ScheduleFromFile()
{
    cancelAndDelete(startNextScheduledRate);
    while (!scheduledRates.empty()) {
        RSMessage *rsMsg = scheduledRates.back(); scheduledRates.pop_back(); delete rsMsg;
    }
}
