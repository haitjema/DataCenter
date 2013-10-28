/*
 * node_id.cpp
 *
 *  Created on: May 26, 2011
 *      Author: Mart Haitjema
 */

#include "std_includes.h"
#include "node_id.h"

using namespace std;

ostream & operator <<(ostream &os, const uint_vec_t &vec)
{
	if (!vec.size()) return os;
	const_uint_vec_iter iter = vec.begin();
	os << *iter;
	iter++;
	while( iter != vec.end() ) {
		os << "_" << *iter;
		++iter;
	}
	return os;
}

std::ostream & operator<< (std::ostream &os, const FatTreeParameters &p)
{
	os << "tree_depth               = " << p.tree_depth << endl;
//	os << "int_switches             = " << p.int_switches << endl;
	os << "int_switch_down_ports    = " << p.int_switch_down_ports << endl;
	os << "tor_switch_up_ports      = " << p.tor_switch_up_ports << endl;
	os << "tor_switch_down_ports    = " << p.tor_switch_down_ports << endl;
	os << "switch_up_ports          = " << p.switch_up_ports << endl;
	os << "switch_down_ports        = " << p.switch_down_ports << endl;
	os << "switch_switch_link_speed = " << p.switch_switch_link_speed << " bps" << endl;
	os << "server_switch_link_speed = " << p.server_switch_link_speed << " bps" << endl;
	os << "string ServerType = default(\"TCPClientServer\");" << endl;
	return os;
}


SubTreeID::SubTreeID()
{

}

SubTreeID::SubTreeID(const FatTreeParameters &p)
{
	initialize(p);
}

SubTreeID::SubTreeID(const FatTreeParameters &p, uint address)
{
	initialize(p);
	address_ = address;
	update_sub_tree_id();
}

SubTreeID::SubTreeID(const SubTreeID & sub_tree_id)
{
	this->CopyFrom(sub_tree_id);
}


void SubTreeID::initialize(const FatTreeParameters &p)
{
	down_radix_.resize(p.tree_depth);
	up_radix_.resize(p.tree_depth);
	sub_tree_id_.resize(p.tree_depth);

	// XXX TODO: up_radix[1] should be adjusted to account for the p.int_switches argument

	// Intermediate (int) switches
	down_radix_[0] = p.int_switch_down_ports;
	up_radix_[0] = 0;
	// Top of Rack (ToR) switches
	down_radix_[p.tree_depth-1] = p.tor_switch_down_ports;
	up_radix_[p.tree_depth-1] = p.tor_switch_up_ports;
	// Switches at all remaining levels
	for (uint i = 1; i < p.tree_depth-1; i++) {
		down_radix_[i] = p.switch_down_ports;
		up_radix_[i] = p.switch_up_ports;
	}

	/*
	servers_reachable_.resize(p.tree_depth + 1);
	servers_reachable_[p.tree_depth] = 1;
	for (int i = p.tree_depth - 1; i >= 0; i--) {
		servers_reachable_[i] = servers_reachable_[i+1]*down_radix_[i];
	}*/

	down_links_.resize(p.tree_depth + 1);
	down_links_[p.tree_depth] = 1;
	for (int i = p.tree_depth - 1; i >= 0; i--) {
		down_links_[i] = down_links_[i+1]*down_radix_[i];
	}

	//cout << "down_links = " << down_links_ << endl;

	up_links_.resize(p.tree_depth + 1);
	up_links_[p.tree_depth] = 1;
	for (int i = p.tree_depth - 1; i >= 0; i--) {
		up_links_[i] = up_links_[i+1]*up_radix_[i];
	}
	//cout << "up_links = " << up_links_ << endl;

	paths_reachable_.resize(p.tree_depth + 1);
	paths_reachable_[0] = 1;
	for (uint i = 1; i < p.tree_depth; i++) {
		paths_reachable_[i] = paths_reachable_[i-1]*up_radix_[i];
	}
	// Server (which is at depth = p.tree_depth) can reach the same # paths
	// as the switch that is connected to
	paths_reachable_[p.tree_depth] = paths_reachable_[p.tree_depth-1];

	//cout << "paths_recahable_ = " << paths_reachable_ << endl;
}

void SubTreeID::update_address()
{
	// Reconstruct the 32-bit address from the sub-tree
	address_ = 0;
	for (uint i = 0; i < sub_tree_id_.size(); i++) {
		 address_ += sub_tree_id_[i]*down_links_[i+1];
	}
}

void SubTreeID::update_sub_tree_id()
{
	// Reconstruct the sub_tree_id from the given address
	for (uint i = 0; i < sub_tree_id_.size(); i++) {
		sub_tree_id_[i] = getLevelID(i, address_);
	}
}

void SubTreeID::CopyFrom(const SubTreeID & sub_tree_id)
{
	// Copy everything
	address_ = sub_tree_id.address_;
	// Default copy constructors for uint_vec_t should work fine
	sub_tree_id_ = sub_tree_id.sub_tree_id_;
	down_radix_ = sub_tree_id.down_radix_;
	up_radix_ = sub_tree_id.up_radix_;
	down_links_ = sub_tree_id.down_links_;
	up_links_ = sub_tree_id.up_links_;
	paths_reachable_ = sub_tree_id.paths_reachable_;
}

SubTreeID& SubTreeID::operator=(const SubTreeID &sub_tree_id)
{
	this->CopyFrom(sub_tree_id);
	return *this;
}

std::string SubTreeID::getString() const
{
	std::ostringstream oss;
	oss << sub_tree_id_;
	return oss.str();
}

std::ostream & operator<< (std::ostream &os, const SubTreeID &param)
{
	os << param.getString();
	return os;
}

void SubTreeID::setLevelID(uint level, uint id)
{
	if (level >= sub_tree_id_.size()) {
		cerr << "SubTreeID::setLevelID(): Error: level " << level << " is greater than depth of tree!\n";
		return;
	}
	if (id >= down_radix_[level]) {
		cerr << "SubTreeID::setLevelID(): Error: id " << id << " is invalid at level " << level
			 << " because the down radix for switches at this level is " << down_radix_[level] << "!\n";
		return;
	}
	sub_tree_id_[level] = id;
	update_address(); // update the address_
}

uint SubTreeID::getLevelID(uint level) const
{
#ifdef ERROR_CHECKS
	if (level >= sub_tree_id_.size()) {
		cerr << "SubTreeID::getLevelID(): Error: level " << level << " is greater than depth of tree!\n";
		return 0;
	}
#endif
	return sub_tree_id_[level];
}

uint SubTreeID::getLevelID(uint level, uint address) const
{
#ifdef ERROR_CHECKS
	if (level >= sub_tree_id.size()) {
		cerr << "SubTreeID::getLevelID(): Error: level " << level << " is greater than depth of tree!\n";
	}
#endif
	return address / down_links_[level+1] % down_radix_[level];
}

uint SubTreeID::getPathID(uint level, uint path) const
{
#ifdef ERROR_CHECKS
	if (level == 0 || level > sub_tree_id.size()) {
		cerr << "SubTreeID::getPathID(): Error: level " << level << " is either 0 or greater than depth of tree!\n";
	}
#endif
	return path / paths_reachable_[level-1] % up_radix_[level];
}

uint SubTreeID::getAddress() const
{
	return address_;
}

void SubTreeID::setAddress(uint address)
{
#ifdef ERROR_CHECKS
	if (address >= getNumberOfServers()) {
		cerr << "SubTreeID::setAddress(): Error: address " << address
			 << " is greater than the number of servers in the tree(" << getNumberOfServers()<< ")!\n";
	}
#endif
	address_ = address;
	update_sub_tree_id();
}

uint SubTreeID::getDepth() const
{
	return sub_tree_id_.size();
}

bool SubTreeID::compareSubTree(uint depth, uint address) const
{
	for (uint i = 0; i < depth; i++) {
		if (sub_tree_id_[i] != getLevelID(i, address)) return false;
	}
	return true;
}

uint SubTreeID::getUpRadix(uint level) const
{
#ifdef ERROR_CHECKS
	if (level > sub_tree_id.size()) {
		cerr << "SubTreeID::getPathID(): Error: level " << level << " is either 0 or greater than depth of tree!\n";
	}
#endif
	return up_radix_[level];
}

uint SubTreeID::getDownRadix(uint level) const
{
#ifdef ERROR_CHECKS
	if (level > sub_tree_id.size()) {
		cerr << "SubTreeID::getPathID(): Error: level " << level << " is either 0 or greater than depth of tree!\n";
	}
#endif
	return down_radix_[level];
}

uint SubTreeID::getNumberOfUpLinks(uint level) const
{
#ifdef ERROR_CHECKS
	if (level > sub_tree_id.size()) {
		cerr << "SubTreeID::getPathID(): Error: level " << level << " is either 0 or greater than depth of tree!\n";
	}
#endif
	return up_links_[level];
}

uint SubTreeID::getNumberOfDownLinks(uint level) const
{
#ifdef ERROR_CHECKS
	if (level > sub_tree_id.size()) {
		cerr << "SubTreeID::getPathID(): Error: level " << level << " is either 0 or greater than depth of tree!\n";
	}
#endif
	return down_links_[level];
}

uint SubTreeID::getNumberOfPaths() const
{
	// Servers can reach all paths (i.e. intermediate switches)
	return paths_reachable_[sub_tree_id_.size()];
}

uint SubTreeID::getNumberOfServers() const
{
	// Switches at level 0 can reach all servers
	return down_links_[0];
}


SubTreeID::~SubTreeID()
{
	sub_tree_id_.clear();
	down_radix_.clear();
	up_radix_.clear();
	down_links_.clear();
	up_links_.clear();
	paths_reachable_.clear();

}

uint getNumCorrPhysDownLinks(SubTreeID &node_id, uint depth) {
    //cout << "node_id.getNumberOfDownLinks(depth) / node_id.getDownRadix(depth) = " << node_id.getNumberOfDownLinks(depth) << " / " << node_id.getDownRadix(depth) << " = " << (node_id.getNumberOfDownLinks(depth) / node_id.getDownRadix(depth)) << endl;
    return node_id.getNumberOfDownLinks(depth) / node_id.getDownRadix(depth);
}
uint getNumCorrPhysUpLinks(SubTreeID &node_id, uint depth) {
    //cout << "(depth) ? node_id.getNumberOfDownLinks(depth) : 0 = " << "(" << depth << ") ? " << node_id.getNumberOfDownLinks(depth) << " : 0 = " << ((depth) ? node_id.getNumberOfDownLinks(depth) : 0) << endl;
    return (depth) ? node_id.getNumberOfDownLinks(depth) : 0;
}
