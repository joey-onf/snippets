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
    while [[ $# -gt 0 ]]; do
	local ga_arg="$1"; shift

	case "$ga_arg" in

	    '--help')
		cat <<EOH
Usage: ${FUNCNAME[0]}
  --contains     Conditional, if contains element
  --readarray    Command usage

EOH
		;;
	    *'contains')
		tmp+=("$dir/contains/if_contains_element.sh")
		;;
	    
	    '--readarray')
		readarray -t buffer < <(find "$dir/readarray" -type f -print)
		tmp+=("${buffer[@]}")
		;;

	    *)
		# [src] main/getopt/parse_args.sh
		handle_switch "$fyl" "$dir" tmp
		;;
	esac
    done

    ref+=("${tmp[@]}")
    return
}

: # Assign ($?=0) for source $script
# [EOF]
