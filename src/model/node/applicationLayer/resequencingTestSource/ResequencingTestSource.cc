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
#include "ResequencingTestSource.h"


//ResequencingTestSource::ResequencingTestSource()
//{

//}

void ResequencingTestSource::initialize()
{
    FatTreeNode::initialize();

    if (address_ != 0) return;

	DCN_EthPacket *pkt;
	pkt = new DCN_UDPPacket("pkt0seq0");
	pkt->setPayloadLengthBytes(0);
	pkt->setSrcAddr(0);
	pkt->setDestAddr(15);
	pkt->setSequenceNo(1);
	//pkt->setTimestamp(0);
	pkt->setTimestamp(0.00001);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());

	pkt = new DCN_UDPPacket("pkt0seq1");
	pkt->setPayloadLengthBytes(0);
	pkt->setSrcAddr(0);
	pkt->setDestAddr(15);
	pkt->setSequenceNo(2);
	pkt->setTimestamp(0.00002);
	//pkt->setTimestamp(0);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());


	pkt = new DCN_UDPPacket("pkt0seq2");
	pkt->setSrcAddr(0);
	pkt->setDestAddr(15);
	pkt->setPayloadLengthBytes(0);
	pkt->setSequenceNo(3);
	//pkt->setTimestamp(0);
	pkt->setTimestamp(0.00003);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());

	/*
	pkt = new DCN_UDPPacket("pkt0seq3");
	pkt->setSrcAddr(0);
	pkt->setDestAddr(1);
	pkt->setSequenceNo(3);
	pkt->setTimestamp(0.3);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());

	pkt = new DCN_UDPPacket("pkt0seq4");
	pkt->setSrcAddr(0);
	pkt->setDestAddr(1);
	pkt->setSequenceNo(4);
	pkt->setTimestamp(0.4);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());

	pkt = new DCN_UDPPacket("pkt0seq5");
	pkt->setSrcAddr(0);
	pkt->setDestAddr(1);
	pkt->setSequenceNo(5);
	pkt->setTimestamp(0.5);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());

	pkt = new DCN_UDPPacket("pkt0seq6");
	pkt->setSrcAddr(0);
	pkt->setDestAddr(1);
	pkt->setSequenceNo(6);
	pkt->setTimestamp(0.6);
	sendDelayed(pkt, 0.0, "lower_layer$o");
	//pkt->setTimestamp(pkt->getSendingTime());
	*/
}

void ResequencingTestSource::handleMessage(cMessage *msg)
{
	DCN_EthPacket *pkt = check_and_cast<DCN_EthPacket *>(msg);
	LOG(DEBUG) << "Pkt received from resequencer " << pkt << endl;
 	delete pkt;
}

ResequencingTestSource::~ResequencingTestSource()
{

}

Define_Module(ResequencingTestSource);
