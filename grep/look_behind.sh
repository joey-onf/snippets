#!/bin/bash

grep -oP '(?<= from upstream, client: )\S+' "$1" \
    | sort -u \
    | wc -l

# https://stackoverflow.com/questions/1733692/how-to-use-sed-awk-or-gawk-to-print-only-what-is-matched
