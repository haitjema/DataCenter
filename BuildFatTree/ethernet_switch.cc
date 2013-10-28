/*
 *  ethernet_switch.cpp
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/18/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"
#include "ethernet_switch.h"


std::string bytesNedStr(ulong bytes)
{
    std::ostringstream bytesStr;
    if (bytes%GiB == 0) {
        bytesStr << bytes/GiB <<"GiB";
    } else if (bytes%MiB == 0) {
        bytesStr << bytes/MiB <<"MiB";
    } else if (bytes%KiB == 0) {
        bytesStr << bytes/KiB <<"KiB";
    } else {
        bytesStr << bytes <<"bytes";
    }
    return bytesStr.str();
}

// ------------------------------------------------------------------------------
// Ethernet Switch
// ------------------------------------------------------------------------------

EthSwitch::EthSwitch(uint number_of_up_link_ports, uint number_of_down_link_ports, const SubTreeID& switch_id, uint depth, uint index) :
EthNode(switch_id, number_of_up_link_ports + number_of_down_link_ports, depth),
number_of_up_link_ports_(number_of_up_link_ports), number_of_down_link_ports_(number_of_down_link_ports), index_(index)
{
	log << "EthSwitch::EthSwitch(" << number_of_up_link_ports << ", "
			 << number_of_down_link_ports << ", " << switch_id << ")" << endl;
}

bool EthSwitch::is_up_link_port(uint port_number)
{
	// ports [0, number_of_uplink_ports_] are up-link ports
	if (port_number >= number_of_up_link_ports_) {
		return false;
	}
	return true;
}
bool EthSwitch::is_down_link_port(uint port_number)
{
	// ports [number_of_uplink_ports_, number_of_uplink_ports_+number_of_down_link_ports_ - 1] are down-link ports
	if ( (port_number < number_of_up_link_ports_) || (port_number >= number_of_up_link_ports_ + number_of_down_link_ports_) ) {
		return false;
	}
	return true;
}


EthPort *EthSwitch::get_up_link_port(uint up_link_port_number)
{
	if (up_link_port_number >= number_of_up_link_ports_) {
		cerr << "EthSwitch::get_up_link_port(): Invalid port number " << up_link_port_number << "!\n";
		return NULL;	
	}
	
	// ports [0, number_of_uplink_ports_] are up-link ports
	return get_port(up_link_port_number);
}

EthPort *EthSwitch::get_down_link_port(uint down_link_port_number)
{
	if (down_link_port_number >= number_of_down_link_ports_) {
		cerr << "EthSwitch::get_down_link_port(): Invalid port number " << down_link_port_number << "!\n";
		return NULL;
	}
	 
	// ports [number_of_uplink_ports_, number_of_uplink_ports_+number_of_down_link_ports_ - 1] are down-link ports
	return get_port(number_of_up_link_ports_ + down_link_port_number);
}


void EthSwitch::PrintNedParameters()
{
	cout << indent() << indent() << indent() << "switch_id = \"" << *this << "\";" << endl;
	cout << indent() << indent() << indent() << "depth = " << depth_ << ";" << endl;
	cout << indent() << indent() << indent() << "sub_tree_id = " << node_id_.getAddress() << ";" << endl;
	//cout << indent() << indent() << indent() << "path_mask = " << node_id_.get_path_bit_mask() << ";" << endl;
	//cout << indent() << indent() << indent() << "path_shift = " << node_id_.get_path_bit_shift() << ";" << endl;
	//cout << indent() << indent() << indent() << "sub_tree_mask = " << node_id_.get_sub_tree_bit_mask() << ";" << endl;
	//cout << indent() << indent() << indent() << "sub_tree_shift = " << node_id_.get_sub_tree_bit_shift() << ";" << endl;
	//cout << indent() << indent() << indent() << "route_down_mask = " << node_id_.get_level_id_bit_mask(node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_down_shift = " << node_id_.get_level_id_bit_shift(node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_up_mask = " << node_id_.get_level_id_bit_mask(node_id_.get_n() - node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_up_shift = " << node_id_.get_level_id_bit_shift(node_id_.get_n() - node_id_.get_depth()) << ";" << endl;
    PrintNedQueueParameters();
}

void EthSwitch::PrintNedQueueParameters()
{
    cout << indent() << indent() << indent() << "upPortQueueSizePkts = DefaultQueueSizePkts; " << endl;
    cout << indent() << indent() << indent() << "upPortQueueSizeBytes = DefaultQueueSizeBytes; " << endl;
    cout << indent() << indent() << indent() << "downPortQueueSizePkts = DefaultQueueSizePkts; " << endl;
    cout << indent() << indent() << indent() << "downPortQueueSizeBytes = DefaultQueueSizeBytes; " << endl;
}

void EthSwitch::PrintNedGates()
{
	cout << indent() << indent() << indent() << "down_port[" << number_of_down_link_ports_ << "];" << endl;
	cout << indent() << indent() << indent() << "up_port[" << number_of_up_link_ports_ << "];" << endl;
}

std::string EthSwitch::NedPort(uint port_number)
{
	std::ostringstream oss;
	oss << getString();
	if (is_down_link_port(port_number)) {
		oss << ".down_port[" << port_number - number_of_up_link_ports_ << "]";
	} else if (is_up_link_port(port_number)) {
		oss << ".up_port[" << port_number << "]";
	} else {
		cerr << "EthSwitch::NedPort(uint port_number): Invalid port number " << port_number << "!\n";
	}
	return oss.str();
}

std::string EthSwitch::getString() const
{
	std::ostringstream oss;
	oss << get_type();
	for (uint i = 0; i < depth_; i++) {
		oss << "_" << node_id_.getLevelID(i);
	}
	oss << "_i" << index_;
	return oss.str();
}

EthSwitch::~EthSwitch()
{
	log << "EthSwitch::~EthSwitch() " << *this << endl;
}

LogicalSwitch::LogicalSwitch(uint number_of_up_link_ports, uint number_of_down_link_ports, const SubTreeID& switch_id, uint depth, uint index)
: EthSwitch(number_of_up_link_ports, number_of_down_link_ports, switch_id, depth, index)
{
	log << "LogicalSwitch::LogicalSwitch(" << number_of_up_link_ports << ", "
        << number_of_down_link_ports << ", " << switch_id << ")" << endl;
}

void LogicalSwitch::PrintNedQueueParameters()
{
    cout << indent() << indent() << indent() << "upPortQueueSizePkts = "    << PhysUpLinksRepresented_   << "*DefaultQueueSizePkts; " << endl;
    cout << indent() << indent() << indent() << "upPortQueueSizeBytes = "   << PhysUpLinksRepresented_   << "*DefaultQueueSizeBytes; " << endl;
    cout << indent() << indent() << indent() << "downPortQueueSizePkts = "  << PhysDownLinksRepresented_ << "*DefaultQueueSizePkts; " << endl;
    cout << indent() << indent() << indent() << "downPortQueueSizeBytes = " << PhysDownLinksRepresented_ << "*DefaultQueueSizeBytes; " << endl;
}


