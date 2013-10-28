/*
 *  ethernet_node.cpp
 *  BuildFatTree
 *
 *  Created by mah5 on 5/19/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"


// ------------------------------------------------------------------------------
// EthPort
// ------------------------------------------------------------------------------

EthPort::EthPort(EthNode *parent_node, uint port_number) : node_(parent_node), port_number_(port_number)
{
	log << "EthPort::EthPort(EthNode *parent_node, port_number)" << endl;
}

EthPort::~EthPort()
{
	log << "EthPort::~EthPort()" << endl;
}

EthNode *EthPort::get_node()
{
	if (node_ == NULL) {
		cerr << "EthPort::get_node(): port does not belong to a node!\n";
	}
	return node_;
}

// ------------------------------------------------------------------------------
// EthNode
// ------------------------------------------------------------------------------

EthNode::EthNode(const SubTreeID &node_id, uint number_of_ports, uint depth) : depth_(depth)
{
	node_id_ = node_id;
	// Create ports
	log << "EthNode::EthNode(const SubTreeID &node_id, uint number_of_ports)" << endl;
	for (uint i = 0; i <= number_of_ports; i++) {
		ports_.push_back(new EthPort(this, i));
	}	
}

EthNode::EthNode()
{
	log << "EthNode::EthNode()" << endl;
}

std::string EthNode::indent(uint numIndent)
{
	std::string temp = "";
	while (numIndent > 0) {
		temp += "    ";
		numIndent--;
	}
	return temp;
}

uint EthNode::get_number_of_ports()
{
	return ports_.size();
}

EthPort * EthNode::get_up_link_port(uint port_number)
{
	return get_port(port_number);
}

EthPort * EthNode::get_port(uint port_number)
{	
	if (port_number >= ports_.size()) {
		cerr << "EthNode::get_port(): Invalid port number " << port_number << "!\n";
		return NULL;
	}
	
	return ports_[port_number];
}

std::string EthNode::getString() const
{
	std::ostringstream oss;
	oss << get_type();
	oss << "_" << node_id_;
	return oss.str();
}

std::ostream & operator<< (std::ostream &os, const EthNode &param)
{
	os << param.getString();
	return os;
}


std::string EthNode::NedName()
{
	std::ostringstream oss;
	oss << getString();
	return oss.str();
}

void EthNode::PrintNedParameters()
{

}

void EthNode::PrintNedGates()
{
	cout << indent() << indent() << indent() << "port[" << get_number_of_ports() << "];" << endl;
}

std::string EthNode::NedPort(uint port_number)
{
	std::ostringstream oss;
	oss << NedName() << ".port[" << port_number << "]";
	return oss.str();
}

void EthNode::PrintNedPosition(uint position_offset)
{
	uint x,y;
	uint vertical_spacing = 200;
	x = position_offset;
	y = depth_*vertical_spacing;
	y += 50; // leave a little room from the top edge of the display
	cout << indent() << indent() << indent() << "@display(\"p=" << x << "," << y << ",x\");" << endl;
}

void EthNode::PrintNed(uint position_offset)
{
	cout << indent() << NedName() << " : " << NedType() << endl;
	cout << indent() << "{" << endl;
	cout << indent() << indent() << "parameters:" << endl;
	PrintNedPosition(position_offset); // position
	PrintNedParameters();
	cout << indent() << indent() << "gates:" << endl;
	PrintNedGates();
	cout << indent() << "}" << endl;
}

void EthNode::PrintNedConnections()
{

}

EthNode::~EthNode()
{
	log << "EthNode::~EthNode() " << node_id_ << endl;
	while (!ports_.empty()) {
		delete ports_.back();
		ports_.pop_back();
	}
}
