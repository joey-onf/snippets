#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Display repository files modified by a user, within a date range
# -----------------------------------------------------------------------

user="$1"; shift

declare -a args=()
args+=('--pretty=')
# args+=("--author=\"$user\"")
args+=("--committer=$user")
args+=('--after="2021-12-31"')
# args+=('--before="2023-01-01"')
args+=('--name-only')
# git log --before="2011-12-01" --pretty=format:"%cd"

git log "${args[@]}" 2>&1 | sort -u > log


