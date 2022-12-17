#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Bash builtin for removing embedded whitespace from a string.
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Remove quotes and blanks from a string
## -----------------------------------------------------------------------
function filter_word()
{
    local exp="$1"; shift
    local src="$1"; shift
    local dst="${src//[\"\'[:blank:]]}"
    local label="${BASH_SOURCE[0]}::${FUNCNAME[0]}"

    echo " ** $label: exp=[$exp], dst=[$dst], src=[$src]"
    if [ "$dst" != "$exp" ]; then
	echo "$label ERROR: src=[$src] (dst:$dst != exp:$exp)"
    fi

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
declare -a strings=()
strings+=(' "a1 b2" ')
strings+=('"a1 b2" ')
strings+=(' "a1 b2"')
strings+=("a1' b2")
strings+=("'\"a1b2\"'")

for string in "${strings[@]}";
do
    filter_word 'a1b2' "$string"
done

# [EOF]
