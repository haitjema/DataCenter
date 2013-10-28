//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//


// So that I can use the defined fields from INET IP packets
cplusplus {{
//#include "IPDatagram_m.h"
#include "IPv4Datagram_m.h"
#include "IPvXAddress.h"
#include "IPProtocolId_m.h"


enum IPProtocolId;


#define SEQUENCE_NO_BITS 32

// Assume a packet in our data center network is an IP packet
// where the timestamp option has been used to store:
// - a 32-bit sequence number
// - a 32-bit timestamp

// Ethernet Frame size
#define UDP_HEADER_SIZE			8
#define IP_HEADER_SIZE			(IP_HEADER_BYTES + 8) // IP_HEADER_BYTES = 20 defined in INET, 8 extra for timestamp & seq. no.
#define ETHER_FRAME_SIZE 		38
#define ETHER_MIN_PAYLOAD 		46
#define ETHER_MAX_SEG_SIZE		1500
#define DCN_MIN_PACKET_SIZE		(ETHER_MIN_PAYLOAD + ETHER_FRAME_SIZE)
#define IP_OVERHEAD				IP_HEADER_SIZE //(ETHER_FRAME_SIZE + IP_HEADER_SIZE)


}}


enum DCN_EthPacketType
{
    DCN_ETH_PACKET = 0;
    DCN_SCHEDULING_PACKET = 1;
    DCN_IP_PACKET = 2;
    DCN_UDP_PACKET = 3;
    DCN_TCP_PACKET = 4;
}

//
// Represents a packet in the DC Network.
//
packet DCN_EthPacket
{
    @customize(true); // will declare the message as DCN_EthPacket_Base which I can then extend
    // Note: the order of these fields could be important due to padding
    // declaring an int then short then int then short would require more memory then
    // declaring int, int, short, short  
    unsigned int srcAddr;
    unsigned int destAddr;
    
    unsigned int sequenceNo;
  	//unsigned int timestamp; // We'll use cMessage's timestamp
  
    // Need this field because pkt size might be less than min. Ether frame size
  	unsigned short payload; // (bytes)  
    
    unsigned short path;
    // To save memory, we'll use the kind field from cMessage to determine the packet type (e.g. data vs scheduling)
    unsigned short kind enum(DCN_EthPacketType) = DCN_ETH_PACKET; 
    //int pktSize;
    bool dataPacket = true;
}

