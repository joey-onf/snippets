#!/bin/bash
# -----------------------------------------------------------------------
# Intent:
#   o Extract the first field on a colon delimited string
# -----------------------------------------------------------------------

device='foo:bar:tans:fans'

local -i id0="$(cut -d: -f1 <<<"$device")"
local -i id1="${device%%:*}"    # basename
declare -p id0
declare -p id1

if [[ id0 -ne id1 ]]; then
    echo "ERROR: Values do not match: (got=$id1 != exp=$idx0)"
    exit 1
fi

# [EOF]
