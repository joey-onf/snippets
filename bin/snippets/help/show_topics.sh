#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Display topic help
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Given a topic path display subtopics for extended help
## -----------------------------------------------------------------------
function show_topic_subtopics()
{
    local dir="$1"; shift

    readarray -t dirs < <(find "$dir" -mindepth 1 -type d -print)
    [[ ${#dirs[@]} -eq 0 ]] && { return; } || { true; }

    ## Derive command line switches
    printf '\n[SUBTOPICS]\n'
    local topic
    for topic in "${dirs[@]}";
    do
        topic="${topic##*/}"
        printf '  %s/\n' "$topic"
    done

    return
}

## -----------------------------------------------------------------------
## Intent: Given a topic path display help/supported switches.
## -----------------------------------------------------------------------
function show_topic_switches()
{
    local dir="$1"; shift

    readarray -t dirs < <(\
        find "$dir" -mindepth 1 -maxdepth 1 -name '*.sh' -print \
            | sort \
        )

    ## Derive and display command line switches
    local topic
    for topic in "${dirs[@]}";
    do
        topic="${topic##*/}"
        topic="${topic/\.sh/}"
        printf '  --grep-%s\n' "$topic"
    done

    return
}

## -----------------------------------------------------------------------
## Intent: Given a topic path display primary help
## -----------------------------------------------------------------------
function show_topic_help()
{
    local dir="$1"; shift

    # Usage: make [options] [target] ...

    printf "\nUsage: ${pgmname} [options]\n"
    show_topic_switches  "$dir"
    show_topic_subtopics "$dir"

    return
}

: # assign ($?=0) for source $script

# [EOF]
