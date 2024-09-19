#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Grep for a regex contained within a file
## -----------------------------------------------------------------------

function show_data()
{
    cat <<DATA
    ## [MATCH] * FIN (PASS)
    ## [ERROR] * FIN xyz 
    ## [MATCH] * FIN (FAIL)
    ## [ERROR] * invalid
    ## [ERROR] * FIN INVALID
DATA
    return
}

##
## -----------------------------------------------------------------------
## Intent: Grep for regexpr in file
## -----------------------------------------------------------------------
function awk_regex()
{
    local fyl="$1"; shift
    set -x
    awk '/\*[[:space:]]+FIN[[:space:]]+([^)]+)/ { print $2 }' "$fyl"
    set +x
    return
}

# -----------------------------------------------------------------------
## Intent: Grep for regexpr in file
## -----------------------------------------------------------------------
function grep_regex()
{
    local fyl="$1"; shift
    set -x
    grep -E '[[:space:]]+FIN[[:space:]]+([^)]+?)' "$fyl" | awk '{print $2}'
    set +x
    return
} # grep_pattern()

## -----------------------------------------------------------------------
## Intent: Grep for regexpr in file
## -----------------------------------------------------------------------
function sed_regex()
{
    local fyl="$1"; shift
    set -x
    sed 's/[[:space:]]\+FIN[[:space:]]\+(\([^)]\+\))/\1/g' "$fyl"
    set +x
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
echo "See commented: entire file displayed"
# awk_regex  "$0"
# grep_regex "$0"
# sed_regex  "$0"

# [SEE ALSO]
# https://stackoverflow.com/questions/12569216/how-to-use-grep-to-extract-a-substring

# [EOF]
