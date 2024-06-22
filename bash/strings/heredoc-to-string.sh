#!/bin/bash

$ read -r -d '' VAR <<'EOF'
abc'asdf"
$(dont-execute-this)
foo"bar"''
EOF

# https://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash

# [EOF]
