#!/bin/bash
## ---------------------------------------------------------------------------
## ---------------------------------------------------------------------------

# export __DEBUG__=1
[[ -v __DEBUG__ ]] && echo " ** ${BASH_SOURCE[0]}: ENTER"

## ---------------------------------------------------------------------------
## ---------------------------------------------------------------------------
function __anon_func__()
{
    declare -g -A ARGV

    # TEMP=`getopt -o f:s::d:a:: --long file-name:,source::,destination:,action:: -- "$@"`
    declare -a getopt_args=()
    # getopt_args+=('--options' '{letter_switch_1}:{letter_switch_2}::')
    getopt_args+=('--options' 'd:')
    getopt_args+=('--options' 't:')
    getopt_args+=('--options' 'v:')
    
    # ':'  - required arg
    # '::' - optional arg
    getopt_args+=('--long' 'src:,source::')
    getopt_args+=('--long' 'dst:,destionation::')
    getopt_args+=('--long' 'verbose:::')
    getopt_args+=('--')
    getopt_args+=("$@")

    # read the options
    TEMP=$(getopt "${getopt_args[@]}")
    eval set -- "$TEMP"

    # extract options and their arguments into variables.
    while true ; do
	local arg="$1"; shift
	case "$arg" in
	    --src) ARGV['src']="$1"; shift    ;;
	    --dst) ARGV['dst']="$1"; shift    ;;

	    -d) ARGV['debug']=1               ;;
	    -t) ARGV['trace']=1               ;;
	    -v|--verbose) ARGV['verbose']=1   ;;

            --) break ;;
	    *)
		case "$arg" in
		    -*) echo "[SKIP] Detected unknown switch [$arg]" ;;
		     *) echo "[SKIP] Detected unknown value [$arg]"  ;;
		esac
		exit 1
		;;
	esac
    done

    echo "Args parsed: $(declare -p ARGV)"
    [ $# -gt 0 ] && echo "Args passed: $@"
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
# .. seealso: https://www.tutorialspoint.com/unix_commands/getopt.htm
# .. seealso: https://www.howtogeek.com/778410/how-to-use-getopts-to-parse-linux-shell-script-options/
## -----------------------------------------------------------------------

# [EOF]
