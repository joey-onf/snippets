#!/bin/bash
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Given a topic switch (--grep, --grep-help, --grep-exclusions)
##    Perform actions based on switch name, content or modifiers
## -----------------------------------------------------------------------
## [MODIFIERS]
##    --{topic}                     View source examples
##    --{topic}{-subtopic}
##
##    {topic}-help                  Display topic specifc help
##    {topic}{-subtopic}-help       Display extended help
## -----------------------------------------------------------------------
function handle_switch()
{
    local arg="$1"  ; shift
    local dir="$1"  ; shift
    local -n ref=$1 ; shift

    readarray -d'/' -t fields < <(printf '%s' "$arg")
    stem="${fields[0]}"

    case "$arg" in

        # Display topic help
        *'-help') show_topic_help "$dir" ;;

        # Load snippet examples.
        "$stem") ref+=( $(find "$dir" -name '*.sh' -type f -print) ) ;;

        # Digest modifiers
        *)
            cat <<EOM
** -----------------------------------------------------------------------
** IAM: ${pgm} (LINENO: $LINENO)
** ERR: Detected invalid argument [$fyl]
** -----------------------------------------------------------------------
EOM
            exit 1
            ;;
    esac

    return
}

: # Assign ($?=0) for source $script
# [EOF]
