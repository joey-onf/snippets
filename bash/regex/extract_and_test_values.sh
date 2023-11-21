#!/bin/bash

declare -a lines=()

lines+=('abc 123')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     3m13s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     4m3s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     4m54s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     5m45s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     6m36s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     7m26s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     8m17s')
lines+=('voltha-infra-onos-classic-onos-config-loader-5f67d9796b-hqjjr   1/1   Running   0     9m8s')

lines+=('voltha-adapter-openolt-68c84bf786-8xsfc   0/1   CrashLoopBackOff 2 69s')
lines+=('voltha-adapter-openolt-68c84bf786-8xsfc   0/1   Error            3 85s')

# https://unix.stackexchange.com/questions/396097/capture-groups-with-awk-or-grep
re='[[:space:]]([[:digit:]]+)/([[:digit:]]+)[[:space:]]'

for line in "${lines[@]}";
do
    if [[ "$line" =~ $re ]]; then
        local -i checked=1
        declare -p BASH_REMATCH
        
        # voltha-loader  1/2   Running   0     9m8s
        # 0-match (<space>1/2<space>)
        # 1-numerator    1
        # 2-denominator  2
        if [[ "${BASH_REMATCH[1]}" == '0' ]]; then
            echo "Not started: ${BASH_REMACH[1]}"
            continue
        elif [[ "${BASH_REMATCH[1]}" == "${BASH_REMATCH[2]}" ]]; then
            echo "Completed"
            continue
        fi
    else
        echo "DID NOT MATCH"
    fi
done

# [EOF]
