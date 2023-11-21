#!/bin/bash

function remove()
{
    local -a data=('a' 'b' 'c' 'd' 'e')
    declare -p data

    echo -e "POP:\n"
    local -i max=$((${#data[@]} - 1))
    val="${data[$max]}"
    declare -p val
    unset data[$max]
    data=("${data[@]}")
    declare -p data

    echo -e "\nSHIFT:"
    val="${data[0]}"
    declare -p val
    unset data[0]
    data=("${data[@]}")
    declare -p data
}

remove
