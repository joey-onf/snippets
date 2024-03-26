#!/bin/bash
# -----------------------------------------------------------------------
# Intent:
#   o Provide a default string value for a variable.
#   o From string value extract a directory name.
# -----------------------------------------------------------------------

# ARTIFACT_GLOB=foo/.*

# Variable defaults with path cleanup
ARTIFACT_GLOB=${ARTIFACT_GLOB:-"release/*"}

artifact_dir="${ARTIFACT_GLOB%/*}"
declare -p artifact_dir

# [EOF]
