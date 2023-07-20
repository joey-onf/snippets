# -*- makefile -*-

HIDE ?= @
tests := $(wildcard *.sh)
suite = $(addsuffix .seen,$(addprefix .ts/,$(tests)))

.PHONY: all
all: test

.PHONY: test
test : $(suite)

.ts/%.seen: %
	./$<
#	./$(subst .seen,$(null),$(notdir $@))
	touch $@

init:
	mkdir -p .ts

clean ::
	$(RM) -r .ts
	$(HIDE)$(MAKE) --no-print-directory init

# [EOF]
