#!/bin/bash

# https://stackoverflow.com/questions/27456950/bash-indirect-reference-to-an-associative-array

## -----------------------------------------------------------------------
## Intent: Load URLs into a browser.
## -----------------------------------------------------------------------
function do_urls()
{
    declare -nl pointer="$1"; shift
    [ ${#pointer[@]} -eq  0 ] && return
    
    [[ -v DEBUG ]] && echo " ** ${FUNCNAME[0]}: $# $*"

    declare -a args=()
    local key
    for key in "${!pointer[@]}"
    do
	local url="${pointer[$key]}"
	args+=('--new-tab' "$url")
    done
    declare -p args
    
    ## TODO: cleanup Gtk-message warnings
    firefox "${args[@]}" >/dev/null

    return
}

declare -a urls=('foo' 'bar' 'tans')
do_urls 'urls'



function associative_array_clone()
{
    declare -n ptr="$1"; shift

    ptr['abc']='def'
    return
}

declare -A assoc=(['foo']='foo1' ['bar']='bar1')
associative_array_clone 'assoc'

# [EOF]
