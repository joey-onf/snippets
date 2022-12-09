#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
function detect_modified()
{
    local arg="$1"; shift

    local modified=0
    case "$arg" in
	-*modified) modified=1 ;;
    esac

    [ $modified -eq 1 ]
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##

for switch in 'yes' '--modified' 'no' '-modified' 'modified';
do
    if detect_modified "$switch";
    then
	echo "Modified: true  ($switch)"
    else
	echo "Modified: false ($switch)"
    fi
done

# [EOF]
