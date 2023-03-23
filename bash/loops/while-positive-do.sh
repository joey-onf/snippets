#!/bin/bash

declare -i count=5
while [[ count -gt 0 ]]
do
    echo "Countdown: $count"
    ((count--))
done

# [EOF]
