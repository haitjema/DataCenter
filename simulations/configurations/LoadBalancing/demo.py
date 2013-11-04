#!/usr/bin/env python
import os
import sys

project_path = "../../../"
bin = os.path.join(project_path, "src/DataCenter")
src_path = os.path.join(project_path, "src")
inet_path = "../../../../inet"
inet_lib = os.path.join(inet_path, "src/inet")
src_paths = [src_path, os.path.join(inet_path, "src"),
             os.path.join(inet_path, "examples")]

env = "Cmdenv"
run = 4559
ini_file = "Throughput_vs_OfferedLoad.ini"
config = "MPLoadBalancer"



run_cmd = "%s -u %s -l %s -n %s " % (bin, env, inet_lib, ":".join(src_paths))
run_cmd += "-c %s -r %s %s" % (config, run, ini_file)
print run_cmd

