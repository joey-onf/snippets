#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Remove leading switch hyphens then trim whitespace
## -----------------------------------------------------------------------

##----------------##
##---]  MAIN  [---##
##----------------##
shopt -s extglob # ON

path="${path##+(-)}" # remove switch prefix
printf '\n** (LINENO:%s) %s\n' "$LINENO", 'Remove switch prefix'
declare -p path

path="${path##+([[:blank:]])}" # trim head
printf '\n** (LINENO:%s) %s\n' "$LINENO", 'Trim leading whitespace'
declare -p path

path="${path%%+([[:blank:]])}" # trim tail
printf '\n** (LINENO:%s) %s\n' "$LINENO", 'Trim trailing whitespace'
declare -p path

shopt -u extglob # OFF


for raw in 'foo' '-bar' '--foo' '---bar' '----foo' '-----bar-';
do
    shopt -s extglob # ON
    arg="${raw##+(-)}" # remove switch prefix
    shopt -u extglob # OFF
    echo "** ARG=[$arg], RAW=[$raw]"
done
            

# [EOF]
