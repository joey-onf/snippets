#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Load --array sample code for viewing
## -----------------------------------------------------------------------
function getopts_array()
{
    local arg="$1"  ; shift
    local dir="$1"  ; shift
    local -n ref=$1 ; shift

    local -a tmp=()
    case "$arg" in
        *'contains') tmp+=("$dir/contains/if_contains_element.sh") ;;
        *) handle_switch "$fyl" "$dir" tmp ;;
    esac

    ref+=("${tmp[@]}")
    return
}

: # Assign ($?=0) for source $script
# [EOF]
