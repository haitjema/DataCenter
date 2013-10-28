/*
 *  server.h
 *  BuildFatTree
 *
 *  Created by Mart on 5/19/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef SERVER_H_
#define SERVER_H_

class Server : public EthNode
{
public:
	explicit Server(const SubTreeID& server_id, uint depth); // must use explicit or c++ assumes function can be used as a conversion
	virtual ~Server();

	virtual std::string get_type() const { return "Server"; }

	void incServerObjects();
	void decServerObjects();

	virtual std::string NedType() { return "<ServerType> like Server"; }
	virtual std::string NedPort(uint port_number);
protected:
	void PrintNedParameters();
	void PrintNedGates();
};

#endif // SERVER_H_



