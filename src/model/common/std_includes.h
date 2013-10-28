/*
 *  StdIncludes.h
 *  FatTreeBuilder
 *
 *  Created by mah5 on 5/17/11.
 *  Copyright 2011 Washington University in St. Louis. All rights reserved.
 *
 */

#ifndef STD_INCLUDES_H_
#define STD_INCLUDES_H_

#include <stdlib.h>
#include <math.h>

#include <stdio.h> // XXX necessary?
#include <string.h> // XXX necessary?

#include <ostream> // XXX necessary?
#include <sstream>
#include <iostream>
#include <vector>

typedef unsigned int uint;
typedef unsigned long long ulong;

// TODO: replace these with UnitConversion class in unitconversion.h
#define KILO 1000
#define MEGA (1000*KILO)
#define GIGA (1000*MEGA)

#define MS  (1.0/KILO)
#define US  (1.0/MEGA)
#define NS  (1.0/GIGA)

#define KiB  (1024)
#define MiB  (1024*KiB)
#define GiB  (1024*MiB)

#define BITS_PER_BYTE 8
#define KBPS KILO
#define MBPS MEGA
#define GBPS GIGA


using namespace std;

//#define DEBUG
#define ERROR_CHECKING

#ifdef DEBUG
	#define log cout
#else
	// disables all log messages
	#define log if (false) cout
#endif


#endif // STD_INCLUDES_H_
