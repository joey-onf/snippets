#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Show different examples of removing file suffix by [...]
## -----------------------------------------------------------------------

function by_offset()
{
    local cmd="$0"
    local cmd_dir="${0:0:-3}" # trim .sh
    declare -p cmd
    declare -p cmd_dir
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
by_offset


# [EOF]
