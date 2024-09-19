#!/bin/bash

# ps -efq $$
(return 0 2>/dev/null) && sourced=1 || sourced=0
declare -p sourced
