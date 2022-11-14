#!/bin/bash
## ---------------------------------------------------------------------------
## Intent: Command line arg parsing w/o dependencies
## ---------------------------------------------------------------------------

# export __DEBUG__=1
[[ -v __DEBUG__ ]] && echo " ** ${BASH_SOURCE[0]}: ENTER"

## ---------------------------------------------------------------------------
## ---------------------------------------------------------------------------
function __anon_func__()
{
    # declare -a argv=("$@")
    declare -g -A ARGV=(\
			['debug']=0
			['trace']=0
			['verbose']=0
    )
    
    while [ $# -gt 0 ]; do
	local arg="$1"; shift

	case "$arg" in

	    -s|-*src)  ARGV['src']="$1"; shift ;;
	    -d|-*dst)  ARGV['dst']="$1"; shift ;;

	    -i|-*int)
		declare -i val=$1; shift
		ARGV['int']=$val  # no quotes else string
		;;

	    # [MODES]
	    -d|-*debug)   ARGV['debug']=1 ;;
	    -t|-*trace)   ARGV['trace']=1 ;;
	    -v|-*verbose) ARGV['verbose']=1 ;;

	    -h|-*help)
		pgmdir="${BASH_SOURCE[0]%/*}"
		source "${pgmdir}/help.sh"
		;;

	    *) echo "[SKIP] Unhandled argument [$arg]" ;;
	esac
    done

    [[ ARGV['trace'] -ne 0 ]] && set -x
    [[ ARGV['debug'] -ne 0 ]] && echo " ** ${BASH_SOURCE[0]}: $(declare -p ARGV)"
    [[ ARGV['trace'] -ne 0 ]] && set +x

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

# preserve_argv.sh # push @ARGV

__anon_func__ "$@"
unset __anon_func__

# preserve_argv.sh # pop @ARGV

[[ -v __DEBUG__ ]] && echo " ** ${BASH_SOURCE[0]}: LEAVE"

: # NOP - exit status success

## [SEE ALSO]
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

# [EOF]
