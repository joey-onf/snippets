#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Extract a list of function names from a source
# -----------------------------------------------------------------------

#function invalid()
#{
#    true
#}

function a()
{
    true
}

function b()
{
    true
}

function c()
{
    true
}

cat <<EOH
Extract a list of function names by:
  1) Match lines with prefix 'function'
  2) Split on delimiters: whitespace, paren and comment
  3) Display function name in field[$2]
EOH
readarray -t funcs < <(awk -F'[# (]' '/^function/ {print $2}' $0)
declare -p funcs

# grep ^function mygh.sh | 

# [EOF]
