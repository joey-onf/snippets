#!/bin/bash
## -------------------------------------------------
## Intent: Bash builtins for filesystem path parsing
## -------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
umask 0
set -euo pipefail

## -----------------------------------------------------------------------
## Intent: Extract stem and extension
## -----------------------------------------------------------------------
function stem_and_extension()
{
    local path="/foo/fizzbuzz.bar"
    local stem="${path%.bar}"   # remove suffix .bar
    local base="${stem##*/}"    # basename

    cat <<EOEX

## -----------------------------------------------------------------------
## Example: stem_and_extension
## -----------------------------------------------------------------------

 ** path: $path
 ** stem: $stem
 ** base: $base
EOEX

    return
}

## -----------------------------------------------------------------------
## Intent: Parse command line paths
## -----------------------------------------------------------------------
function program_paths()
{
    declare -g pgm="$(readlink --canonicalize-existing "$0")"
    declare -g pgmbin="${pgm%/*}"
    declare -g pgmroot="${pgmbin%/*}"
    declare -g pgmname="${pgm%%*/}"

    declare -g pgmsrc
    pgmsrc="$(readlink --canonicalize-existing "${BASH_SOURCE[0]}")"
    readonly pgmsrc

    readonly pgm
    readonly pgmbin
    readonly pgmroot
    readonly pgmname

    declare -g start_pwd="$(realpath --canonicalize-existing '.')"
    readonly start_pwd

    cat <<EOEX

## -----------------------------------------------------------------------
## Example: program_paths
##  Intent: Extract paths from program path for derived logic.
## -----------------------------------------------------------------------

 [ABSPATH: realpath]
 ** Pgm     (realpath \$0): $pgm
 ** Pwd     (realpath '.'): $start_pwd

 [RELPATH: basename, dirname]
 ** Program bin  dir (%/*): $pgm
 ** Program root dir (%/*): $pgm
 ** Program name (%%/*/): $pgm

EOEX

    return
}

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
function program_paths()
{
    # package0="foo - is a bar tans"
    # package="${__package0__%%[[:space:]]}"

    # PGM_SRC="${BASH_SOURCE##*/}"
    # PGM_DIR="${BASH_SOURCE%/*}"
    # PGM_STEM="${PGM_SRC##/.*}"
    
    ## echo "After deletion of longest match from front:" ${filename##*.}
    ## echo "After deletion of longest match from back:" ${filename%%.*}
    return
}

## -----------------------------------------------------------------------
## Intent:
## -----------------------------------------------------------------------
function verbose_parse()
{
    path="foo/bar/tuv.xyz/tans/fans/abc.def"
    
    echo " ** [PATH] $path"
    echo " ** delete shortest from front (#*\.): ${path#*\.}"
    echo " ** delete shortest from back  (%\.*): ${path%\.*}"
    
    echo " ** delete longest from front (##*\.): ${path##*\.}"
    echo " ** delete longest from back  (%%\.*): ${path%%\.*}"
    
    echo
    echo " ** [PATH] $path"
    echo " **   dirname(%/*): ${path%/*}"
    echo " ** basename(##*/): ${path##*/}"

    cat <<EOEX

## -----------------------------------------------------------------------
## Example: verbose_parse
##  Intent: Exhaustive extraction of field values
## -----------------------------------------------------------------------

 ** [PATH] $path
 ** delete shortest from front (#*\.): ${path#*\.}
 ** delete shortest from back  (%\.*): ${path%\.*}
    
 ** delete longest from front (##*\.): ${path##*\.}
 ** delete longest from back  (%%\.*): ${path%%\.*}

 ** [PATH] $path
 **   dirname(%/*): ${path%/*}
 ** basename(##*/): ${path##*/}

EOEX

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
program_paths
stem_and_extension
verbose_parse

# [EOF]
