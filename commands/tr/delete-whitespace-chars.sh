#!/bin/bash

cat <<EOH
Delete whitespace and newlines from command output

Usage: $0
  
EOH

ps -ef | head -n 3 | tr -d '[:blank:]|\n|\r'
echo

# [SEE ALSO]
# https://phoenixnap.com/kb/linux-tr  

# [EOF]
