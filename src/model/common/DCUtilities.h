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

#ifndef DCUTILITIES_H_
#define DCUTILITIES_H_
#include <string>

// Uses the Boost libraries to build a directory tree
bool dirExists(const char *path);
std::string fullPath(const char *file_or_dir);
bool isDirectory(const char *dir);
bool isRegularFile(const char *file);
void createDirectories(const char *path);

#endif /* DCUTILITIES_H_ */
