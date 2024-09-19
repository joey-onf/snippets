#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Extract a list of function names from a source
# -----------------------------------------------------------------------
# [SEE ALSO]
#   o https://stackoverflow.com/questions/6790631/use-the-contents-of-a-file-to-replace-a-string-using-sed
# -----------------------------------------------------------------------

function replace_brown_with_red()
{
    local data='data.tmp'
    local repl='replace.tmp'
    
    cat <<DATA>"$data"
the
quick
brown
fox
jumps
over
the lazy dog
fox dog
DATA

    cat <<REPL>"$repl"
** -----------------------------------------------------------------------
read or silver
** -----------------------------------------------------------------------

REPL

    echo "** ${FUNCNAME[0]} Replace string brown with file contents"
    sed "/brown/{
        s/brown//g
        r $repl
    }" "$data"

    rm -f "$data" "$repl"
    return
}
 
replace_brown_with_red

# [EOF]
