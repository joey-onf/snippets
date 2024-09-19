#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Grep for a regex contained within a file
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Grep for regexpr in file
## -----------------------------------------------------------------------
function get_username()
{
    local -n ref=$1; shift

    if [[ -v SUDO_USER ]]; then
        ref="${SUDO_USER}"
    else
        ref="$(whoami)"
    fi

    return
}

## -----------------------------------------------------------------------
## Intent: Grep for regexpr in file
## -----------------------------------------------------------------------
function get_by_var()
{
    local -n ref=$1; shift

    ref="${SUDO_USER:-$USER}"
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function validate_user()
{
    local user="$1"; shift
    local sudo="$1"; shift

    local -a users=("$user")

    get_username tmp
    users+=("$tmp")
    
    get_by_var tmp
    users+=("$tmp")

    local val
    for val in "${users[@]}"; do
        [[ "$val" != "$user" ]] && error "(user=$user != get_user=$val)"
    done

    return
}


## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function validate_sudo()
{
    local user="$1"; shift
    local sudo="$1"; shift

    export SUDO_USER="$sudo"
    local -a users=("$sudo")

    get_username tmp
    users+=("$tmp")
    
    get_by_var tmp
    users+=("$tmp")

    local val
    for val in "${users[@]}"; do
        case "$val" in  
            "$sudo") echo "val=[$val] matched sudo=[$sudo]" ;;
            *) echo "val=[$val] did-not-match sudo=[$sudo]" ;;
        esac
        # [[ "$val" != "$sudo" ]] && error "(sudo=$sudo != get_user=$val)"
    done

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
validate_user "$USER" 'homer'
validate_sudo "$USER" 'homer'

# export SUDO_USER='invalid'

# [EOF]
