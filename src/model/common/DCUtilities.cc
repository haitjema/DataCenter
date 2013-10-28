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

#include "DCUtilities.h"
#include <iostream>
#include <algorithm>
#include <boost/filesystem/operations.hpp>
#include <sys/stat.h>
using namespace boost::filesystem;

bool dirExists(const char *dir)
{
    struct stat st;
    return (stat(dir,&st) == 0);
}

std::string fullPath(const char *file_or_dir)
{
    path p = file_or_dir;
    path full_path = absolute(p);
    full_path.remove_filename();
    if (is_directory(full_path)) {
       full_path = absolute(full_path);
    }
    return full_path.string();
}

bool isDirectory(const char *dir)
{
    path p(dir);
    path full_path = absolute(p);
    return is_directory(p);
}

bool isRegularFile(const char *file)
{
    path p(file);
    return is_regular_file(p);
}

void createDirectories(const char *dir)
{
    std::cout << "Creating directory " << dir << "\n";
    boost::filesystem::create_directories(dir);
}
