#!/bin/bash

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function get_string_prefix()
{
    script_token="$(find /home -mindepth 3 -maxdepth 3 -name '.backups-etc' 2>/dev/null)"
    token_suffix='/etc/.backups-etc'

    rest="${script_token#*${token_suffix}}"
    echo "REST: $rest"
    declare -i posn=$(( ${#script_token} - ${#rest} - ${#token_suffix}))
    declare -p posn
    script_dir="${script_token:0:$posn}"
    declare -p script_dir
    # declare -i posn=$(( ${#script_token} - ${#rest} - ${#token_suffix} ))
    #declare -p posn
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function get_offset()
{
    t="MULTI: primary virtual IP for xyz/x.x.x.x:44595: 10.0.0.12"
    searchstring="IP for"
    
    rest=${t#*$searchstring}
    echo $(( ${#t} - ${#rest} - ${#searchstring} ))
    
    # https://superuser.com/questions/1001973/bash-find-string-index-position-of-substring
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
get_string_prefix
get_offset

# [EOF]
