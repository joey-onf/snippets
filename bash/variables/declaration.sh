#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Examples of indirect shell variable use
## -----------------------------------------------------------------------

set -euo pipefail

## -----------------------------------------------------------------------
## Intent: Modify an array through an indirect variable.
##   o Insert a prefix string
## -----------------------------------------------------------------------
function indirect_insert_prefix()
{
    local prefix="$1"; shift

    # declare:
    #   -n  indirect reference
    #   -l  lowercase when values are assigned
    declare -nl pointer="$1"; shift

    echo '** declare -n pointer; pointer[x]=y'
    local key
    for key in "${!pointer[@]}";
    do
	pointer[$key]="${prefix}${pointer[$key]}"
	# echo "KEY:[$key], val=${pointer[$key]}"
    done

    return
}

## -----------------------------------------------------------------------
## Intent: Modify an array through an indirect variable.
##   o Insert a prefix string
## -----------------------------------------------------------------------
function indirect_insert_prefix()
{
    local prefix="$1"; shift

    cat <<EOH

# declare [options] [name[=value]] [name=[value]]..
# local -[aix] [name[=value]]

declare -a foo=()               Declare array foo
declare -i bar=4                Declare scalar bar assigned 4
declare -x DEBUG=1              export DEBUG=1

EOH
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

declare -a values
readarray -t values < <(for i in {1..5}; do echo $(tr -dc '[[:alnum:]]' </dev/urandom|head -c $(( RANDOM %50 + 1 ))); done)

echo "[INDIRECT: array variable]"
indirect_insert_prefix 'modified-' 'values'
declare -p values \
    | tr '=' '\n' \
    | grep \"     \
    | awk -F\" '{print "    "$2}'
echo

examples

# [EOF]
