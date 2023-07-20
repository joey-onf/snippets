#!/bin/bash

split_me='foo : bar : tans : fans'

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function split_with_read_ifs()
{
    echo "** ${FUNCNAME[1]}: Read with IFS="
    set -x
    IFS=':' read -r val string <<< "$split_me"
    set +x
    declare -p val
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function split_with_cut()
{
    echo "** ${FUNCNAME[1]}: Cut on 1st delimiter"
    set -x
    val="$(cut -d':' -f1 <<< "$split_me")"
    set +x
    declare -p val
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
split_with_read_ifs
split_with_cut

# [EOF]
