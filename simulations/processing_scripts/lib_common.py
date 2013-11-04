#!/usr/bin/env python
import sys
import os
import logging

from interval import Interval
from interval import IntervalSet

"""This library contains recipes and various methods that are
commonly needed in a variety of Python tasks."""


mlog = logging.getLogger('simulations.lib_common')

# Source: http://code.activestate.com/recipes/577058/
def query_yes_no(question, default="yes"):
    """Ask a yes/no question via raw_input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is one of "yes" or "no".
    """
    valid = {"yes":True,   "y":True,  "ye":True,
             "no":False,     "n":False}
    if default == None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "\
                             "(or 'y' or 'n').\n")


class BatchIntervalSet(IntervalSet):     
    def add_interval(self, interval):
        list_type = type([])
        if type(interval) == list_type:
            new_int = Interval(interval[0],interval[1], upper_closed=False)
        else:
            new_int = Interval(interval.lower_bound, interval.upper_bound, upper_closed=False)
        self.add(new_int)
    
    def add_batch_interval_set(self, BIS):
        for interval in BIS.intervals:
            self.add_interval(interval)
    
    def add_batch(self, offset, runs):
        i = Interval(offset, offset + runs)
        i.upper_closed = False
        self.add(i)
    
    def take_interval_of_size(self, size):
        if len(self.intervals) == 0:
            return Interval(0,0)
        b = self.intervals[0]
        b_size = self._interval_size(b)
        rem_batch = Interval(b.lower_bound, b.upper_bound, lower_closed=b.lower_closed, upper_closed=b.upper_closed)
        new_size = min(size, b_size)
        rem_batch.upper_bound -= b_size - new_size 
        if b.lower_closed:
            new_batch = Interval(b.lower_bound, b.lower_bound + new_size, upper_closed=False)
        else:
            new_batch = Interval(b.lower_bound, b.lower_bound + new_size + 1, upper_closed=False)
        self.remove(rem_batch)
        return new_batch
    
    def take_batch(self, max):
        b = self.take_interval_of_size(max)
        return b.lower_bound, self._interval_size(b)
    
    def size(self):
        return sum([self._interval_size(i) for i in self.intervals])
    
    def _interval_size(self, i):
        size = (i.upper_bound - i.lower_bound)
        if i.lower_closed and i.upper_closed:
            size += 1 
        elif i.lower_closed and i.upper_closed:
            size -= 1
        return size