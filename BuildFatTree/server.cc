/*
 *  server.cpp
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/19/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"
#include "server.h"


Server::Server(const SubTreeID& server_id, uint depth) : EthNode(server_id, 1, depth)
{
	log << "Server(" << server_id << ")" << endl;
}


void Server::PrintNedParameters()
{
    //cout << indent() << indent() << indent() << "num_hosts = num_srv;" << endl;
    //cout << indent() << indent() << indent() << "sendIaTime = 1s;" << endl;
    cout << indent() << indent() << indent() << "address = " << node_id_.getAddress() << ";" << endl;
	//cout << indent() << indent() << indent() << "host_id = \"" << this->node_id_.get_string() << "\";" << endl;
	//cout << indent() << indent() << indent() << "depth = " << node_id_.get_depth() << ";" << endl;
	//cout << indent() << indent() << indent() << "sub_tree_id = " << node_id_.get_address() << ";" << endl;
	//cout << indent() << indent() << indent() << "path_mask = " << node_id_.get_path_bit_mask() << ";" << endl;
	//cout << indent() << indent() << indent() << "path_shift = " << node_id_.get_path_bit_shift() << ";" << endl;
	//cout << indent() << indent() << indent() << "sub_tree_mask = " << node_id_.get_sub_tree_bit_mask() << ";" << endl;
	//cout << indent() << indent() << indent() << "sub_tree_shift = " << node_id_.get_sub_tree_bit_shift() << ";" << endl;
	//cout << indent() << indent() << indent() << "route_down_mask = " << node_id_.get_level_id_bit_mask(node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_down_shift = " << node_id_.get_level_id_bit_shift(node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_up_mask = " << node_id_.get_level_id_bit_mask(node_id_.get_n() - node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "route_up_shift = " << node_id_.get_level_id_bit_shift(node_id_.get_n() - node_id_.get_depth()) << ";" << endl;
	//cout << indent() << indent() << indent() << "number_of_paths = number_of_paths;" << endl;
}

void Server::PrintNedGates()
{
	// Currently don't need to specify gates for server
}

std::string Server::NedPort(uint port_number)
{
	std::ostringstream oss;
	oss << NedName() << ".port";
	return oss.str();
}


Server::~Server()
{
	log << "Server::~Server() " << node_id_ << endl;
}
