#!/bin/bash
## ---------------------------------------------------------------------------
## Intent: Display program help
## ---------------------------------------------------------------------------

cat <<EOH
Usage:
  --help         Display script help text
  --src          Source {file,directory}
  --dst          Destination {file,directory}

[TYPES]
  --int          Declare an int value

[MODES]
  --debug        Enable script debug mode
  --trace        Enable scrip tracing
  --verbose      Enable script verbose mode

EOH

: # $?=0 -- parse errors can manifest after source command returns

# [EOF]
