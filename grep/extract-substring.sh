#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Match a line, return substring within line
## -----------------------------------------------------------------------
# You can use grep with PCRE (-P):
#   o spring.profiles.active= will match this substring literally
#   o \K will discard the match
#   o [^ ]+ will select the desired portion
#   o i.e. the portion after spring.profiles.active=, till the next space
## -----------------------------------------------------------------------
function grep_only_substr()
{
    local data='00:28:04 bin/java -DJDBC_CONNECTION_STRING= -Dspring.profiles.active=qa -XX:MaxPermSize=256'

    printf '** %s (LINENO:%d): %s\n' \
        "${FUNCNAME[0]}" \
        $LINENO \
        'Match string, return substring'

    echo "**   {string} = $data"
    echo "**   % grep -Po 'spring.profiles.active=\K[^ ]+' <<<{string}"
    readarray -t ans < <(grep -Po 'spring.profiles.active=\K[^ ]+' <<<"$data")
    echo "**   answer=[${ans[@]}]"

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
grep_only_substr

# [SEE ALSO]
# https://askubuntu.com/questions/697120/extract-word-from-string-using-grep-sed-awk
    
# [EOF]
