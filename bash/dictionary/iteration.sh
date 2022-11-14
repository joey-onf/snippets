#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Iterate over key/value pairs in an associative array.
## -----------------------------------------------------------------------

set -eu -o pipefail

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function iterate_by_key_value()
{
    declare -A dict=(\
		     ['a1']='b2'
		     ['c3']='d4'
		     ['e5']='f6'
		     ['g7']='h8'
		    )
 
    local key
    for key in "${!dict[@]}";
    do
	local val="${dict[$key]}"
	echo "dict[$key] = $val"
    done
}

##----------------##
##---]  MAIN  [---##
##----------------##
iterate_by_key_value

# [EOF]
