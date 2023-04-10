#!/bin/bash
## ----------------------------------------------------------------------
## Intent: Symlinks cause problems when retrieving content relative
##         to the directory containing $0.  This script will normalize
##         program path access.
## -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
declare -g pgm                  # Resolved path to $0
declare -g pgmdir               # dirname($pgm)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    echo "** ${FUNCNAME[1]} ERROR: $*"
    exit 1
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function init()
{
    pgm="$(realpath --physical --canonicalize-existing "$0")"
    pgmdir="${pgm%/*}"
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
init
declare -p pgm
declare -p pgmdir

len=${#pgmdir}
case "$pgm" in
    $pgmdir/*) echo "Detected: dirname in program path" ;;
    *) error "Failed to detect dirname in program path" ;;
esac

    
# [EOF]
