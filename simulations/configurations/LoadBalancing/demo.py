#!/usr/bin/env python
import logging
import os
import sys

sys.path.append(os.path.abspath("../../../"))
from simulations.run_scripts import run_scripts
from simulations.common.lib_common import check_file

mlog = logging.getLogger('simulations.configurations.loadbalancing')
logging.basicConfig()

ini_file = check_file('demo.ini')
configs, runs = run_scripts.configs_and_runs(ini_file)


# Use the # of CPU cores to determine the number of runs to launch in parallel.
parallel = run_scripts.num_cores()

for config in configs:
	mlog.info("ini_file='%s', config='%s'",
		      os.path.basename(ini_file), config)
	run_scripts.batch_run_python(ini_file, config, runs, run_offset=0, 
	                  	         result_dir=None, parallel=parallel,
	                         	 check_output=True, compress_results=False)


# project_path = "../../../"
# bin = os.path.join(project_path, "src/DataCenter")
# src_path = os.path.join(project_path, "src")
# inet_path = "../../../../inet"
# inet_lib = os.path.join(inet_path, "src/inet")
# src_paths = [src_path, os.path.join(inet_path, "src"),
#              os.path.join(inet_path, "examples")]

# env = "Cmdenv"
# run = 4559
# ini_file = "Throughput_vs_OfferedLoad.ini"
# config = "MPLoadBalancer"

# repititions = 1


# run_cmd = "%s -u %s -l %s -n %s " % (bin, env, inet_lib, ":".join(src_paths))
# run_cmd += "-c %s -r %s %s" % (config, run, ini_file)
# print run_cmd

