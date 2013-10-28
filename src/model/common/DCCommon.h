#ifndef _DC_COMMON_H_
#define _DC_COMMON_H_

#include <stdlib.h>
#include <math.h>

#include <stdio.h> // XXX necessary?
#include <string.h> // XXX necessary?

#include <ostream> // XXX necessary?
#include <sstream>
#include <iostream>
#include <string>
#include <vector>
#include <deque>
#include <algorithm>

#include <omnetpp.h>
#include "DCN_EthPacket.h"
#include "DCN_IPPacket.h"
#include "DCN_TCPPacket.h"
#include "DCN_UDPPacket.h"

typedef unsigned int uint;
typedef std::string string;
typedef std::stringstream sstring;


namespace DC
{
    template <typename T> T min(const T a, const T b) { return (a < b) ? a : b; }
    template <typename T> T max(const T a, const T b) { return (a < b) ? b : a; }
    template <typename T> T mean(std::vector<T> &vec) { if (!vec.size()) return 0;
        T tot = 0; for (uint i = 0; i < vec.size(); i++) { tot += vec[i]; }
        return tot/((T)vec.size());
    }
    template <typename T> T sum(std::vector<T> &vec) {
        T tot = 0; for (uint i = 0; i < vec.size(); i++) { tot += vec[i]; } return tot;
    }
    inline bool approx_equal(double x, double y) {
       const double EPSILON = 1E-14;
       if (x == 0) return fabs(y) <= EPSILON;
       if (y == 0) return fabs(x) <= EPSILON;
       return fabs(x - y) / max(fabs(x), fabs(y)) <= EPSILON;
    }
    inline bool approx_gte(double x, double y) {
        return ((x > y) || approx_equal(x, y));
    }
    inline bool approx_lte(double x, double y) {
        return ((x < y) || approx_equal(x, y));
    }
    inline bool approx_lt(double x, double y) {
        return (!approx_gte(x, y));
    }
    inline bool approx_gt(double x, double y) {
        return (!approx_lte(x, y));
    }

}
using namespace DC;

#define endl "\n"

//  Macro used to print the name of the current object and method
#define EVF EV << this->getFullPath() << "::" << __func__ << "(): "

enum {
	ERROR,
	WARN,
	INFO,
	VERBOSE,
	DEBUG,
	LOUD
};

#define LOG_LEVEL DEBUG

#define LOG(level) if (level <= LOG_LEVEL) EVF

#define LOG_ERROR LOG(ERROR) << " Error! "
// Note: opp_error works is an OMNeT++ macro that takes a printf style argument and can aid in debugging (see 6.1.8 in the manual)


// XXX remove all DEBUG conditionals
//#define DEBUG

#define BITS_PER_BYTE 8
#define GBPS 1000000000


#define ERROR_CHECKING

union Flow {
    uint64 raw_value;
    struct {
      uint64 src:32;
      uint64 dst:32;
    };
};

std::ostream& operator<<(std::ostream& os, const Flow& f);
bool operator==(const Flow& a, const Flow& b);
bool operator!=(const Flow& a, const Flow& b);
bool operator<(const Flow& a, const Flow& b);
bool operator>(const Flow& a, const Flow& b);
std::string flowName(const Flow flow);


typedef std::vector<uint> TenantServers;

#endif // _DC_COMMON_H_
