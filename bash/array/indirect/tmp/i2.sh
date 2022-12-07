#!/bin/absh

assert_variables_set() {
  for varname in "$@"; do
      # ${!var}: indirect varname check
      if [ -z "${!varname}" ]; then
	  echo "$varname must be set" >&2
	  exit 1
    fi
  done
}

declare -i foo

assert_variables_set 'foo' 'bar'

# https://blog.teadd.uk/indirect-variable-references-in-bash/

# [EOF]
