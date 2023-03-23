#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Extract a list of function names from a source
# -----------------------------------------------------------------------

cat <<EODATA
EOF
#ignore
token0 only
# this junkss
valid_token
# ignore
EODATA

# 1) Split stream on comments and whitespace  (-F'[# ]')
# 2) Ignore comments at start of line ^#
# 3) Gather lines with strings
# 4) Display first string from the line.
# 
readarray -t data < <(awk -F'[# ]' 'NF > 0 && !/^(start|#)/ && /[[:alnum:]]/ {print $1}' $0)
declare -p data

# [EOF]
