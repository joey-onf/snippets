#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Examples of splitting strings on delimiter.
#   o some are builtin/efficient <<<"$str"
#   o some have process overhead < <(cmd "$str")
# -----------------------------------------------------------------------


# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function error()
{
    echo "** ERROR: $*"
    exit 1
}

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
function split_on_character()
{
    local val="$1"; shift
    local -n ref=$1; shift

    readarray -t _fields < <(printf '%s' "$val" | fold -w1) # grep -o .
    ref=("${_fields[@]}")

    cat <<EOT

** -----------------------------------------------------------------------
** Split string on characters
** -----------------------------------------------------------------------
  readarray -t _fields < <(printf '%s' "$val" | fold -w1)
  Ans: ${_fields[@]}"

  readarray -t _fields < <(printf '%s' "$val" | grep -o .)
EOT

    return
}
    
##----------------##
##---]  MAIN  [---##
##----------------##
declare -a values=()
declare -a got=()
split_on_character 'foo' got
[[ ${#got[@]} -eq 3 ]] || { error "Expected 3 found $(declare -p got)"; }

# [EOF]
