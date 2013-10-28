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

#include "DCCommon.h"
#include "node_id.h"
#include "FatTreeNode.h"

TopologyParameters::TopologyParameters(cSimpleModule *parent) : parent_(parent)
{
	// Read the parameters from the NED file
	tree_depth = parent_->par("tree_depth");
	//int_switches = parent_->par("int_switches");
	int_switch_down_ports = parent_->par("int_switch_down_ports");
	tor_switch_up_ports = parent_->par("tor_switch_up_ports");
	tor_switch_down_ports = parent_->par("tor_switch_down_ports");
	switch_up_ports = parent_->par("switch_up_ports");
	switch_down_ports = parent_->par("switch_down_ports");
	switch_switch_link_speed = parent_->par("switch_switch_link_speed");
	server_switch_link_speed = parent_->par("server_switch_link_speed");
}

TopologyParameters::~TopologyParameters()
{

}

FatTreeNode::FatTreeNode()
{

}

void FatTreeNode::initialize()
{
	LOG(DEBUG) << typeid(this).name() << endl;

	// Read the parameters from the NED file
	tree_depth = par("tree_depth");
	//int_switches = par("int_switches");
	int_switch_down_ports = par("int_switch_down_ports");
	tor_switch_up_ports = par("tor_switch_up_ports");
	tor_switch_down_ports = par("tor_switch_down_ports");
	switch_up_ports = par("switch_up_ports");
	switch_down_ports = par("switch_down_ports");
	switch_switch_link_speed = par("switch_switch_link_speed");
	server_switch_link_speed = par("server_switch_link_speed");

	address_ = par("address").longValue();

	node_id_ = SubTreeID(*this, address_);
}

FatTreeNode::~FatTreeNode()
{

}

Define_Module(FatTreeNode);
