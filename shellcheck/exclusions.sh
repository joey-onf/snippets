#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Augment source to inhibit warnings by line
# -----------------------------------------------------------------------

##----------------##
##---]  MAIN  [---##
##----------------##

cat <<EOM
## -----------------------------------------------------------------------
## Intent: Disable shellcheck errors by line.
##   SC1091 - Disable checking external scripts (shellcheck -x)
## -----------------------------------------------------------------------

# shellcheck disable=SC1091
source /sandbox/onf-common/common.sh "$@" '--common-args-begin--'

EOM

# [EOF]

