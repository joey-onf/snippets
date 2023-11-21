#!/bin/bash

printf "apple apple\npineapple apple\n" | \
awk -e 'gsub(/apple/, "nut")'
# nut nut
# pinenut nut

# [EOF]
