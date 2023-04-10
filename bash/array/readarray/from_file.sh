#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Slurp array lines from a file
## -----------------------------------------------------------------------

set -euo pipefail

echo -e "\nUse readarray to gather a list of dictionary words:"
readarray -t words < '/usr/share/dict/words'

declare -p words

# [EOF]
