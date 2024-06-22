#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Display program usage
## -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: main program help display
## -----------------------------------------------------------------------
function usage()
{
    cat <<EOM
USAGE: $0 [--join][--split][path(s)]
  --help                           Display command usage.
  --todo                           Display enhancement list.

  --emacs                          Load files into an editor for viewing
  --edit                           Topic files are editable (default: read-only)

[MODIFIERS]
  {topic}-help                     Display topic specific help
                                   
[TOPICS]
  --awk
  --array
  --dictionary
  --grep
  --strings

[ARRAY]: prefix=--array
  --contains
 
[STRINGS]
  --dirname
  --join
  --split

[SCRIPTS]
  --common
  --snippets

EOM
}

: # assign ($?=0) for source $script

# [EOF]
