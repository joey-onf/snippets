#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Examples of splitting strings on delimiter.
#   o some are builtin/efficient <<<"$str"
#   o some have process overhead < <(cmd "$str")
# -----------------------------------------------------------------------

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function split_on_delimiter()
{
    local val="$1"; shift

    echo
    echo "[SPLIT: on delimiter]"
    echo

    readarray -d'+' -t _fields <<<"$val"
    echo "  readarray -d'+' -t _fields <<<\"\$val\""
    echo "      embedded newline"
    echo "      ans: ${_fields[@]}"

    readarray -d'+' -t _fields < <(printf '%s' "$val")
    echo "  readarray -d'+' -t _fields < <(printf '%s' \"\$val\")"
    echo "      ans: ${_fields[@]}"

    return
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function split_on_delimiters()
{
    local val="$1"; shift

    echo
    echo "[SPLIT: on delimiter(s)]"
    echo

    _fields=( $(grep -Eo '[^+-]+' <<<"$val") )
    echo "  REGEX: _fields=( \$(grep -Eo \'[^+-]+\' <<<\"\$val\") )"
    echo "      ans: ${_fields[@]}"
#     echo " ** grep on regex: $(declare -p _fields)"
    return
}
    
##----------------##
##---]  MAIN  [---##
##----------------##
declare -a values=()
values+=('.gnu+bison---foobar+config++extra')

for value in "${values[@]}";
do
    echo
    echo "** ARG: $value"
    split_on_delimiter  "$value"
    split_on_delimiters "$value"
done

# [EOF]
