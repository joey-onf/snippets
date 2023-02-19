#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Simple unit test for validating makefile targets
## -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##
set -euo pipefail

## Targets to validate
declare -a targets=()
targets+=('help')
targets+=('clean')
targets+=('sterile')
targets+=('all')

## Syntaxc checking and evaluate default target
set -x
make --dry-run >/dev/null
make >/dev/null
set +x

for target in "${targets[@]}";
do
    echo "% make ${target}"
    make "$target" >/dev/null
done

# [EOF]
