#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Display enhancement list
## Config:
##   - Create script todo.sh beneath a topic or subtopic directory.
##   - Script will be invoked when snippet is passed argument --todo.
##   - Identify the script with an IAM banner.
##   - Create a HERE document detailing enhancements needed.
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Given a topic path display subtopics for extended help
## -----------------------------------------------------------------------
function show_todo()
{
    local dir="$1"; shift

    find "$dir" -name 'todo.sh' -print0 \
        | xargs -0 -I'{}' --no-run-if-empty bash -c {}

    return
}

: # assign ($?=0) for source $script

# [EOF]
