#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Create an associative array from a shell here document.
## -----------------------------------------------------------------------

set -eu -o pipefail

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function heredoc_creation()
{
    # declare -a foo=()
    var='foo'
    logName='foo.log'
    errName='name.log'
    logLog='log.log'
    errLog='log.err'
    eval cat <<EOF
        ${var}=([log_name]="$logName" [err_name]="$errName [log_log]="$logLog" [err_log]="$errLog")	
EOF
}

##----------------##
##---]  MAIN  [---##
##----------------##
heredoc_creation

# [EOF]
