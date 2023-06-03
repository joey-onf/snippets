#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Extract a list of function names from a source
# -----------------------------------------------------------------------

readarray -t ans < <(\
  find /bin -mindepth 1 -maxdepth 1 -follow -name 's*' -print 2>/dev/null \
      | awk -F'/' '{print $(NF - 1)}' \
      | sort -u\
  )

if [ ${#ans[@]} -ne 1 ]; then
    echo "Expected to find /bin but found:"
    declare -p ans
    exit 1
fi

declare -p ans

# [EOF]

