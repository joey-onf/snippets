# -*- makefile -*-
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------

null 	    :=#
space	    :=$(null) $(null)

HIDE        ?= @

TOP	    ?= .
MAKEDIR     ?= $(TOP)/makefiles
ONF_MAKE    ?= $(TOP)/makefiles

PYTHON      ?= $(HOME)/.venv/3.10.6/bin/python 

main        := bin/tmpl.py

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all:
	$(main) --help

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
main-args := $(null)
main-args += --my-bool
main-args += --my-host foo.bar.org
main-args += --my-list itemA
main-args += --my-list itemB
main-args += --my-scalar 5
main-args += --verbose

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
args:
	$(main) $(main-args)

## -----------------------------------------------------------------------
## Intent: Create a new python script by cloning the template folder.
## -----------------------------------------------------------------------
tool-name ?= gather
tool-name ?= foobar
tool-dir  ?= $(HOME)/projects/sandbox/voltha-stats/$(tool-name)
install-args += --pgm $(tool-name)
install-args += --dst $(tool-dir)

install:
	~/etc/cleanup
	bin/deploy.sh $(install-args)

sterile ::
	$(RM) -r $(tool-dir)

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
invalid:
	@echo
	-$(main) --my-host area-51

	@echo
	-$(main) --my-host 'croak'

	@echo
	-$(main) --my-host '1.2.3.4'

# -----------------------------------------------------------------------
## -----------------------------------------------------------------------
main-help:
	$(main) --help

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
.PHONY: todo
todo:
	$(main) --$@ stub-required-arg

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
version:
	$(main) --$@

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
clean ::

        # Remove editor temp files
	$(HIDE)find . \( -name '*~' -o -name '#*#' -o -name '\.#*' \) -print0 \
  | xargs --null --no-run-if-empty $(RM)

        # Remove compiled and cached python files
	$(HIDE)find . \( '-name' '__pycache__' \) -print0 \
  | xargs -I'{}' --null --no-run-if-empty $(RM) -r {}

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo "Usage: $(MAKE) [options] [target] ..."
	@echo "Options:"
	@echo "  all        Invoke $(main)"
	@echo "  args       Invoke script with a variety of args"
	@echo "  install    Create tool foo.py by installing tmpl sources"
	@echo "  todo       Display enhancement list"
	@echo "  version    Display script version"
	@echo
	@echo "[CLEAN]"
	@echo "  clean      Remove generated content"
	@echo "  sterile    Revert sandbox to a pristine checkout state"
	@echo
	@echo "[ERROR]"
	@echo "  invalid    An example of passing invalid arguments"
	@echo
	@echo "[HELP]"
	@echo "  help       Display makefile targets"
	@echo "  main-help  Display program usage"
	@echo
	@echo "[EOF]"

# [EOF]
