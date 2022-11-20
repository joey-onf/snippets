# -*- python -*-
"""Script command line argument parsing.

..todo: https://docs.python.org/3/library/argparse.html##
"""

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
ARGV      = None
namespace = None

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import argparse
import pprint

from tmpl.main         import utils              as main_utils
from tmpl.main         import argparse_actions   as ar_ac

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
def get_argv():
    """Retrieve parsed command line switches.

    :return: Parsed command line argument storage
    :rtype : dict

    .. versionadded:: 1.0
    """

    global ARGV
    global namespace

    if ARGV is None:
        # Normalize argspace/namespace into a getopt/dictionary
        # Program wide syntax edits needed: args['foo'] => args.foo
        arg_dict = {}
        for arg in vars(namespace):
            arg_dict[arg] = getattr(namespace, arg)
        ARGV = arg_dict

    return ARGV

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
def getopts(argv, debug=None) -> None:
    """Parse command line args, check options and pack into a hashmap

    :param argv: values passed on the command line
    :param debug: optional flag to enable debug mode

    :return: Digested command line arguments
    :rtype : dict

    :raises  ValueError

    ..note: A dictionary is returned for backward compatibility.
    ..note: arg syntax should change from foo['debug'] to foo.debug
    ..note: allowing raw library return type(namespace) to be used.

    ..todo: support --dry-run, deploy actions w/o final import request.

    ..todo: Strange decorate a switch with required=True.  Pass switch through
    ..todo: --response fails even though value(s) are in parsed args namespace.

    .. versionadded:: 1.1
    """

    global namespace

    iam = main_utils.iam()

    if debug is None:
        debug = False

    parser = argparse.ArgumentParser\
             (
                 # prog = 'foobar.py',
                 description = 'Do something useful',
                 # epilog = 'extra-help-text'
                 epilog=\
'''
'''                 
             )

    ## -----------------------------------------------------------------------
    ## SECTION: Arg storage methods
    ## -----------------------------------------------------------------------
    parser.add_argument('--my-bool',
                        action  = 'store_true',
                        default = False,
                        help    = 'Store a booelan argument value.',
                    )

    parser.add_argument('--my-list',
                        action  = 'append',
                        default = [],
                        help    = 'Accumulate arguments in a list',
                    )
    parser.add_argument('--my-scalar',
                        action  = 'store',
                        default = None,
                        help    = 'Save argument as a scalar variable.',
                    )
  
    ## ----------------------------------------------------------------------
    ## SECTION: Validate arg values and store
    ## -----------------------------------------------------------------------
    parser.add_argument('--my-host',
                        action  = 'append',
                        default = [],
                        type    = ar_ac.valid_hostname,
                        help    = 'Hostname(s) to perform actions on.',
                    ) 

    parser.add_argument('--my-file',
                        action  = 'append',
                        default = [],
                        type    = ar_ac.valid_spreadsheet,
                        help    = 'File path for IO.',
                    )

    parser.add_argument('--my-url',
                        action  = 'append',
                        default = [],
                        type    = ar_ac.valid_url,
                        help    = 'URL(s) to perform actions on.',
                    ) 

    ## -----------------------------------------------------------------------
    ## SECTION: Program modes
    ## -----------------------------------------------------------------------
    parser.add_argument('--debug',
                        action  = 'store_true',
                        default = False,
                        help    = 'Enable script debug mode',
                    )

    parser.add_argument('--todo',
                        action  = ar_ac.opt_todo_action,
                        # type    = ar_ac.valid_hostname,
                        help    = 'Display program enhancement list.',
                    )

    parser.add_argument('--trace',
                        action  = 'append',
                        default = [],
                        help    = 'Resource names to trace during system probing',
                    )

    parser.add_argument('--trace-all',
                        action  = 'store_true',
                        default = False,
                        help    = 'Enable full time tracing for probes',
                    )

    parser.add_argument('--verbose',
                        action  = 'store_true',
                        default = False,
                        help    = 'Enable script verbose mode',
                    )
    
    ## -----------------------------------------------------------------------
    ## SECTION: Program version - increment when script changes
    ## -----------------------------------------------------------------------
    parser.add_argument('--version', action='version', version='%(prog)s 0.1')

    namespace = parser.parse_args()
    return

# [EOF]
