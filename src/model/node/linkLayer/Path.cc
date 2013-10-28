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
#include "Path.h"

Path::Path()
{
}

void Path::initialize()
{
	LOG(DEBUG) << typeid(this).name() << endl;
	pathBytesSignal = registerSignal("pathBytes");
}

void Path::performAccounting(DCN_EthPacket *pkt)
{
	Enter_Method("Path %d chosen", getIndex());
	EVF << " emit " << (long)pkt->getByteLength() << endl;
	emit(pathBytesSignal, (long)pkt->getByteLength());
}

Path::~Path()
{
}

Define_Module(Path);
