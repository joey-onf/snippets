#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

echo "SRC"
echo "==========================================================================="
echo -e 'foo\nbar\ntans\nfans' \

echo     
echo "DST"
echo "==========================================================================="
echo -e 'foo\nbar\ntans\nfans' \
     | awk '{printf "val += (%s)\n", $0}'

# git status | awk -F':' 'modified: {print $2}'

# [EOF]
