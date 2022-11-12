#!/bin/bash
## -------------------------------------------------
## Intent: Bash builtins for filesystem path parsing
## -------------------------------------------------

path="foo/bar/tuv.xyz/tans/fans/abc.def"

echo " ** [PATH] $path"
echo " ** delete shortest from front (#*\.): ${path#*\.}"
echo " ** delete shortest from back  (%\.*): ${path%\.*}"

echo " ** delete longest from front (##*\.): ${path##*\.}"
echo " ** delete longest from back  (%%\.*): ${path%%\.*}"

echo
echo " ** [PATH] $path"
echo " **   dirname(%/*): ${path%/*}"
echo " ** basename(##*/): ${path##*/}"

# package0="foo - is a bar tans"
# package="${__package0__%%[[:space:]]}"


# PGM_SRC="${BASH_SOURCE##*/}"
# PGM_DIR="${BASH_SOURCE%/*}"
# PGM_STEM="${PGM_SRC##/.*}"

## echo "After deletion of longest match from front:" ${filename##*.}
## echo "After deletion of longest match from back:" ${filename%%.*}

# [EOF]
