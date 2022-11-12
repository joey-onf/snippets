#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Invoke a shell command for output.
## -----------------------------------------------------------------------

set -euo pipefail

echo "readarray -t ans < <(find . -name '*.sh' -print)"
readarray -t ans < <(find . -name '*.sh' -print)
declare -p ans

# [EOF]
