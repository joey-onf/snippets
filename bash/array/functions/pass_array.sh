#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Remove null elements from an array
# -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    echo "ERROR ${FUNCNAME[1]}: $@"
    exit 1
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function by_ref()
{
    local -n ref=$1; shift

    echo "${FUNCNAME} called"
    ref+=('foo' 'bar')
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function by_literal()
{
    local -n ref=$1; shift
    local -a extra=$1; shift

    echo "${FUNCNAME} called"
    ref+=("${extra[@]}")
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

declare -a data+=('abc' '123')
by_ref data
[[ ${#data[@]} -ne 4 ]] && { error "Deteted invalid array $(declare -p data)"; }

declare -a data=('abc' '123')
by_literal data "('def' '456')"
[[ ${#data[@]} -ne 4 ]] \
    && { error "Deteted invalid array $(declare -p data)"; }

[[ "${data[@]}" != "abc 123 def 456" ]] \
    && { error "Deteted invalid array $(declare -p data)"; }


# [EOF]
