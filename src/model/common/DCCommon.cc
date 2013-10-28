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

//----------------------------------------------------------------------------------------------------
// Flow
//----------------------------------------------------------------------------------------------------

std::ostream& operator<<(std::ostream& os, const Flow& f) { os << "f(" << f.src << "," << f.dst << ")"; return os; }
std::string flowName(const Flow flow) { sstring out; out << flow; return out.str(); }
bool operator==(const Flow& a, const Flow& b) { return a.raw_value == b.raw_value; }
bool operator!=(const Flow& a, const Flow& b) { return a.raw_value != b.raw_value; }
bool operator<(const Flow& a, const Flow& b) { return a.raw_value < b.raw_value; }
bool operator>(const Flow& a, const Flow& b) { return a.raw_value > b.raw_value; }

