#!/usr/bin/env python
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import time

class Foobar():

    enter = None
    leave = None

    ## -----------------------------------------------------------------------
    ## -----------------------------------------------------------------------
    def __init__(self):
        '''Constructor.'''

        print('__init__ called')
        return
    
    ## -----------------------------------------------------------------------
    ## -----------------------------------------------------------------------
    def __del__(self):
        '''Destructor.'''

        print('__del__ called')
        return
    
    ## -----------------------------------------------------------------------
    ## -----------------------------------------------------------------------
    def __enter__(self):
        '''Context mgr: with_statement.'''

        print('__enter__')
        self.enter = time.time()
        return self

    ## -----------------------------------------------------------------------
    ## -----------------------------------------------------------------------
    def __exit__(self, type, value, tb):
        '''Context mgr: with_statement.'''

        print('__exit__')
        self.leave = time.time()
        seconds = self.leave - self.enter
        elapsed = time.strftime('%H:%M:%S', time.gmtime(seconds))
        return

    ## -----------------------------------------------------------------------
    ## -----------------------------------------------------------------------
    def do_something(self):
        '''Method call.'''
        print('do_something called')

##----------------##
##---]  MAIN  [---##
##----------------##
print(" ** EXAMPLE: with_statement")
with Foobar() as temp:
    temp.do_something()

print(" ** EXAMPLE: simple object")
obj = Foobar()
obj.do_something()
    
# [EOF]
