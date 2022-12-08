#!/usr/bin/env python
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
from random            import randrange
from time              import \
                           gmtime,   \
                           sleep,    \
                           strftime
from timeit            import timeit, Timer

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
def sleeper(loops:int=None):
    '''Iterate: exercise randrange() and sleep().
    
    :param loops: Number of times to iterate and sleep (default=10)
    :type  loops: int
    '''

    if loops is None:
        loops = 10

    for idx in range(1,loops):
        rr = randrange(0, idx)
        print('randrange.sleep(%s)' % rr)
        sleep(rr)

##----------------##
##---]  MAIN  [---##
##----------------##

print("** Exercise randrange() and sleep() with profiling")
seconds = Timer(lambda: sleeper(10))\
    .timeit(number=1)

elapsed = strftime('%H:%M:%S', gmtime(seconds))
print('** ELAPSED: %s' % elapsed)

if False:
    from dis import dis
    dis(sleeper)

# enter = time()
# leave = time()
# seconds = leave - enter

# [EOF]
