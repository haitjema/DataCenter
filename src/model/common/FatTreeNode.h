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

#ifndef FAT_TREE_NODE_H_
#define FAT_TREE_NODE_H_

#include "node_id.h"
class FatTreeParameters;
class TopologyParameters;
class FatTreeNode;

// This class wraps the FatTreeParameters to allow simple objects
// to read the global Topology parametes from the NED files
class TopologyParameters : public FatTreeParameters
{
public:
	TopologyParameters(cSimpleModule *parent);
	~TopologyParameters();

private:
	cSimpleModule *parent_;
};


class FatTreeNode : public cSimpleModule, public FatTreeParameters
{
public:
	FatTreeNode();

	virtual void initialize();
	virtual uint getAddress() { return address_; }
	~FatTreeNode();

protected:
	SubTreeID node_id_;
	uint address_;
};

#endif /* FAT_TREE_NODE_H_ */
