/*
 * node_id.h
 *
 *  Created on: May 26, 2011
 *      Author: Mart Haitjema
 */

/* NodeID is a class that defines how we label nodes in the FatTree
 *
 * sub_tree_id:
 * A FatTree is recursively defined thus each FatTree consists of multiple sub-trees.
 * Each sub-tree is assigned an ID that represents its index. Thus if there are m sub-trees
 * from the root, they will be labeled 0 through m-1.
 * Because sub-trees are recursively defined, each sub-tree inherits its sub_tree_id from its
 * parent. Therefore, the sub_tree_id is an array of integers representing the sub-tree's
 * index at every level from the root.
 * At the base of the FatTree are servers that each have a unique sub_tree_id that represents
 * their position in the FatTree.
 *
 * The server's address (i.e. it's sub_tree_id) can also be encoded as a 32-bit address.
 * This is useful for the OMnET++ simulation since simulated packets need to use small fixed-size
 * addresses.

 * The sub_tree_id is encoded into the address as follows:
 * The ID of the sub-tree at level n will be encoded into the least significant bits of the address.
 * The number of bits needed corresponds to the number of bits needed to represent the number of
 * subtrees at this level (i.e. # downward facing ports on a switch at level n-1).
 * Thus if there are m/2 sub-trees at level n-1, then the log2(m/2) least significant bits of the address
 * represent the ID of the sub-tree at level n.
 * The next least significant bits represent the ID at level n-1 and so forth.
 */

#ifndef NODE_ID_H_
#define NODE_ID_H_

// FatTree(parameters)
// Note that we can't easily support a VL2 like topology
// because ToRs connect to multiple sub-trees
class FatTreeParameters {
public:
	  uint tree_depth;					// Number of levels in the FatTree
	  //uint int_switches; 				// Number of intermediate switches
	  uint int_switch_down_ports;		// Number of down-ports at top of rack switches (i.e. # of "pods")
	  uint tor_switch_up_ports;			// Number of up ports at top of rack switches
	  uint tor_switch_down_ports;		// Number of down ports at top of rack switches (i.e. # servers per switch)
	  uint switch_up_ports;				// Number of up-ports per switch
	  uint switch_down_ports;			// Number of down-ports per switch
	  uint switch_switch_link_speed;	// Speed of switch-to-switch links (1*GBPS or 10*GBPS)
	  uint server_switch_link_speed;	// Speed of server-to-switch links (1*GBPS or 10*GBPS)
	  friend std::ostream & operator <<(std::ostream &, const FatTreeParameters &);
};

typedef std::vector<uint> uint_vec_t;
typedef std::vector<uint>::iterator uint_vec_iter;
typedef std::vector<uint>::const_iterator const_uint_vec_iter;
std::ostream & operator <<(std::ostream &, const uint_vec_t &);

class SubTreeID
{
public:
	SubTreeID();
	explicit SubTreeID(const FatTreeParameters &p);
	SubTreeID(const FatTreeParameters &p, uint address);
	SubTreeID(const SubTreeID &);

	~SubTreeID();

	// Copy constructor(s)
	void CopyFrom(const SubTreeID &);
	SubTreeID& operator = (const SubTreeID &);

	// String representation of the SubTreeID
	std::string getString() const;
	friend std::ostream & operator <<(std::ostream &, const SubTreeID &);

	void setLevelID(uint level, uint id);
	uint getLevelID(uint level) const;
	uint getLevelID(uint level, uint address) const;
	uint getPathID(uint level, uint path) const;
	uint getAddress() const;			// 32-bit address of this node
	void setAddress(uint address);
	uint getDepth() const;				// Depth of the tree
	bool compareSubTree(uint depth, uint address) const;	// Check if the SubTree in the address matches

	uint getUpRadix(uint level) const;
	uint getDownRadix(uint level) const;
	uint getNumberOfUpLinks(uint level) const;
	uint getNumberOfDownLinks(uint level) const;
	uint getNumberOfPaths() const;
	uint getNumberOfServers() const;

protected:
	void initialize(const FatTreeParameters &p);	// Initializes the following vectors

	uint_vec_t sub_tree_id_; 		// ID at every level

	uint_vec_t down_radix_;			// Number of down ports per switch at every level
	uint_vec_t up_radix_;			// Number of up ports per switch at every level

	uint_vec_t up_links_;			// Number of up links per subtree at every level
	uint_vec_t down_links_;			// Number of down ports per subtree at every level

	//uint_vec_t servers_reachable_;	// Servers reachable from every level
	uint_vec_t paths_reachable_;	// Paths (ie. int. switches) reachable from every level

	void update_sub_tree_id();
	void update_address();		// Converts the sub_tree_id_ into its 32-bit address representation
	uint address_;					// Cache the 32-bit address for quick address
};

// The number of physical links in a FatTree that a given link represents in the equivalent logical tree
// XXX Better way to handle this?
uint getNumCorrPhysDownLinks(SubTreeID &node_id, uint depth);
uint getNumCorrPhysUpLinks(SubTreeID &node_id, uint depth);

#endif /* NODE_ID_H_ */
