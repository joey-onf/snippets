# -*- makefile -*-

export SHELL := /bin/bash

all : test

test ::

	@printf '  Testing: posix\n'
	@./posix.sh
	@source posix.sh

	@printf '  Testing: bash\n'
	@./bash-only.sh
	@source bash-only.sh
