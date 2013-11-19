#!/usr/bin/env python
"""
    SYNOPSIS
    
    processingFunctions
    
    DESCRIPTION
    
    This python module is meant to supply a library of common results processing
    functions. Some of these functions have also been implemented as bash scripts
    and can be shelled from python (see bashScripts.py).
    
    EXAMPLES
    
    To see a list of available functions call:
    processingFunctions list
    
    EXIT STATUS
    
    N/A
    
    AUTHOR
    
    Mart Haitjema <mart.haitjema@wustl.edu>
    
    LICENSE
    
    This script is in the public domain, free from copyrights or restrictions.
    
    VERSION
    
    $Id$
    """

import glob
import logging
import math
import os
import re
import sys

from scipy import stats

from simulations.common.lib_common import *


mlog = logging.getLogger('simulations.processingFunctions')

# Note: order matters when using strip
bwUnits = ['Gbps', 'kbps', 'Mbps', 'Tbps', 'bps']
timeUnits = ['seconds', 'ms', 'us', 'ns', 'ps', 's']
dataUnits = ['KiB', 'MiB', 'GiB', 'TiB', 'bytes', 'byte', 'b', 'B']
allUnits = []
allUnits.extend(bwUnits)
allUnits.extend(timeUnits)
allUnits.extend(dataUnits)
expr = ".*("
for u in allUnits:
    expr += u + "|"
expr = expr.rstrip("|") + ")$"
RE_ALL_UNITS = re.compile(expr)


def mean_ci(data, confidence=0.95):
    """Returns the mean and error for the specified degree of 
    confidence on the supplied data.
    - Assumes the standard deviation is unknown.
    - Uses one-tail student's t value?
    """
    mlog.debug("confidence = %f, data = %s", confidence, data)
    try:
        mean = stats.tmean(data)
    except:
        mlog.error("Error on data: %s", repr(data))
        return 0,0
    n = len(data)
    if n < 2:
        mlog.error("Length of data is only %d! Data=%s", n, repr(data))
        raise StandardError("Invalid data!")
    # Get the student's t-distribution
    tnd = stats.t._ppf(confidence , n-1)
    sigma = stats.tstd(data)
    error = (sigma*tnd)/math.sqrt(n)
    return mean, error


def warmup_from_inifile(ini_file):
    ini_file = check_file(ini_file)
    line = None
    warmup_str = 'warmup-period'
    with open(ini_file) as f:
        for line in f:
            if warmup_str in line:
                break
    if not line:
        mlog.warn("%s not found in file %s", warmup_str, ini_file)
        return 0
    warmup = line.split("=")[1].strip().strip("\n") # get rid of the warmup_str portion and formatting
    number_regex = re.compile('(\d+)')
    value = number_regex.search(warmup).group(0)
    units = warmup.split(value)[1].strip()
    if units == "s":
        value = float(value)
    elif units == "ms":
        value = float(value)/pow(10,3) 
    elif units == "us":
        value = float(value)/pow(10,6)
    elif units == "ns":
        value = float(value)/pow(10,9)
    elif units == "ps":
        value = float(value)/pow(10,12)
    else:
        mlog.error("Didn't recognize warmup units %s", warmup)
        raise StandardError("unrecognized units")
    return value
                 

def simtime_from_file(output_file):
    """
    Reads a file that is the output of a simulation run and looks for the
    line "<!> Simulation time limit reached".
    It then returns the simulation time as reported on that line as a float.
    
    Note: the simtime returned does not include the warmup interval.
    """
    output_file = check_file(output_file)
    lines = open(output_file, 'r').readlines()
    # The line should looke like this:
    # <!> Simulation time limit reached -- simulation stopped at event #3622300, t=0.020000008764.
    find_str = "<!> Simulation time limit reached"
    simtime_line = None
    for line in lines:
        if line[0:len(find_str)] == find_str:
            simtime_line = line
            break
    if simtime_line == None:
        raise StandardError("Could not find the line: ", find_str)
    # Now get the t=XXX portion
    simtime = simtime_line.split()
    simtime = simtime[len(simtime)-1].strip(".").strip("t=")
    return float(simtime)
    
    
def scalar_from_file(sfile, scalar, module=""): #".*"):
    """
    Reads the scalar file in directly and uses regular expression matching to
    find the desired scalar from the file.
    
    - Note the scalar and module will be placed directly in the 
      regular expression string.
    
    - Returns a list in the following form [<module>, <scalar>, <result>]
    """
    mlog.debug("sfile=%s, scalar=%s, module=%s", sfile, scalar, module)
    sfile = check_file(sfile)
    #regexp = "scalar" + "\s*" + module + "\s*" + scalar + ".*"
    #try:
    #    cre = re.compile(regexp)
    #except:
    #    raise StandardError("Invalid expression: ", regexp)
    
    matches = []
    #with open(sfile) as f:
    #    for line in f:
    #        if cre.match(line):
    #            #matches = [line.split() for line in lines if cre.match(line)]
    #            m = line.split()
    #            matches.append([m[1], m[2], m[3]])
    
    # Alternative is about twice as fast as when using regexp   
    with open(sfile) as f:
        for line in f:
            if scalar in line:
                if module in line and "scalar" in line:
                    m = line.split()
                    matches.append([m[1], m[2], m[3]])                        
                #matches = [line.split() for line in lines if cre.match(line)]
                                
    #lines = open(sfile, 'r').readlines()    
    #matches = [line.split() for line in lines if cre.match(line)]
    #return [[m[1], m[2], m[3]] for m in matches]
    return matches


def statistic_from_file(sfile, stat_name, stat_field, module=""):
    """Reads the scalar file and returns the requested field from the
    statistic matching the module.
    
    - This currently only supports direct string matching. So, to 
      match any module, just leave module == "".
    
    The output is in the form:
    [[<module>, <stat_name>, <stat_field>, <value>], ...]
    """
    mlog.debug("sfile=%s, stat_name=%s, stat_field=%s, module=%s",
               sfile, stat_name, stat_field, module)
    matches = []
    sfile = check_file(sfile)
    current_stat = None
    with open(sfile) as f:
        for line in f:
            if current_stat:
                if stat_field in line:
                    # Found the field
                    field = line.split()
                    current_stat.extend([field[1], field[2]])
                    matches.append(current_stat)
                    current_stat = None
                continue
            if not stat_name in line:
                continue
            if not module in line:
                continue
            # If we got here, the line contains the name histogram
            # The line should look something like this:
            # name=statistic FatTree_16_8_3.Server_0_0_3.simpleUDPApplication.stream_1018->3 streamRxLatency:stats
            stat = line.split()
            # Should now look like:
            # ['name=statistic', 'FatTree_16_8_3.Server_0_0_3.simpleUDPApplication.stream_1018->3', 'streamRxLatency:stats']
            current_stat = [stat[1], stat[2]] 
    if len(matches) == 0:
        mlog.warn("No statistics found in file %s that match stat_name=%s, "
                  "stat_field=%s, module=%s", sfile, stat_name, stat_field, module)
    return matches


def vector_from_file(vfile, vector, module=".*"):
    """ Returns the desired vector results from the file.
    The result is returned as a dictionary indexed by the names of matching
    modules.

    The entry corresponding to the matching result is a list of tuples.
    Each tuple is a datapoint and consists of the time stamp and result.
    
    Note: currently, we assume a module has only one matching vector.
    
    The returned result looks like this:
    {'module1' = [(time1, value1), (time2, value2), ...], ... }
    """
    mlog.debug("vfile=%s, scalar=%s, module=%s", vfile, vector, module)
    vfile = check_file(vfile)
    # Format of the vector file:
    #vector 656  FatTree_4_2_3.Server_0_0_0.simpleUDPApplication.stream_0->8  streamTxBytes:vector  ETV
    #attr interpolationmode  none
    #attr title  "Bytes sent in the stream, vector"
    #attr unit  bytes
    if not os.path.exists(vfile):
        raise StandardError("Vector file not found: ", vfile)
    regexp = "vector" + "\s*" + module + "\s*" + vector + ".*"  
    try:
        cre = re.compile(regexp)
    except:
        raise StandardError("Invalid expression: ", regexp)
    lines = open(vfile, 'r').readlines()
    vec_num = ""
    mod_results = {}
    matching_vecs = {}
    # Find modules that match and their associated vector number
    for line in lines:
        if cre.match(line):
            vec_num = line.split()[1]
            module = line.split()[2]
            matching_vecs[vec_num] = module
            mod_results[module] = []
    if len(matching_vecs) == 0:
        mlog.error("Vector not found in file %s! Expecting %s", vfile, vector)
        raise StandardError("Vector not found!")
    # For each matching module, collect the results
    cre2 = re.compile("[0-9]+\s")
    module = ""
    vec_num = -1 # an invalid vector number
    for line in lines:
        if cre2.match(line):
            result = line.split()
            if vec_num != result[0]:
                if not result[0] in matching_vecs:
                    continue
                else:
                    vec_num = result[0]
                    module = matching_vecs[vec_num]
            # result[1] is just the result's index in the vector
            mod_results[module].append(tuple([result[2], result[3]]))
    return mod_results


def modules_with_vector(vfile, vector, module=".*"):
    """
    Returns a list of modules that match the vector.
    
    """
    vfile = check_file(vfile)
    if not os.path.exists(vfile):
        raise StandardError("Vector file not found: ", vfile)
    regexp = "vector" + "\s*" + module + "\s*" + vector + ".*"
    try:
        cre = re.compile(regexp)
    except:
        raise StandardError("Invalid expression: ", regexp)
    modules = [line.split()[2] for line in open(vfile, 'r').readlines() if cre.match(line)]
    return modules


def scalars_in_file(sfile):
    """
    Returns the list of scalars in the file as reported by scavetool.
    File can be either a scalar or a vector file.
    """
    sfile = check_file(sfile)
    cmd = "scavetool list " + sfile
    output, error = shell(cmd)
    if not error == None:
        raise StandardError("Failed running command", cmd)
    return output
    

def strip_parameter_units(parameters):
    """ Expects a list of parameters. Will simply strip off known units.
    Will not attempt to convert units."""
    # Quick and dirty
    new_parameters = []
    for p,v in parameters:
        for u in allUnits: # a global defined up top
            if v.rfind(u) != -1:
                v = v.strip(u)
        v = v.rstrip() # Strip any white space left over
        new_parameters.append((p,v))
    return new_parameters               

    
def units_present(parameters):
    """ Uses regular expressions to check whether units are present.
    Accepts several forms of input:
    - A dictionary of paramter-value pairs: 
      E.g. {('par1', 'val1'), ('par2', 'val2') ...}
    - A list of parametr value-pairs: 
      E.g.   [('par1', 'val1'), ('par2', 'val2')]
      or ... [['par1', 'val1'], ['par2', 'val2']]
    - A list of values (or any strings):
      E.g. ['val1', 'val2', ...]
    """
    if type(parameters) is dict:
        mlog.debug("Option 1: dictionary of parameter-value pairs")
        pvals = [v[0] for v in parameters.values()]
    elif type(parameters) is list or tuple:
        if type(parameters[0]) is list or tuple:
            mlog.debug("Option 2: A list of parametr value-pairs")
            pvals = [v for p,v in parameters]
        else:
            mlog.debug("Option 3: A list of values (or any strings)")
            pvals = parameters
    else:
        mlog.error("Unrecognized input: %s", parameters)
    for v in pvals:
        if RE_ALL_UNITS.search(v):
            return True
    return False
    
def parameters_in_file(rfile, strip_units=False):
    """ Returns the parameter names and their associated value as tuples.
    i.e. (('param1':'val1'), ('param2', 'val2'))
    
    The specified file can be either a .sca or .vec file.
    
    Notice that the values are left as strings.
    """
    # The line is of the following format: 
    # attr iterationvars "$param1=value1, $param2=value2" ...
    attribs = "attr iterationvars "
    regexp = re.compile(attribs)
    rfile = check_file(rfile)
    # Only expecting one line to match but this line may have multiple
    # parmaters separated by spaces in the form of "par=val".
    with open(rfile) as f:
        for line in f:
            if regexp.match(line):
                par_list = line.lstrip(attribs).strip("\"").split(',')
                break
    if len(par_list) == 0:
        mlog.error("Attribute line not found! file=%s", rfile)
        raise StandardError("Attribute line not found!")
    pars = [p.strip().lstrip("$").strip("\"").split("=") for p in par_list]
    if pars == [['']]:
        mlog.warn("No parameters found in file %s!", rfile)
        return None
    #pars = [p.lstrip("$").rstrip(",").split("=") for p in par_list[0]]
    pars = [(p[0], p[1]) for p in pars]
    if strip_units:
        return tuple(strip_parameter_units(pars))
    return tuple(pars)


def results_files_in_experiment(base_file_name, result_dir=None):
    #regexp = re.compile(base_file_name+"-[0-9]*.((sca)|(vec))")    
    #files = [file for file in os.listdir(os.curdir) if regexp.match(file)]
    #decorated = [(int(i[len(base_file_name)+1:len(i)-4]), i) for i in files]
    #decorated.sort()
    #files = [file for num, file in decorated]
    return (scalar_files_in_experiment(base_file_name, result_dir=result_dir), 
            vector_files_in_experiment(base_file_name, result_dir=result_dir))


def output_files_in_experiment(base_file_name, result_dir=None):
    # Also works if runnumber is missing, allows .txt extension
    if result_dir == None:
        result_dir = check_dir(os.curdir)
    regexp = re.compile(base_file_name+"-[0-9]*_output(.txt)?")
    files = [f for f in os.listdir(result_dir) if regexp.match(f)]
    if len(files) == 1:
        return files # should happen if runnumber is missing
    decorated = [( int(i.strip(base_file_name+"-").strip(".txt").strip("_output")) , i) for i in files]
    decorated.sort()
    files = [f for num, f in decorated]
    return files


def vector_files_in_experiment(base_file_name, result_dir=None):
    if result_dir == None:
        result_dir = check_dir(os.path.join(os.path.curdir(), base_file_name)) 
    regexp = re.compile(base_file_name+"-[0-9]*.vec")
    files = [f for f in os.listdir(result_dir) if regexp.match(f)]
    if len(files) == 0:
        return []
    # Use decorator idiom to sort files using the number portion of the name.
    decorated = [(int(i[len(base_file_name)+1:len(i)-4]), i) for i in files]
    decorated.sort()
    files = [f for num, f in decorated]
    return files


def scalar_files_in_experiment(base_file_name, result_dir=None):
    """ Returns a sorted list of files in the current directory that match
    the form base_file_name-[0-9]*.sca.
    The dictionary contains the parameters names and a list of their values.
    i.e. {'param1': ['value1', 'value2'], 'param2': ['value3', 'value4']}
    """
    # If no result_dir specified, assume the current directory
    if result_dir == None:
        result_dir = check_dir(os.curdir) 
    regexp = re.compile(base_file_name+"-[0-9]*.sca")
    files = [f for f in os.listdir(result_dir) if regexp.match(f)]
    if len(files) == 0:
        return []
    # Use decorator idiom to sort files using the number portion of the name.
    decorated = [(int(i[len(base_file_name)+1:len(i)-4]), i) for i in files]
    decorated.sort()
    files = [f for num, f in decorated]
    return files


def parameters_in_experiment(base_file_name, result_dir=None, strip_units=False):
    """Reads from all scalar files that match the form base_file_name-[0-9]*.sca
    and returns the following:
    
    - If no result_dir is specified, assumes results are in the current dir.
      I.e. expects that experiment is in "./base_file_name". 
    
    - parameters: An ordered tuple of the parameter names.
    e.g. ('par1', 'par2', ...)
    
    - parameter_values: A dictionary of the parameter values indexed by their name.
    e.g. {'par1': ['val1', 'val2', ...], 'par2': ['val1', 'val2', ...], ...}
    
    - simulations: A dictionary of the files indexed by their parameter values.
    e.g. {(('par1', 'val1'), ('par2', 'val2'), ...): [file1, file2, ...]}
    """
    if result_dir == None:
        result_dir = check_dir(os.curdir)
    curpath = os.path.abspath(os.curdir)
    os.chdir(result_dir)
    mlog.info("Getting list of scalar files in %s with base file name %s", result_dir, base_file_name)
    files = scalar_files_in_experiment(base_file_name, result_dir=result_dir)
    mlog.info("%d scalar files found", len(files))
    # Check just the first file to see what parameters are in this experiment
    # Expect that files contains just the basenames
    #sfile = os.path.join(result_dir, os.path.basename(files[0])
    if (files == None or len(files) == 0):
        mlog.error("No scalar files found for config %s in dir %s!", base_file_name, result_dir)
        raise StandardError("No files found!")
    # Get the first file to check for parameters
    sfile = files[0]
    parameters = parameters_in_file(sfile, strip_units=strip_units)
    if units_present(parameters):
        if strip_units:
            mlog.error("Units are still present! %s", parameters)
        else:
            mlog.warn("Units are presenet in parameter values. No conversions performed. %s\n", parameters)
    parameters = tuple([p[0] for p in parameters])
    simulations = {}
    parameter_values = {}
    mlog.info("Getting parameters and values from scalar files...")
    for f in files:
        #f = os.path.join(result_dir, os.path.basename(f))
        pars = parameters_in_file(f, strip_units=strip_units)
        if not pars in simulations:
            simulations[pars] = [f]
        else:
            simulations[pars].append(f)
        if not pars:
            continue
        for k, v in pars:
            if not k in parameter_values:
                parameter_values[k] = [v]                
            else:
                if v not in parameter_values[k]:
                    parameter_values[k].append(v)
    os.chdir(curpath)                
    return parameters, parameter_values, simulations

def missing_intervals_in_path(config_dir, runs_total):
    """ Examines the specified path and returns a BatchIntervalSet containing any
    missing intervals of runs."""
    total = BatchIntervalSet()
    total.add_batch(0, runs_total)
    completed = completed_intervals_in_path(config_dir)
    return total.difference(completed)

def completed_intervals_in_path(config_dir):
    """ Examines the specified path for the intervals that have completed.
    The return value is a BatchIntervalSet containing the completed intervals.
    """
    # Currently just checks scalar and zip files
    completed_zip = completed_intervals_zipped(config_dir)
    completed_scalars = completed_intervals_scalar(config_dir)
    completed = BatchIntervalSet()
    completed.add_batch_interval_set(completed_scalars)
    completed.add_batch_interval_set(completed_zip)
    return completed

def completed_intervals_zipped(config_dir):
    """ Determines how many runs the folder contains based on the names of the zip files.
    Expects the zip files to be named according to the following convention:"""
    expected_format = "<host_name>_<config>_<offset>_<offset+runs>.zip"
    completed = BatchIntervalSet()
    cur_dir = os.curdir
    os.chdir(config_dir)
    zip_files = glob.glob("*.zip")
    for f in zip_files:    
        parts = f.split(".zip")[0].split("_")
        try:
            upper = int(parts[-1])
            lower = int(parts[-2])
            runs = upper-lower
            mlog.debug("%s has interval [%d, %d)", f, lower, upper)
            completed.add_batch(lower, runs)
        except:
            mlog.warn("Ignoring zip file %s because it does not match expected format: %s", f, expected_format)
    os.chdir(cur_dir)
    return completed

def completed_intervals_scalar(config_dir):
    """ Determines how many runs the folder contains based on the names of the scalar files.
    Expects the files to be named according to the following convention:"""
    expected_format = "<config>-<run_number>.sca"
    completed = BatchIntervalSet()
    cur_dir  = os.curdir
    os.chdir(config_dir)
    scalar_files = glob.glob("*.sca")
    for f in scalar_files:    
        try:
            parts = f.split(".sca")[0].split("-")
            run = int(parts[-1])
            completed.add_batch(run, 1)
        except:
            mlog.warn("Ignoring scalar file %s because it does not match expected format: %s", f, expected_format)
    os.chdir(cur_dir)
    return completed


if __name__ == '__main__':
  if len(sys.argv) == 2:
    if (sys.argv[1].strip().lower() == "list"):
      print "functions"
      print dir()
      exit()
  print globals()['__doc__']


