#!/bin/bash
## -----------------------------------------------------------------------
## 
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
function increment()
{
    declare -nl ref="$1"; shift
#    declare -n ref="$1";
    [[ -z "${ref+xxx}" ]] && { ref=0; }

    local tmp=$ref
    ref=$(( $tmp+1 ))
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
declare -a value

for i in 1 2 3 4 5 6;
do
    increment '
value'
done

if [ $value != 6 ]; then
    echo "ERROR: found $value expected 6"
    exit 1
fi
echo "Incremented value: $value"

five_plus_nine=$(($value + 9))
echo "five_plus_nine = ${five_plus_nine}"
		  
# [SEE ALSO]
# -----------------------------------------------------------------------
# https://phoenixnap.com/kb/bash-math
# -----------------------------------------------------------------------

# [EOF]
