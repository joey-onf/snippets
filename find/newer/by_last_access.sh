#!/bin/bash

declare -a args=()
when="$(date +%Y-%m-%d -d '1 day ago')"

# args+=('-anewer' "$when")        # access
# args+=('-cnewer' "$when")      # change
# args+=('-newer' "$when")       # data mod
# args+=('-newer' '/dev/null')   # reference file
# args+=('-newerXY' '/dev/null')   # a:access, B:birth, c:inode, m:mod, t:time
args+=('-newermt' "$when")       # [m]odifed / [t]ime arg

# find /directory -newermt $(date +%Y-%m-%d -d '1 day ago') -type f -print

echo
echo "** List files by last 24hr file access"
set -x
find /etc "${args[@]}" -type f -print 2>/dev/null
set +x

# EOF
