/*
 *  ethernet_switch.h
 *  BuildFatTree
 *
 *  Created by Mart Haitjema on 5/18/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef ETHERNET_SWITCH_H_
#define ETHERNET_SWITCH_H_

#define DEFAULT_QUEUE_SIZE_BYTES    32*KiB
#define DEFAULT_QUEUE_SIZE_PKTS     0

std::string bytesNedStr(ulong bytes);

class EthSwitch : public EthNode
{
public:
	EthSwitch(uint number_of_up_link_ports,
		      uint number_of_down_link_ports,
		      const SubTreeID& node_id,
		      uint depth, uint index = 0);
	~EthSwitch();
	
	virtual std::string get_type() const { return "Switch"; }

	bool is_down_link_port(uint port_number);
	bool is_up_link_port(uint port_number);
	EthPort *get_up_link_port(uint port_number);
	EthPort *get_down_link_port(uint port_number);
	uint get_index() { return index_; }
	void set_index(uint index) { index_ = index; }

	virtual void PrintNedParameters();
    virtual void PrintNedQueueParameters();
	void PrintNedType();
	virtual std::string NedType() { return "EthSwitch"; }
	virtual std::string NedPort(uint port_number);

	virtual std::string getString() const;

protected:
	virtual void PrintNedGates();

private:	
	uint number_of_up_link_ports_;
	uint number_of_down_link_ports_;
	uint index_; // The index of the switch at its sub-tree
};

class LogicalSwitch : public EthSwitch
{
public:
    LogicalSwitch(uint number_of_up_link_ports, uint number_of_down_link_ports, const SubTreeID& node_id, uint depth, uint index = 0);
    void setPhysUpLinksRepresented(uint PhysUpLinksRepresented) { PhysUpLinksRepresented_ = PhysUpLinksRepresented; }
    void setPhysDownLinksRepresented(uint PhysDownLinksRepresented) { PhysDownLinksRepresented_ = PhysDownLinksRepresented; }
    uint getPhysUpLinksRepresented() { return PhysUpLinksRepresented_; }
    uint getPhysDownLinksRepresented() { return PhysDownLinksRepresented_; }
    void PrintNedQueueParameters();
protected:        
    uint PhysUpLinksRepresented_;
    uint PhysDownLinksRepresented_;
};

#endif // ETHERNET_SWITCH_H_
