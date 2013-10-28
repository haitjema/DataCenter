/*
 *  ethernet_node.h
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/19/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef ETHERNET_NODE_H_
#define ETHERNET_NODE_H_

class EthNode;

class EthPort
{
public:
	EthPort(EthNode *parent_node, uint port_number);
	virtual ~EthPort();
	
	EthNode *get_node();
	uint get_port_number() {return port_number_;}
	
	void incEthPortObjects();
	void decEthPortObjects();

protected:
	EthNode *node_;			// node that this port belongs to
	uint port_number_;
};


class EthNode
{
public:
	EthNode(const SubTreeID &node_id, uint number_of_ports, uint depth);
	EthNode();
	virtual ~EthNode();
	
	void incEthNodeObjects();
	void decEthNodeObjects();

	virtual std::string get_type() const = 0;
	const SubTreeID &get_node_id() {return node_id_;}
	
	virtual uint get_number_of_ports();
	virtual EthPort *get_up_link_port(uint port_number);
	virtual EthPort *get_port(uint port_number);
	
	virtual void PrintNed(uint position_offset = 0);
	virtual void PrintNedConnections();
	virtual std::string NedType() { return get_type();}
	virtual std::string NedName();
	virtual std::string NedPort(uint port_number);
	
	virtual std::string getString() const;
	friend std::ostream & operator <<(std::ostream &, const EthNode &);

protected:
	virtual void PrintNedParameters();
	virtual void PrintNedGates();
	virtual void PrintNedPosition(uint position_offset);
	virtual std::string indent(uint numIndent = 1);

	std::string indent_;
	SubTreeID node_id_;
	uint depth_;
private:
	vector<EthPort*> ports_;
};


#endif // ETHERNET_NODE_H_
