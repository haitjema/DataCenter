#!/usr/bin/env python
import logging
import os
import sys

from scipy import stats

sys.path.append("../../processing_scripts/")
import processing_functions as pf

LOGGING_LEVELS = {'critical': logging.CRITICAL,
                  'error': logging.ERROR,
                  'warning': logging.WARNING,
                  'info': logging.INFO,
                  'debug': logging.DEBUG}


mlog = logging.getLogger('simulations.configurations.LoadBalancing')


def throughput_from_file(scalar_file, use_link_layer=True):
    """
    Extracts the stream statistics from the file and returns the average and
    minimum stream throughput.
    
    - The use_link_layer option determines whether to use statistics recorded at
      the server's link layer or the application layer.
    """
    scalar_file = pf.check_file(scalar_file)
    mlog.debug("scalar_file = %s", scalar_file)
    if use_link_layer:
        module = "port_queue.stream"
    else:
        module = "simpleUDPApplication.stream" 
    #module = ".*stream.*"
    #module = "stream"
    tx_scalar = "streamTxBytes:sum"
    rx_scalar = "streamRxBytes:sum"
    tx_scalar_values = pf.scalar_from_file(scalar_file, tx_scalar, module)
    rx_scalar_values = pf.scalar_from_file(scalar_file, rx_scalar, module)
    
    try:
        streams = match_streams(tx_scalar_values, rx_scalar_values)
    except:
        mlog.error("Failed to match streams in file: %s", scalar_file)
        raise
    throughputs = [v[2] for v in streams.itervalues()]
    if not len(throughputs) > 0:
        mlog.error("Couldn't get throughput from file %s!", scalar_file)
        raise StandardError("Couldn't process file")
    #mlog.debug("throughputs = %s", throughputs)
    avg_thr = stats.tmean(throughputs)
    min_thr = min(throughputs)
    return avg_thr, min_thr


def match_streams(tx_scalars, rx_scalars, ignore_missing_rx=True):
    """
    Returns a dictionary of streams in the following form
    streams[stream] = [tx, rx, throughput]

    This should work:
    >>> tx_scalars = [['FatTree_4_2_3.Server_0_0_0.simpleUDPApplication.stream_0->1', 'streamTxBytes:sum', '1000'], ['FatTree_4_2_3.Server_0_0_1.simpleUDPApplication.stream_1->2', 'streamTxBytes:sum', '2000']]
    >>> rx_scalars = [['FatTree_4_2_3.Server_0_0_1.simpleUDPApplication.stream_0->1', 'streamRxBytes:sum', '1000'], ['FatTree_4_2_3.Server_0_0_2.simpleUDPApplication.stream_1->2', 'streamTxBytes:sum', '2000']]
    >>> match_streams(tx_scalars, rx_scalars)
    {'stream_0->1': [1000.0, 1000.0, 1.0], 'stream_1->2': [2000.0, 2000.0, 1.0]}

    This should not:
    >>> rx_scalars[1] = ['FatTree_4_2_3.Server_0_0_2.simpleUDPApplication.stream_2->3', 'streamTxBytes:sum', '2000']
    >>> match_streams(tx_scalars, rx_scalars)
    Traceback (most recent call last):
    KeyError: 'stream_2->3'
    """
    #mlog.debug("tx_scalars=%s, rx_scalars=%s", tx_scalars, rx_scalars)
    if len(rx_scalars) != len(tx_scalars):
        if ignore_missing_rx and (len(tx_scalars) > len(rx_scalars)):
            mlog.warn("There are %d streamTxBytes:sum but only %d streamRxBytes:sum records!", len(tx_scalars), len(rx_scalars))
        else:
            mlog.error("Different number of streamTxBytes:sum (%d) and "
                      "streamRxBytes:sum (%d) found!", len(tx_scalars), len(rx_scalars))   
            raise StandardError("Different number of streams!")
    # Produce a dictionary of streams in the following form
    # streams[stream] = [tx, rx, throughput]
    streams = {}
    for val in tx_scalars:
        stream = stream_from_module(val[0])
        streams[stream] = [float(val[2]), 0.0, 0.0]
    for val in rx_scalars:
        stream = stream_from_module(val[0])
        streams[stream][1] = float(val[2])

    missing_rx_count = 0

    for v in streams.itervalues():
        if v[0] == 0:
            v[2] = 0
            mlog.warn("stream TX is 0! %s", v)
        elif not (v[1] > 0):
            missing_rx_count += 1
        else:
            v[2] = v[1]/v[0]
    if missing_rx_count:
        mlog.warn("%d streams had no rx values.", missing_rx_count)
    return streams


def stream_from_module(module):
    """
    Returns the stream name from the full module string.
    
    >>> stream_from_module("FatTree_4_2_3.Server_0_0_0.simpleUDPApplication.stream_0->8")
    'stream_0->8'
    """
    stream = module.rsplit('.',1)[1] # Remove the module name portion
    #ijpart = stream.rsplit('_', 1)[1] # Isolate the i<->j part
    #ij = ijpart.split('->')
    #return [stream, int(ij[0]), int(ij[1])]
    return stream
