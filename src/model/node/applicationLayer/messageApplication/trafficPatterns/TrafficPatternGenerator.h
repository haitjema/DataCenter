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

#ifndef TRAFFICPATTERNGENERATOR_H_
#define TRAFFICPATTERNGENERATOR_H_

#include "FatTreeNode.h"
#include "TrafficPattern.h"

#define DEF_MAX_START (10.0/(1000*1000)) // 10 microseconds

class TrafficPatternGenerator : public FatTreeNode {
public:
    TrafficPatternGenerator();
    virtual ~TrafficPatternGenerator();
    virtual void initialize();
    //virtual void createTrafficPattern(string TrafficPatternType); // Factory method
    virtual bool scriptExists(const char *scriptFile);
    virtual void writeScript(const char *scriptFile);
    virtual void loadScript(const char *scriptFile, long address=-1);
    virtual AppMessageVector getMessagesForServer(uint address);
    virtual void generateTraffic();
protected:
    virtual void assignRandomStartTimes(double max_time=DEF_MAX_START);
    //virtual void parseScriptForSource(const char *script, uint address);
    TrafficPattern *trafficPattern;
    AppMessageVector messages;
};

#endif /* TRAFFICPATTERNGENERATOR_H_ */
