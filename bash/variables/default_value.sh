#!/bin/bash

set -eu

val_set='abc'
use_default="${val_set:-default}"
echo "  use_default(abc) :- ${use_default}"

assign_default="${undef:=default}"
echo "  undef := ${assign_default}"

display_err="${undef:?invalid}"
echo "  display_err = ${display_err}"

# --------------------------------------
# ${parameter:+word} to use an alt value
# expand word only if param is set
# --------------------------------------
alt_val="${val_set:+alternative}"
echo "  alt-val(set) = ${alt_val}"
alt_val="${val_undef:+alternative}"
echo "  alt-val(undef) = ${alt_val}"

# [EOF]
