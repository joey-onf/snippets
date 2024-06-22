#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Recursive grep ignoring text files.
#         Search target are makefiles containing dot tokens
#         .PHONY, .POSIX
# -----------------------------------------------------------------------

here="$(realpath --canonicalize-existing "$0")"
here="${here%/}"

declare -a gargs=()
gargs+=('--recursive')   # Traverse filesystem
gargs+=('-I')            # Ignore binary
gargs+=('-e' '^\.[A-Z]') # Search for makefiles

grep "${gargs[@]}" "${here%/*}/../.." 

# See Also
# https://stackoverflow.com/questions/25853722/how-to-suppress-binary-file-matching-results-in-grep

# [EOF]
