#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Generate a random [character|string]
## -----------------------------------------------------------------------
## :param incl: A list of character classes to include
## :type  incl: see note
##
## :param excl: A list of character classes to exclude
## :type  excl: see note
##
## :param len: Length of string to return
## :type  len: str, int
##
## :param varname: Return value to caller through this variable.
## :type  varname: str
##
## ..note: filter types: empty, string, posix-character-class
## -----------------------------------------------------------------------
## Usage:
##    declare -a empty=('[[:blank:]]')
##    declare -a lower=('[[:lower:]]')
##
##    echo "value is $(getch 'lower' 'empty' 3)
##
##    local byvar
##    getch 'lower' 'empty' 1 'byvar'
##    echo "** by-val = $(getch 'lower' 'empty' 5)"
## -----------------------------------------------------------------------
function getch()
{
    declare -n incl="$1"; shift
    declare -n excl="$1"; shift
    local len="$1"; shift
    local varname
    [ $# -gt 0 ] && { varname="$1"; shift; }

    # --------------------------------------------------
    # tr -d[c] [letter|pattern|[[:posix-character-set:]]
    #    -d   Delete characters from stream
    #    -c   Complement character set
    # --------------------------------------------------
    ans=''
    if [ ${#incl[@]} -gt 0 ]; then
	ans="$(tr -dc '[[:alnum:]]' </dev/urandom \
		| tr -dc ${incl[@]}\
		| head -c $len)"
    elif [ ${#excl[@]} -gt 0 ]; then
	ans="$(tr -dc ${excl[@]} </dev/urandom | head -c $len)"
    fi

    ## ----------------------
    ## Return value to caller
    ## ----------------------
    if [[ -v vafname ]]; then
	typeset "$val=${ans}" # by-var
    else
	echo "$ans"           # by-val
    fi

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
echo "[GENERATE RANDOM STRINGS]"
echo "---------------------------------------------------------------------------"

declare -a empty=()
declare -a lower=('[[:lower:]]')
echo "** lower by-val[incl]: $(getch 'lower' 'empty' 1)"

declare -a mixed=()
# [TODO] join patterns w/o whitespace
#mixed+=('[[:blank:]]')
#mixed+=('[[:digit:]]')
mixed+=('[[:upper:]]')
echo "** lower by-val[excl]: $(getch 'empty' 'mixed' 1)"

by_var=''
by_var="$(getch 'lower' 'empty' 5)"
echo "** lower by-var[name]: ${by_var}"

# [EOF]
