#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Create a patch form 
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function error()
{
    echo "** $0::${FUNCNAME[1]}: $*"
    exit 1
}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
function parseArgs()
{
    while [ $# -gt 0 ]; do
	arg="$1"; shift
	case "$arg" in
	    
	    -*compare-from)
		declare -g compare_from="$arg"
		shift
		readonly compare_from
		;;
	    
	    -*compare-with)
		declare -g with_dir="$arg"
		shift
		readonly with_dir
		;;
	    
	    -*patch-dir)
		declare -g patchdir="$arg"
		shift
		readonly patchdir
		mkdir -p "$patchdir"
		;;
	    
	    -*help)
		cat <<EOH
Create a patch file by comparing source in two directories.
       
Usage: $0
  --compare-from [s]    Directory containing file-to-compare-from
  --compare-with [d]    Directory containing file-to-compare-with
  --patch-dir    [p]    reate generated patches in this directory

  @list          A list of relative file paths for patch creation.
EOH
	    ;;

	    *)
		declare -g -a fyls=()
		fyls+=("$arg")
		;;
	esac
    done


    [[ ! -v compare_from ]] && error "--compare_from is required"
    [[ ! -v compare_with ]] && error "--compare_with is required"
    [[ ! -v patch_dir ]]    && error "--patch-dir is required"
    
    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
parseArgs

for fyl in "${fyls[@]}";
do
    dirName="${fyl%/*}"
    baseName="${fyl##*/}"
    # diff -Naur \

    #   staging/lib/python3.10/site-packages/sphinx/util/typing.py \
    #   venv_docs/lib/python3.10/site-packages/sphinx/util/typing.py
    diff -Naur "${compare_from}/$fyl" "${with_dir}/$fyl" | tee "${patch_dir}/$fyl"
done

# [EOF]
