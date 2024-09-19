#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Parse command line paths
## -----------------------------------------------------------------------
function program_paths()
{
    declare -g pgm="$(readlink --canonicalize-existing "$0")"
    declare -g pgmbin="${pgm%/*}"
    declare -g pgmroot="${pgmbin%/*}"

    ## FIX THIS!! in snippets template script
    declare -g pgmname="${pgm##*/}"
    
    declare -g pgmlib="${pgm/'.sh'/}"
    
    readonly pgm
    readonly pgmbin
    readonly pgmlib
    readonly pgmroot
    readonly pgmname

    declare -g start_pwd="$(realpath --canonicalize-existing '.')"
    readonly start_pwd

    declare -g topicroot="${pgmroot}"
    readonly topicroot
    return
}
program_paths

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
source "$pgmlib/include.sh"

## -----------------------------------------------------------------------
## Intent: Massage file argument list for emacs
##   (default)     emacs FILE -f view-mode
##   --edit        do not pass -f view-mode
## -----------------------------------------------------------------------
function emacs_args()
{
    local -n ref=$1; shift

    ref=()
    while [[ $# -gt 0 ]]; do
        local -n files_ref=$1; shift
        for path in "${files_ref[@]}"; do
            ref+=("$path")
            if [[ ! -v edit_mode ]]; then
                ref+=('-f' 'view-mode')
            fi
        done
    done

    return
}

##----------------##
##---]  MAIN  [---##
##----------------##
pushd "$pgmroot" >/dev/null

bash_array='bash/array'
bash_dict='bash/dictionary'
bash_strings='bash/strings'

declare -a fyls=()

declare -a argv=("$@")
[[ ${#argv[@]} -eq 0 ]] && { set -- '--dirname'; } || { true; }

declare -a libs=()
while [[ ${#argv[0]} -gt 0 ]]; do
    fyl="${argv[0]}"
    unset argv[0]
    argv=("${argv[@]}")

    arg="$fyl" # deprecate fyl
    
    case "$fyl" in
        '--help') usage               ;; # see help/usage.sh
        '--todo') show_todo "$pgmlib" ;;

        '--edit') declare -i -g edit_mode=1 ;;

        '--emacs') fyls+=( $(find "$pgmroot" -type f -print) ) ;;

        ## [TOPIC: commands]
        '--awk'*)  handle_switch "$fyl" "${topicroot}/awk"  libs ;;
        '--grep'*) handle_switch "$fyl" "${topicroot}/grep" libs ;;

        ## [TOPIC: by-source]                
        '--dirname') libs+=("${bash_strings}/dirname_basename.sh")    ;;
        '--join')	 libs+=("${bash_strings}/join-on-delimiter.sh")   ;;
        '--split')    libs+=("${bash_strings}/split-on-delimiters.sh") ;;

        '--array'*)  getopts_array "$fyl" "${bash_array}" libs        ;;
        '--dict'*)   handle_switch "$fyl" "${bash_dict}" libs         ;;
        '--str'*)    handle_switch "$fyl" "${bash_strings}" libs      ;;
        
        ##
        --common)
            common="$HOME/.sandbox/common/"
            fyls+=( $(find "$common/sh" -type f -print) )
            ;;
        
        '--snippets') fyls+=("$0") ;;

        '-'*) error "Detected invalid argument [$arg]" ;;

        '/'*) fyls+=("$fyl")           ;;

	    *) fyls+=("${start_pwd}/$fyl") ;;
    esac
done

## ---------------
## Assign defaults
## ---------------
if [[ "$@" == *'help'* ]]; then
    : # no viewing in {--help, {topic}-help mode
elif [[ "$@" == *'todo'* ]]; then
    : # no viewing in --todo mode
elif [[ ${#libs[@]} -eq 0 ]]; then
    libs+=("${bash_strings}/dirname_basename.sh") # default viewing
fi

## --------------------------------------------------------
## Massage file viewing list for emacs (default: read-only)
## --------------------------------------------------------
declare -a src=()
emacs_args src fyls libs

if [[ ${#src[@]} -gt 0 ]]; then
    emacs "${src[@]}" &
fi

popd >/dev/null

# [EOF]
