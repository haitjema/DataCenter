/*
 *  fat_tree.h
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/17/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef FAT_TREE_H_
#define FAT_TREE_H_

class Connection;

class BuildFatTreeParameters : public FatTreeParameters
{
	public: void printNedParameters();
};

class SubFatTree : public EthNode
{
public:
	//SubFatTree(const BuildFatTreeParameters &p, uint depth);
	SubFatTree(const BuildFatTreeParameters &p, uint depth, SubTreeID sub_tree_id);
	SubFatTree() {log << "SubFatTree()" << endl;} // Needed by LogicalTree
	~SubFatTree();
	
	virtual std::string get_type() const { return "SubFatTree"; }

	virtual void Init();

	// Returns top-level switch port from this sub-tree that corresponds
	// to the port_number
	EthPort *get_up_link_port(uint port_number);

	// Prints the NED definition of all components (switches & servers)
	virtual void PrintNed(uint position_offset);
	// PrintNed() helper method - prints the connections for this sub-tree
	virtual void PrintNedConnections();
	
protected:	
	BuildFatTreeParameters p_;
	
	// The sub-trees of this layer
	vector<EthNode*> sub_trees_;
	// The Switches at this layer which connect to the sub-trees
	vector<EthSwitch*> top_switches_;
	// Connections between switches at this layer and sub-trees
	vector<Connection*> connections_;
	
	// Builds the sub-trees for this layer
	virtual void BuildSubTrees();
	// Adds the top-level switches for this layer
	virtual void AddTopSwitches();
	// Adds servers to the switch (if base case)
	void AddServers();
	// Connect two node ports together
	virtual void Connect(EthPort*, EthPort*, ulong datarate, double delay);
};

// Note: Had to use virtual inheritance in order to allow LogicalTree to extend both FatTree and LogicalSubTree
class FatTree : public virtual SubFatTree
{
public:
	FatTree(const BuildFatTreeParameters &p);
	FatTree() {log << "FatTree()" << endl;} // Needed by LogicalTree
	~FatTree();

	virtual std::string get_type() const { return "FatTree"; }

	void PrintSwitches();
	
	// Print the NED Network description for this FatTree
	void PrintNed(uint position_offset = 0);

	virtual void PrintNedConnections();


private:
	// PrintNed() helper methods
	void PrintNedHeader();
	void PrintNedParameters();
	void PrintNedTypes();
	void PrintNedSubModules(uint position_offset);
};

class LogicalSubTree : public virtual SubFatTree
{
public:
    LogicalSubTree(const BuildFatTreeParameters &p, uint depth, SubTreeID sub_tree_id);
    LogicalSubTree() {log << "LogicalSubTree()" << endl;} // Needed by LogicalTree
protected:
	virtual void BuildSubTrees();
    virtual void AddTopSwitches();
};

class LogicalTree : public FatTree, public LogicalSubTree
{
public:
    LogicalTree(const BuildFatTreeParameters &p);
    virtual std::string get_type() const { return "LogicalTree"; }
};


#endif // FAT_TREE_H_
