#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Select a random list element
## -----------------------------------------------------------------------

set -euo pipefail

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function get_random_element()
{
    local varname="$1"; shift

    echo "readarray -t users < <(cut -d':' -f1 /etc/passwd)"
    readarray -t users < <(cut -d':' -f1 /etc/passwd)
    # declare -p users

    local count=${#users[@]}    
    local index=$(($RANDOM % $count))
    local val="${users[$index]}"
    declare -p val
    # typeset "${varname}=${val}"
    eval "${varname}=${val}"
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
user=''
get_random_element 'user'
declare -p user
echo "Random user is: $user"

# [EOF]
