#!/bin/bash

declare -A DIRS=(\
                 [backups-home]="/home/foo"\
                 [stamped]="/media/foo/20231016"\
                 [current]="/media/foo/current"\
                 [program]="/media/foo/backups/bin/backup.sh"\
                 [root]="/media/foo/backups"\
)

readarray -t vals < <(\
  declare -p DIRS \
    | tr ' ()' '\n' \
    | grep ']=' \
    | sort -u \
)

echo
echo "VALS: ${vals[@]}"
# declare -p vals

echo
readarray -t fmt < <(printf '**    %s\n' "${vals[@]}")

cat <<EOM

** -----------------------------------------------------------------------
** Formatted output
** -----------------------------------------------------------------------

declare -p fmt:
** -----------------------------------------------------------------------
$(declare -p fmt)

echo "\${fmt[@]}"
** -----------------------------------------------------------------------
$(echo -e "${fmt[@]}")
EOM

# [EOF]
