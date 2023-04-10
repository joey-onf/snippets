#!/bin/bash

declare -a purge=()
declare -a review=()
declare -a uninstall=()

value='element'
review+=('element')

if [[ " ${purge[*]} " =~ " ${value} " ]]; then 
    echo "** Array purge contains $value"
    # whatever you want to do when array contains value
fi

if [[ " ${review[*]} " =~ " ${value} " ]]; then
    echo "** Array review contains $value" 
   # whatever you want to do when array contains value
fi

if [[ " ${uninstall[*]} " =~ " ${value} " ]]; then
    echo "** Array uninstall contains $value"
    # whatever you want to do when array contains value
fi

