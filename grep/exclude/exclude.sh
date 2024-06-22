#!/bin/bash
## -----------------------------------------------------------------------
## Intent: An example of file gathering with file and directory exclusions
## -----------------------------------------------------------------------

here="$(realpath --canonicalize-existing '.')"
declare -p here


declare -a gargs=()

gargs+=('--exclude-from' "${here}/dir.excl")
# gargs+=('--exclude-from' "${here}/directories.excl")
# gargs+=('--exclude-from' "${here}/files.excl")
# gargs+=('--exclude-from' "${here}/regex.excl")

pushd /etc >/dev/null

## -----------------------------------------------------------------------
## NOTE: --exclude-from excludes basename not patterns
## -----------------------------------------------------------------------
set -x
# /etc/cron.hourly/.placeholder
find . -type f -print 2>/dev/null \
    | grep 'cron' \
    | grep "${gargs[@]}" '[[:alnum:]]*'
# grep -r "${gargs[@]}" '[[:alnum:]]*'

set +x

popd >/dev/null
