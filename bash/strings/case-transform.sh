#!/bin/bash

name0='fOoBaR'
upper="${name0^^}"
Name="${name0^}"
lower="${name0,,}"
name="${name0,}"

echo "**   raw: $(declare -p name0)"
echo "** upper(^^): $(declare -p upper)"
echo "** lower(,,): $(declare -p lower)"
echo "**   name{0:1}(,): $(declare -p Name)"
echo "**   Name{0:1}(,): $(declare -p name)"

