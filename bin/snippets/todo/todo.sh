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

1) --topic argument handling
   - Current behavior exhaustively invokes todo scripts.
   - Change default to display a list of available todo scripts.
   - Invoke todo when snippets --[topic|subtopic]-todo is passed.

EOT
    return
}

show_todo
unset show_todo

: # assign ($?=0) for source $script

# [EOF]
