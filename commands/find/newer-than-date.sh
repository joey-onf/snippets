#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Search for files based on timestmap
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Format a report line for output
## -----------------------------------------------------------------------
function banner_sentinel()
{
    local path="$1"; shift

    echo
    echo "** Create Sentinel:"
    echo "    $(/bin/ls -l "$path")"
    echo

   return
}

## -----------------------------------------------------------------------
## Intent: Search for files modified after sentinel file timestamp
## -----------------------------------------------------------------------
function find_newer()
{
    local when="$1"  ; shift
    local where="$1" ; shift

    echo -e "\n** find_newer: $where"
    echo "    $(/bin/ls -l "$when")"

    echo
    find "$where" -newer "$when" -print 2>/dev/null | head -n 5

    return
}

## -----------------------------------------------------------------------
## Intent: Create a named temp directory with error checking
## -----------------------------------------------------------------------
function my_mktemp()
{
    declare -n pointer="$1"; shift
    local pkgbase="${0##*/}" # basename
    local pkgname="${pkgbase%.*}"

    declare -a args=()
    args+=('--directory')
    args+=('-t' "${pkgname}.XXXXXXXXXX")
    local tempdir="$(mktemp "${args[@]}" || { echo "mktemp ${args[@]} failed"; exit 1; })"
    declare -p tempdir

    pointer="$tempdir" # Assign value into parents namespace
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function find_newer_than_datestamp()
{
    local sentinel="${FUNCNAME[0]}.$$.sentinel"
    cat <<EOH

# -----------------------------------------------------------------------  
# Search for files newer than a given date or datestamp.
# % touch -t STAMP   use [[CC]YY]MMDDhhmm[.ss] instead of current time
# -----------------------------------------------------------------------  
EOH

    touch -t "202303010000.00" "$sentinel"
    banner_sentinel "$sentinel"

    find_newer "$sentinel"
    echo -e "\n** Find newer:"
    find_newer "$sentinel" '/etc'
    return
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function find_locally_modified()
{
    local sentinel="${FUNCNAME[0]}.$$.sentinel"

    cat <<EOH

# -----------------------------------------------------------------------  
# Report files modified during an editing or project session:
#   1) Create a filesystem marker as a reference point.
#   2) Display files modified after marker creation.
# -----------------------------------------------------------------------  
EOH

    touch "$sentinel"
    banner_sentinel "$sentinel"

    local i=''
    for i in 'foo' 'bar' 'tans';
    do
	sleep 2
	local modified="${FUNCNAME[0]}.${i}.$$.modified"
	echo "** Touch: $modified"
	date > "$modified"
    done

    find_newer "$sentinel" "$(/bin/pwd)"
    
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
clear
declare work=''
my_mktemp 'WORK'

pushd "$WORK" >/dev/null

find_newer_than_datestamp
find_locally_modified

popd >/dev/null

## Cleanup
/bin/rm -fr "$WORK"

# [EOF]
