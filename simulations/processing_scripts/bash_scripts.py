import subprocess # for calling bash
import logging # for debugging
import sys, os


def shell(command, arguments=[], echo_command=False, raw_output=False):
    r"""
    Shells the bash command and returns the list of output and error.
    
    - Use optional echo_command prints the command prior to execution.
    
    - Use optional raw_output to preven output/error from being split into
      a list of lines with white space removed (i.e. leave as a raw string).
    
    - Common mistake: shell("ls", "-a") will result in two arguments,
      i.e. ["-", "a"]. Be sure to pass any arguments as a list [].
    """
    cmd = command
    for arg in arguments:
      cmd += " " + arg
    if echo_command:
        print cmd
    try:
        p = subprocess.Popen(cmd, shell=True, executable="/bin/bash", 
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        outAndErr = p.communicate()
        output = outAndErr[0]
        error = outAndErr[1]
    except OSError, e:
        print "shell failed:", e
        raise
    # Split the raw output & error strings into a list of lines and remove
    # extra whitespace.
    if not raw_output:
        output = output.rstrip().split('\n')
        error = error.rstrip().split('\n')
        if error == [""]:
            error = None
    return output, error

def getParameterValuesFromExperiment(baseFileName, parameter):
    return shell("getParameterValuesFromExperiment", [baseFileName, parameter])

def getParametersInExperiment(baseFileName):
    return shell("getParametersInExperiment", [baseFileName])

def getFilesWithParameterValue(baseFileName, parameter, value):
    output, err = shell("getFilesWithParameters", [baseFileName, parameter+"=" + str(value)])
    return output
    #files = []
    #files = file in output where os.path.isfile(fname)
    

def getScalarFromFile(file, module, scalar):
    """
    Returns the scalar results from the module.
    
    - The file is a string and can include wildcards.
    
    - The results are returned as a list of lists in the following form:
      [<file>, <module>, <scalar>, <result>]
      ...
    """
    # The stupid scavetool only writes to a file, and insists on adding a .csv
    # if the extension is left off.
    # We can create a temporary file, or a symbolic link with a .csv extension
    # to /dev/stdout.
    if os.path.exists("temp.csv"):
        os.remove("temp.csv") # clean up from last time
    command = "scavetool scalar -p \"module(" + module +") and name(" + scalar + ")\" " + " -O temp.csv " + file# + "; cat temp.csv"
    output, error = shell(command)
    #lines, error = shell(command, echo_command=True)
    if not os.path.exists("temp.csv"):
        raise StandardError("No scavetool output on command:", command)
    lines = open('temp.csv', 'r').readlines()
    del lines[0] # ignore first line which looks like: File,Run,Module,Name,
    values = []
    for line in lines:
        value = line.rstrip("\r").split(',') # partition the 
        #values.append(float(line.rstrip("\r").split(',')[4]))
        values.append(value)
    return values

def getScalarWithGrep(sfile, module, scalar):
    # Instead of using scavetool, simply use grep (may be faster and more convenient)
    # Returns the scalar results in the following form:
    # [<sfile>, <module>, <scalar>, <result>]
    #module = "scalar " + module
    #command = "grep -E \"" + module + "\" " + sfile + " | grep \"" + scalar + "\""
    command = "grep -E 'scalar[[:blank:]]+" + module + "[[:blank:]]+" + scalar +  "' " + sfile
    lines, err = shell(command)#, echo_command=True)
    values = []
    for line in lines:
        value = line.split()
        # first entry in the file is "scalar", replace it with
        # sfile to be consistent with getScalarFromFile
        #value[0] = sfile 
        values.append((value[1], value[2], value[3]))
    return values

def getStreamsInFile(file):
    # Find unique list of module names for modules including the name "stream_"
    command = "grep "+ "stream_" + " " + file + " | awk '{print $2}' | sort -u" # grep, awk, and sort are fast
    return shell(command)



if __name__ != '__main__':
    logging.basicConfig(level=logging.WARNING, 
                        format='%(asctime)s %(levelname)s: %(message)s',
                        datefmt='%Y-%m-%d %H:%M:%S')
