#!/bin/bash
## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------

##----------------##
##---]  MAIN  [---##
##----------------##

declare -a comms=()
declare -a portable=('\#.\#')

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)
        machine=Linux
        comms+=('#.#')
        ;;

    Darwin*)
        machine=Mac
        comms+=('\#.\#') # osx requires escape
        ;;
    CYGWIN*)
        machine=Cygwin
        ;;
    MINGW*)
        machine=MinGw
        ;;
    *)
        machine="UNKNOWN:${unameOut}"
        ;;
esac

echo "Quoted Comment Strings:"
echo "    Native: $(declare -p comms)"
echo "  Portable: $(declare -p portable)"
