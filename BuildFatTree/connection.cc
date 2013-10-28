/*
 *  connection.cpp
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/24/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"
#include "connection.h"


std::string datarateNedStr(ulong datarate)
{
    std::ostringstream datarateStr;
    if (datarate%GBPS == 0) {
        datarateStr << datarate/GBPS << " Gbps";
    } else if (datarate%MBPS == 0) {
        datarateStr << datarate/MBPS << " Mbps";
    } else if (datarate%KBPS == 0) {
        datarateStr << datarate/KBPS << " Kbps";
    } else {
        datarateStr << datarate << " bps";
    }
    return datarateStr.str();
}

std::string delayNedStr(double delay)
{
    std::ostringstream delayStr;
    if (delay == ceil(delay/MS)*MS) {
        delayStr << delay/MS <<"ms";
    } else if (delay == ceil(delay/US)*US) {
        delayStr << delay/US <<"us";
    } else if (delay == ceil(delay/NS)*NS) {
        delayStr << delay/NS <<"ns";
    } else {
        delayStr << delay <<"s";
    }
    return delayStr.str();
}

Connection::Connection(const std::string &type, EthPort *port1, EthPort *port2, ulong datarate, double delay)
: type_(type), port1_(port1), port2_(port2), datarate_(datarate), delay_(delay)
{
	log << "Connection::Connection(uint type, EthPort *port1, EthPort *port2, ulong datarate)" << endl;
}

void Connection::PrintNed()
{
	EthNode* node1 = port1_->get_node();
	EthNode* node2 = port2_->get_node();
	cout << "     " << node1->NedPort(port1_->get_port_number());
    cout << " <--> DCLink { datarate=" << datarateNedStr(datarate_) << "; delay=" << delayNedStr(delay_) << "; } <--> ";
	cout << node2->NedPort(port2_->get_port_number()) << ";" << endl;
}

Connection::~Connection()
{
	log << "Connection::~Connection()\n";
}
