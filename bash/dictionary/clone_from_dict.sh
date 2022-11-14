#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Clone an associative array into a new shell variable
## -----------------------------------------------------------------------

set -eu -o pipefail

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function dictionary_clone()
{
    declare -A src=(['foo']='foo1' ['bar']='bar1')
    declare -A dst=$(declare -p src)
    
    declare -p src
    declare -p dst
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
dictionary_clone

# [EOF]
