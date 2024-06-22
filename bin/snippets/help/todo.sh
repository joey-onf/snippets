#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Display a list of library todo items
## -----------------------------------------------------------------------

function show_todo()
{
    cat <<EOT

** -----------------------------------------------------------------------
** IAM ${BASH_SOURCE[0]}
** -----------------------------------------------------------------------

1) show_topics.sh
   - find . -name '*.sh' -print displays exhaustive topic help.
   - Update help display to be modular: display -maxdepth 1 topic help and subtopics
     - snippets --grep-help:
       - grep/*.sh (depth=1)
       - find grep -type d -mindepth 1 (recursive)
     - snippets --grep-exclude-help:
       - grep/exclude/*.sh (depth=1)
       - find grep -type d -mindepth 1 (recursive)

EOT
    return
}

show_todo
unset show_todo

: # assign ($?=0) for source $script

# [EOF]
