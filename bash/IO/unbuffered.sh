#!/bin/bash

cat <<EOH
This script contains examples of how to unbuffer output from shell commands.
EOH


echo
echo " ** Set buffer length(s) to zero"k
echo "stdbuf -i0 -o0 -e0 command"

echo
echo " ** Install the unbuffer command from expect package"
echo "unbuffer who | ./do_something"

# [EOF]
