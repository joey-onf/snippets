#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function string_contains_substring()
{
    local hav='foo bar tans fans'
    local exp='foo'

    if [[ "$exp" == *"$hav"* ]]; then
	    echo "Detected: $(declare -p hav) in $(declare -p exp)"
    else
	    echo "FAIL: $(declare -p hav) not in $(declare -p exp)"
    fi
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
string_contains_substring

# [EOF]
