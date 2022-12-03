#!/usr/bin/env python
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
'''Format error messages with pformat().'''

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import sys
import pprint

from datetime import date, datetime
import pytz

import unittest


## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
def format_error(error:bool):

    if error:
        utc = pytz.UTC
        now = utc.localize( datetime.now() )

        msg = pprint.pformat({
            # 'iam'   : main_utils.iam(),
            'error' : 'An error occured',
            'timestamp' : str(now),
        }, indent=4)
        raise ValueError('\n' + msg)

    return True

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
def main(argv_raw):
    '''highlander: there can be only one.'''

    assert format_error(False)

    try:
        format_error(True)
    except ValueError as err:
        print("CAUGHT: %s\n" % err)
    
##----------------##
##---]  MAIN  [---##
##----------------##
if __name__ == "__main__":
    main(sys.argv[1:]) # NOSONAR

# [EOF]
