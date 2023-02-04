#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Determine if a function exists by name.
## Return:
##   scalar (bool):
##     true if string argument is a function name
##     false otherwsie
## -----------------------------------------------------------------------
function is_func()
{
    local arg="$1"; shift

    [[ $# -gt 0 ]] && echo "** $*"
    [[ $(type -t "$arg") == function ]] && { true; } || { false; }
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

# Test: positive, function should exist.
name='is_func'
if is_func "$name";
then
    echo "** is_func($name) test: PASSED"
else	 
    echo "** is_func($name) test: FAILED"
    exit 1
fi

# Test: positive, function should not exist.
name='invalid_func_name'
if is_func "$name";
then
    echo "** is_func($name) test: PASSED"
else	 
    echo "** is_func($name) test: FAILED"
    exit 1
fi

# [EOF]
