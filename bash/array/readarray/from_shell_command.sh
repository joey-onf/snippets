#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Invoke a shell command for output.
## -----------------------------------------------------------------------
## 1) Run the find command to generate a data stream.
## 2) '< <' Use in-process substitution for I/O
##      ** DO NOT IMPOSE PROCESS OVERHEAD BY SPAWNING A SHELL **
## 3) ans
##      ** create a new shell variable to hold output.
##      ** declare -a ans=()
## 3a) Assign command output to shell variable ans.
## -----------------------------------------------------------------------

set -euo pipefail

echo -e "\nUse readarray to gather a list of shell commands:"
echo "** RUNNING: readarray -t commands < <(find . -name '*.sh' -print)"
readarray -t cmds < <(find . -name '*.sh' -print)

# declare -a cmds=([0]="./from_shell_command.sh")
echo -e "\n** Display variable: shell builtin"
declare -p cmds

# ** ./from_shell_command.sh
echo -e "\n** Display variable: list iteration"
# local cmd
for cmd in "${cmds[@]}";
do
    echo "** $cmd"
done

# [EOF]
