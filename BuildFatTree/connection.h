/*
 *  connection.h
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/24/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef CONNECTION_H_
#define CONNECTION_H_

// XXX No longer need this
enum CONNECTION_TYPE {
	ETH_1_GBPS,
	ETH_10_GBPS
};

// Default link rate in bps
#define DEFAULT_DATARATE    (1*GBPS)
// Default link delay in nanoseconds
#define DEFAULT_DELAY       (0*NS)

std::string datarateNedStr(ulong datarate);
std::string delayNedStr(double delay);

class Connection
{
public:
	Connection(const std::string &type, EthPort *, EthPort *, ulong datarate_=DEFAULT_DATARATE, double delay=DEFAULT_DELAY);
	virtual ~Connection();
	
	void PrintNed();
	
private:
	std::string type_;
	EthPort *port1_;
	EthPort *port2_;
    ulong datarate_;
    double delay_;
};

#endif // CONNECTION_H_
