#!/bin/bash

echo "Propogate permissions when any are set"

echo
echo "Grant -x perms to everyone"
find /usr/local/aws-cli -perm /oug+x | xargs chmod ugo+x

