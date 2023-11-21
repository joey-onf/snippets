#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Example of array join on delimiter
# -----------------------------------------------------------------------

function error()
{
    echo "ERROR: $@"
    exit 1
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function readarray_from_file
{
    readarray -t stream < 'data.txt'
    declare -p stream
    [[ ${#stream[@]} -ne 3 ]] && error "Expected 3 lines found ${stream[@]}"
    return
}
    
##----------------##
##---]  MAIN  [---##
##----------------##

readarray_from_file

# [EOF]
