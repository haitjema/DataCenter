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
#include <time.h>
#include "DCCommon.h"
#include "DCUtilities.h"
#include "TrafficPatternGenerator.h"
#include "TrafficPatternFactory.h"

Define_Module(TrafficPatternGenerator);


TrafficPatternGenerator::TrafficPatternGenerator()
{
	FatTreeNode::initialize();
    trafficPattern = NULL;
}

void TrafficPatternGenerator::initialize()
{

    TrafficPatternFactory factory;
    const char *type = getAncestorPar("scriptGenType").stringValue();
    trafficPattern = factory.createTrafficPattern(type);
    if (!strcmp(type, "AllToAllPartition") || !strcmp(type, "AllToAllVictimTenant")) {
        uint partitionSize = getAncestorPar("scriptGenType").longValue();
        // XXX Hacky
        ((TP_AllToAllPartition*)trafficPattern)->setPartitionSize(partitionSize);
    }
}


void TrafficPatternGenerator::assignRandomStartTimes(double max_time)
{
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        simtime_t rndTime(dblrand()*max_time);
        (*i)->startTime = rndTime;
    }
}


bool TrafficPatternGenerator::scriptExists(const char *scriptFile)
{
	std::ifstream my_file(scriptFile);
	return my_file.good();
}


void TrafficPatternGenerator::generateTraffic()
{
    double messageSize = getAncestorPar("messageSize").doubleValue();
    messages = trafficPattern->createTraffic(node_id_, messageSize);
    bool randomStartTimes = getAncestorPar("randomStartTimes").boolValue();
    // Assign random start times to help desynchronize them
    if (randomStartTimes) { assignRandomStartTimes(); } // Use the default maximum time
}

AppMessageVector TrafficPatternGenerator::getMessagesForServer(uint address)
{
    AppMessageVector serverMessages;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        if ((*i)->source != address) continue;
        serverMessages.push_back(*i);
    }
    return serverMessages;
}

void TrafficPatternGenerator::writeScript(const char *scriptFile)
{
    // Create the directory tree if the file's path doesn't exist.
    if (!dirExists(fullPath(scriptFile).c_str())) {
        createDirectories(fullPath(scriptFile).c_str());
    }
    std::ofstream myfile;
    myfile.open(scriptFile);
    myfile << "# Script: " << scriptFile << endl;
    time_t rawtime; struct tm * timeinfo;
    time ( &rawtime ); timeinfo = localtime ( &rawtime );
    myfile << "# Generated at time: " << asctime(timeinfo); // For some reason asctime adds a new line so no endl needed
    myfile << "# Number of servers = " << node_id_.getNumberOfServers() << ", levels = "
           << node_id_.getDepth() << ", paths = " << node_id_.getNumberOfPaths() << endl;
    myfile << "# Message format is as follows:" << endl;
    myfile << "# <source>;<destination>;<messageNum>;<startTime>;<messageSize>;<messageRate>" << endl;
    for (AppMessageVector::const_iterator i = messages.begin(); i < messages.end(); i++) {
        myfile << (*i)->source << "; " << (*i)->destination << "; " << (*i)->messageNum << "; "
               << (*i)->startTime << " s; " << (*i)->messageSize << " bytes; " << (*i)->messageRate << " bps" << endl;
    }
    myfile.close();
}


void TrafficPatternGenerator::loadScript(const char *script, long address)
{
    LOG(DEBUG) << "Parsing script " << script << endl;
    std::string line; long lineNum = 0;
    std::ifstream scriptFile(script);
    if (scriptFile.is_open()) opp_error("Couldn't open script file %s", script);
    while ( scriptFile.good() )
    {
        AppMessage msg;
        const char *token; cDynamicExpression expression; cNEDValue value;
        std::getline(scriptFile, line); lineNum++;

        // expect line to be: <send time><time unit>; <size><byte units>
        if (!line.compare(0, 1, "#")) continue; // Ignore comment lines
        if ( line.find_first_not_of(" \t\v\r\n") ) continue; // Ignore blank lines
        cStringTokenizer tokenizer(line.c_str(), ";"); // Parse with ; as the delimeter

        // parse source
        if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: source is expected on %u", lineNum);
        token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
        msg.source = value.longValue();
        if (address != -1 && msg.source != address) continue; // Ignore messages belonging to other servers

        // parse destination
        if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: destination is expected on %u", lineNum);
        token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
        msg.destination = value.longValue();

        // parse messageNum
        if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: messageNum is expected on %u", lineNum);
        token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
        msg.messageNum = value.longValue();

        // parse startTime
        if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: start time expected on line %u", lineNum);
        token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
        msg.startTime = value.doubleValueInUnit("s");

        // parse messageSize
        if (!tokenizer.hasMoreTokens()) opp_error("syntax error in script: message size is expected on line %u", lineNum);
        token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
        msg.messageSize = value.doubleValueInUnit("bytes");

        // parse messageRate
        if (tokenizer.hasMoreTokens()) {
            token = tokenizer.nextToken(); expression.parse(token); value = expression.evaluate(this);
            msg.messageRate = value.doubleValueInUnit("bps");
        } else {
            //opp_error("syntax error in script: message rate is expected on line %u", lineNum);
            msg.messageRate = 0; // If not specified, default is no limit
        }

        // add messages to list of scheduled messages
        AppMessage *newMsg = new AppMessage; *newMsg = msg;
        messages.push_back(newMsg);
    }
    // sort the scheduled messages by start time
    std::sort(messages.begin(), messages.end(), sortByStartTime);
}

TrafficPatternGenerator::~TrafficPatternGenerator()
{
    //if (trafficPattern) { trafficPattern->deleteModule(); }
}

