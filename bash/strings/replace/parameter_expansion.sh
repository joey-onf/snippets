#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Examples of substring replace
## -----------------------------------------------------------------------

##------------------##
##---]  GLOBAL  [---##
##------------------##
set -euo pipefail

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"
    echo "$iam ERROR: $*"
    exit 1
}

## -----------------------------------------------------------------------
## Intent: Substring replace
## -----------------------------------------------------------------------
function substr_replace()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"

    cat <<SUITE

** -----------------------------------------------------------------------
** IAM: ${FUNCNAME[0]}
** FMT: \${String/pattern/replacement}
** -----------------------------------------------------------------------
SUITE

    declare -a patterns=()
    patterns+=('foo')
    patterns+=('bar')
    patterns+=('BAR')

    patterns+=('Abar')
    patterns+=('barZ')
    patterns+=('AbarZ')
    
    local pattern
    for pattern in "${patterns[@]}";
    do
        local ans="${pattern/bar/\{bar\}}"
        printf 'Replace[%s]: %-8.8s %-s\n' '{var/pat/repl}' "$pattern" "$ans"
    done
    
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
substr_replace

# [SEE ALSO]
# ---------------------------------------------------------------------
# https://linuxsimply.com/bash-scripting-tutorial/string/manipulation/string-replace/

# [EOF]
