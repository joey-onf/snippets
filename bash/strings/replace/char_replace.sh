#!/bin/bash
## -----------------------------------------------------------------------
## Intent: String removal
## -----------------------------------------------------------------------

##------------------##
##---]  GLOBAL  [---##
##------------------##
set -euo pipefail
shopt -s extglob # enable extended globbing

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"
    echo "$iam ERROR: $*"
    exit 1
}

## -----------------------------------------------------------------------
## Intent: Remove string suffix using bash builtin, shortest string
##         removal from end-of-string.  Loop and display until string
##         stem is found.
## -----------------------------------------------------------------------
function remove_dots()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"

    local val='aa.bb.cc.dd.ee.ff'
    cat <<EOEX

=======================================================================
** Example: $iam
=======================================================================
  Delimited string: $val
EOEX

    local -i count=10
    while [[ "$val" == *'.'* ]]; do

        [[ "$val" == 'aa' ]] && { break; }
        [[ $count -eq 0 ]] && { error "split failed val=[$val]"; }
        count=$((-1 + $count))

        src="$val"
        val="${val%\.*}"

        printf '    %d) %s\n' "$count" "$val"
    done
    
    return
}

## -----------------------------------------------------------------------
## Intent: Remove hyphen prefix from a switch argument
## -----------------------------------------------------------------------
function remove_prefix()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"

    declare -a raws=()
    raws+=('')
    raws+=('foo-bar')
    raws+=('-foo-bar')
    raws+=('--foo-bar')
    raws+=('---foo-bar')
    raws+=('-')
    raws+=('--')

    cat <<EOX

=======================================================================
** Example: $iam
=======================================================================
  raw: input string
  fmt: {var##(-)  Remove all prefix characters
EOX

    local hyphen='-'
    local raw
    for raw in "${raws[@]}";
    do
        fmt="${raw##+(-)}"
        echo "** raw=[$raw], fmt=[$fmt]"
        [[ "${fmt:0:1}" == '-' ]] && error "Hyphen removal failed: $raw"
    done
    return
}

## -----------------------------------------------------------------------
## Intent: Different sytnax for removal
## -----------------------------------------------------------------------
function remove_hyphen_if()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"

    local switch='--foo-bar+tans-fans'
    cat <<EOEX

=======================================================================
** Example: $iam
=======================================================================
  Switch           :                          ${switch}
  Trim one longest : \${switch##'-'}         = ${switch##'-'}
  Trim by regexpr  : \${switch//-/}          = ${switch//-/}
  Deblank          : \${switch//[[:blank:]]} = ${switch//[[:blank:]]}

  Not working:
    o \${switch##+(-)} = ${switch##+(-)}
    o \${switch##+(+)} = ${switch##+(+)}
EOEX

    return
}

## -----------------------------------------------------------------------
## Intent: Different sytnax for removal
## -----------------------------------------------------------------------
function negative_offset()
{
    local iam="${BASH_SOURCE[0]%*/}::${FUNCNAME[0]}"
    local path='/home/tux/projects/onf_urls/onf_urls/main/core_utils.sh'

    local -i len=${#path}
    idx=$((len - 20))
    idx=$((${#path} - 20))

    cat <<EOEX

=======================================================================
** Example: $iam
**   LEN: $len
**   extract: ${path:0:27}
**   replace: ${path%//main/core_utils.sh/}
=======================================================================

EOEX

    return
}

# @(pattern-list): Matches one of the given patterns.
# string="${string#@(foo|boo)}"

##----------------##
##---]  MAIN  [---##
##----------------##
remove_hyphen_if
remove_prefix
negative_offset
remove_dots

# [SEE ALSO]
# ---------------------------------------------------------------------
# https://mywiki.wooledge.org/BashGuide/Parameters#Parameter_Expansion (extglob)

# [EOF]
