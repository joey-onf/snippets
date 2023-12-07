#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Remove null elements from an array
# -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function squeeze()
{
    local -n ref=$1; shift

    ## FIX HARDCODED REFERENCES
    ## local -n vars were hokey

    local -a raw=("${ref[@]}")
    local -a squeeze_tmp=()
    local val
    for val in "${raw[@]}";  # why does ref_src[@] return raw ?!?
    do
        [[ ${#val} -eq 0 ]] && continue
        [[ "$val" =~ ^[[:blank:]]*$ ]] && continue
        squeeze_tmp+=("$val")
    done

    ref=("${squeeze_tmp[@]}")
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

declare -a data=()
data+=('a' '' '    ' 'z')
declare -p data
squeeze data
declare -p data
