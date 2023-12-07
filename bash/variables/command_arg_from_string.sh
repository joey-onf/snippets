#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Pass command arguments as a here-string avoiding pipe overhead.
## -----------------------------------------------------------------------

set -euo pipefail

function error()
{
    echo "ERROR: $@"
    exit 1
}

echo -e "\nUse a here-string to pass arguments."

val="foo:bar:tans:fans"

echo "awk -F':' '{print \$2}' <<< "$val""
two="$(awk -F':' '{print $2}' <<< "$val")"
four="$(awk -F':' '{print $4}' <<< "$val")"

[[ "$two" != 'bar' ]] && error "two=[$two] != bar"
[[ "$four" != 'fans' ]] && error "four=[$fans] != fans"

# [EOF]
