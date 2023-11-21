#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Example of array join on delimiter
# -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Helper method
## -----------------------------------------------------------------------
## Usage : local path="$(join_by '/' 'lib' "${fields[@]}")"
## -----------------------------------------------------------------------
function join_by()
{
    local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi;
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function join_on_delimiter()
{
    local path='/foo/bar/tans/fans'

    ## Here strings implicitly insert a newline
    echo
    echo " ** Here strings are a problem, implicitly insert newline"
    local path="/foo/bar/tans/fans"
    readarray -t -d '/' fields <<<"$path"
    declare -p fields

    echo
    echo "** Use printf() rather than here strings"
    readarray -t -d '/' fields < <(printf '%s' "$path")
    declare -p fields

    echo
    echo "** Construct path augmented with prefix lib/"
    local path="$(join_by '/' 'lib' "${fields[@]}")"
    declare -p path

    return
}
    
##----------------##
##---]  MAIN  [---##
##----------------##

join_on_delimiter

# [EOF]
