/*
 *  fat_tree.cpp
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/17/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#include "../src/model/common/std_includes.h"
#include "../src/model/common/node_id.h"
#include "ethernet_node.h"
#include "ethernet_switch.h"
#include "server.h"
#include "connection.h"
#include "fat_tree.h"

// Helper functions
/*inline uint number_of_up_links(uint m, uint l)
{
	return (uint)pow((m/2), l);
}*/

void BuildFatTreeParameters::printNedParameters() {
	cout << "    **.tree_depth               = " << tree_depth << ";" << endl;
	cout << "    **.int_switch_down_ports    = " << int_switch_down_ports << ";" << endl;
	cout << "    **.tor_switch_up_ports      = " << tor_switch_up_ports << ";" << endl;
	cout << "    **.tor_switch_down_ports    = " << tor_switch_down_ports << ";" << endl;
	cout << "    **.switch_up_ports          = " << switch_up_ports << ";" << endl;
	cout << "    **.switch_down_ports        = " << switch_down_ports << ";" << endl;
	cout << "    **.switch_switch_link_speed = " << datarateNedStr(switch_switch_link_speed) << ";" << endl;
	cout << "    **.server_switch_link_speed = " << datarateNedStr(server_switch_link_speed) << ";" << endl;
	cout << "    string ServerType = default(\"TCPClientServer\");" << endl;
}


// ------------------------------------------------------------------------------
// FatTree
// ------------------------------------------------------------------------------

FatTree::FatTree(const BuildFatTreeParameters &p) : SubFatTree(p, 0, SubTreeID(p, 0))
{
	log << "FatTree(p)" << endl;
	//node_id_ = SubTreeID(p);
}

// Needed by LogicalTree
//FatTree::FatTree(const BuildFatTreeParameters &p, uint depth, SubTreeID sub_tree_id) : SubFatTree
//{
    
//}

void FatTree::PrintNedHeader()
{
	std::string package = "datacenter.model.";
	cout << "package "<< package << "networks.fattree.generatedOutsideOmnet;" << endl;
	cout << "import ned.DatarateChannel;" << endl;
	cout << "import " << package << "switch.EthSwitch;" << endl;
	cout << "import " << package << "node.server.Server;" << endl;
	cout << "import " << package << "node.server.*;" << endl;
}

void FatTree::PrintNedParameters()
{
	cout << "  " << "parameters:" << endl;
	p_.printNedParameters();


	//cout << indent() << "**.num_srv = " << number_of_nodes_ << ";" << endl;
	//cout << indent() << "**.m = " << m_ << ";" << endl;
	//cout << indent() << "**.n = " << n_ << ";" << endl;
	cout << indent() << "**.number_of_paths = " << node_id_.getNumberOfPaths() << ";" << endl;
	//cout << indent() << "string ServerType = default(\"ServerBase\");" << endl;
	//cout << indent() << "**.path_mask = " << node_id_.get_path_bit_mask() << ";" << endl;
	//cout << indent() << "**.path_shift = " << node_id_.get_path_bit_shift() << ";" << endl;
	//cout << indent() << "**.packet_size = " << 1000 << ";" << endl; // XXX currently hard-coded. Should this even be set from BuildFatTree?
	
	cout << indent() << "int DefaultQueueSizeBytes @unit(bytes) = default(" << bytesNedStr(DEFAULT_QUEUE_SIZE_BYTES) << ");" << endl;
	cout << indent() << "int DefaultQueueSizePkts = default(" << DEFAULT_QUEUE_SIZE_PKTS << ");" << endl;
}

void FatTree::PrintNedTypes()
{
	cout << "  " << "types:" << endl;
	cout << indent() << "channel DCLink extends DatarateChannel" << endl;
	cout << indent() << "{" << endl;
	cout << indent() << indent() << "@class(DCLink);" << endl;
	cout << indent() << indent() << "datarate = default(1 Gbps);" << endl;
	cout << indent() << indent() << "delay = default(0 us);" << endl;
	cout << indent() << "}" << endl;
}

void FatTree::PrintNedSubModules(uint position_offset)
{
	cout << "  " << "submodules:" << endl;
	SubFatTree::PrintNed(position_offset);
}

void FatTree::PrintNedConnections()
{
	cout << indent() << "connections:" << endl;
	SubFatTree::PrintNedConnections();
}

void FatTree::PrintNed(uint position_offset)
{
	PrintNedHeader();
	cout << endl;
	cout << endl;

	// XXX TODO: create network name from parameters
	cout << "network " << get_type() << "_" << p_.int_switch_down_ports << "_"
		 << p_.switch_down_ports << "_" << p_.tree_depth << endl;
	cout << "{" << endl; // start of Network scope

	PrintNedParameters();

	cout << endl;
	PrintNedTypes();

	cout << endl;
	PrintNedSubModules(position_offset);

	cout << endl;
	PrintNedConnections();

	cout << "}" << endl; // end of Network scope
}


FatTree::~FatTree()
{
	log << "FatTree::~SubFatTree() " << node_id_ << endl;
}

// ------------------------------------------------------------------------------
// Sub-FatTree
// ------------------------------------------------------------------------------

/*SubFatTree::SubFatTree(const BuildFatTreeParameters &p, uint depth) : EthNode(), p_(p)
{
	log << "SubFatTree(p, depth)" << endl;
	log << "depth = " << depth_ << endl;
	log << "p = " << p_ << endl;
}*/

SubFatTree::SubFatTree(const BuildFatTreeParameters &p, uint depth, SubTreeID sub_tree_id) : EthNode(sub_tree_id, 0, depth), p_(p)
{
	log << "SubFatTree(p, depth, sub_tree_id)" << endl;
	log << "sub_tree_id = " << sub_tree_id << endl;
	log << "depth = " << depth_ << endl;
	log << "p = " << p_ << endl;
}

void SubFatTree::Init()
{
    log << "SubFatTree::Init()" << endl;
    
	if (depth_ == p_.tree_depth-1) {
		AddServers();	
	} else {
		BuildSubTrees();
	}
	AddTopSwitches();
}

void SubFatTree::BuildSubTrees()
{
	// Create sub-trees
	for (uint i = 0; i < node_id_.getDownRadix(depth_); i++)
	{
		SubTreeID sub_tree_id(node_id_);
		sub_tree_id.setLevelID(depth_, i);
		SubFatTree *sub_tree = new SubFatTree(p_, depth_+1, sub_tree_id);
		sub_trees_.push_back(sub_tree);
		sub_tree->Init();
	}
}

void SubFatTree::AddServers()
{
	log << "SubFatTree::AddServers()" << endl;
	// Add servers
	for (uint i = 0; i < node_id_.getDownRadix(depth_); i++) {
		SubTreeID server_id(node_id_);
		server_id.setLevelID(depth_, i);
		sub_trees_.push_back(new Server(server_id, depth_+1));
	}
}


void SubFatTree::Connect(EthPort *port1, EthPort *port2, ulong datarate, double delay)
{
	// Make sure ports are valid
	if (port1 == NULL || port2 == NULL) {
		log << "SubFatTree::Connect(): Error invalid port(s)!\n";
	}
	
	EthNode* node1 = port1->get_node();
	EthNode* node2 = port2->get_node();
	log << "Connecting ";
	log << node1->get_type() << *node1 << ".port[" << port1->get_port_number() << "] to ";
	log << node2->get_type() << *node2 << ".port[" << port2->get_port_number() << "]"
	    << " with datarate=" << datarate << " and delay=" << delay << endl;

	// XXX hardcoded
	std::string type = "DCLink";
	connections_.push_back(new Connection(type, port1, port2, datarate, delay));
}


void SubFatTree::AddTopSwitches()
{
	// Must be called after the creation of the sub-trees
	log << "SubFatTree::AddTopSwitches() depth_ = " << depth_ << endl;
	
	// Create top switches
	for (uint i = 0; i < node_id_.getNumberOfUpLinks(depth_+1); i++) {
		SubTreeID switch_id(node_id_);
		uint up_ports = node_id_.getUpRadix(depth_);
		uint down_ports = node_id_.getDownRadix(depth_);
		top_switches_.push_back(new EthSwitch(up_ports, down_ports, switch_id, depth_, i));
	}
	
	// Connect downward facing ports from top-level switches to
	// upward facing ports from sub-trees
	for (uint i = 0; i < top_switches_.size(); i++) {
		// Each top-level switch has m/2 downward facing ports
		// & each switch connects to all m/2 sub-trees
		for (uint j = 0; j < sub_trees_.size(); j++) {
			// Port j of top-level switch i connect's to port i of sub-tree j 
			EthPort *top_switch_down_link_port = top_switches_[i]->get_down_link_port(j);
			EthPort *sub_tree_up_link_port = sub_trees_[j]->get_up_link_port(i);
			Connect(top_switch_down_link_port, sub_tree_up_link_port, DEFAULT_DATARATE, DEFAULT_DELAY);
		}
	}
}

EthPort *SubFatTree::get_up_link_port(uint port_number)
{	
	uint switch_num = port_number / node_id_.getUpRadix(depth_);
	uint up_link_port_number = port_number % node_id_.getUpRadix(depth_);
	
	if (switch_num >= top_switches_.size()) {
		cerr << "SubFatTree::get_up_link_port(): Switch " << switch_num 
			 << " corresponding to port " << port_number << "does not exist!\n";
		return NULL;
	}
	log << "SubFatTree::get_up_link_port(): port_number " << port_number <<  "  = switch " << switch_num << " port " << up_link_port_number << endl;
	return top_switches_[switch_num]->get_up_link_port(up_link_port_number);
}

void SubFatTree::PrintNedConnections()
{
	for (uint i = 0; i < sub_trees_.size(); i++) {
		sub_trees_[i]->PrintNedConnections();
	}
	for (uint i = 0; i < connections_.size(); i++) {
		connections_[i]->PrintNed();
	}
}

void SubFatTree::PrintNed(uint position_offset)
{
	uint ned_server_spacing = 125;
	uint sub_tree_offset = position_offset;

	// Print hosts first by going all the way to the bottom
	for (uint i = 0; i < sub_trees_.size(); i++) {
		sub_trees_[i]->PrintNed(sub_tree_offset);
		//sub_tree_offset += ned_server_spacing*sub_trees_[i]->get_number_of_nodes();
		sub_tree_offset += ned_server_spacing*node_id_.getNumberOfDownLinks(depth_+1);
	}

	uint width = (sub_tree_offset - ned_server_spacing - position_offset);
	uint switch_spacing = width/(top_switches_.size()+1);
	uint switch_position = position_offset;

	// Now print switch definitions
	for (uint i = 0; i < top_switches_.size(); i++) {
		switch_position += switch_spacing;
		top_switches_[i]->PrintNed(switch_position);
	}

}

SubFatTree::~SubFatTree()
{
	log << "SubFatTree::~SubFatTree() " << *this << endl;
	// Free all switches
	while (!top_switches_.empty()) {
		delete top_switches_.back();
		top_switches_.pop_back();
	}
	// Free all connections
	while (!connections_.empty()) {
		delete connections_.back();
		connections_.pop_back();
	}
	// Free all sub_trees
	while (!sub_trees_.empty()) {
		delete sub_trees_.back();
		sub_trees_.pop_back();
	}
}

/*
LogicalTree::LogicalTree(const BuildFatTreeParameters &p) : LogicalSubTree(p,0,SubTreeID(p))
{
    log << "LogicalTree(p)" << endl;
}
*/
LogicalTree::LogicalTree(const BuildFatTreeParameters &p) : SubFatTree(p,0,SubTreeID(p)) // LogicalSubTree(p,0,SubTreeID(p)) //SubFatTree(p,0,SubTreeID(p)), LogicalSubTree(p,0,SubTreeID(p)), FatTree(p)
{
    log << "LogicalTree(p)" << endl;    
}

LogicalSubTree::LogicalSubTree(const BuildFatTreeParameters &p, uint depth, SubTreeID sub_tree_id) : SubFatTree(p, depth, sub_tree_id)
{
	log << "LogicalSubTree(p, depth, sub_tree_id)" << endl;    
}

void LogicalSubTree::AddTopSwitches()
{
	// Must be called after the creation of the sub-trees
	log << "LogicalSubTree::AddTopSwitches() depth_ = " << depth_ << endl;

    // XXX I think most of the changes in this method from the SubFatTree::AddTopSwitches() was unnecessary...
    // just setting the up_radix to 1 would have produced a logical tree... the only thing we really needed
    // was adding code to compute the number of physical links a link in the logical tree corresponds to.

	// Create just one switch
	SubTreeID switch_id(node_id_);
    // The number of down ports is the same as in the FatTree, i.e. 1 per SubtTree
    uint down_ports = node_id_.getDownRadix(depth_);
    // A switch has one up-port unless it's at depth_ == 0
    uint up_ports = (depth_) ? 1 : 0;
    // Each down port corresponds to the number of physical links in the subtree at the given
    // level of the FatTree divided by the number of physical switch ports.
    ulong numCorrPhysDownLinks = getNumCorrPhysDownLinks(node_id_, depth_);
    ulong numCorrPhysUpLinks = getNumCorrPhysUpLinks(node_id_, depth_);
    log << "numCorrPhysDownLinks = " << numCorrPhysDownLinks << " numCorrPhysUpLinks = " << numCorrPhysUpLinks << endl; 
    //cout << node_id_ << " depth = " << depth_ << " numCorrPhysDownLinks = " << numCorrPhysDownLinks << " numCorrPhysUpLinks = " << numCorrPhysUpLinks << endl; 
    uint i = 0;
    LogicalSwitch *topSwitch = new LogicalSwitch(up_ports, down_ports, switch_id, depth_, i);
    topSwitch->setPhysUpLinksRepresented(numCorrPhysUpLinks);
    topSwitch->setPhysDownLinksRepresented(numCorrPhysDownLinks);
	top_switches_.push_back(topSwitch);
	
	// Connect downward facing ports from top-level switches to
	// upward facing ports from sub-trees
	if (top_switches_.size()) {
        uint i = 0;
	    for (uint j = 0; j < sub_trees_.size(); j++) {
			// Port j of top-level switch i connect's to port i of sub-tree j 
			EthPort *top_switch_down_link_port = top_switches_[i]->get_down_link_port(j);
			EthPort *sub_tree_up_link_port = sub_trees_[j]->get_up_link_port(i);
			Connect(top_switch_down_link_port, sub_tree_up_link_port, numCorrPhysDownLinks*DEFAULT_DATARATE, DEFAULT_DELAY);
		}
	}
}

void LogicalSubTree::BuildSubTrees()
{
    log << "LogicalSubTree::BuildSubTrees()" << endl;
	// Create sub-trees
	for (uint i = 0; i < node_id_.getDownRadix(depth_); i++)
	{
		SubTreeID sub_tree_id(node_id_);
		sub_tree_id.setLevelID(depth_, i);
		LogicalSubTree *sub_tree = new LogicalSubTree(p_, depth_+1, sub_tree_id);
		sub_trees_.push_back(sub_tree);
		sub_tree->Init();
	}
}
