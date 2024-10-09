# -*- makefile -*-
## -----------------------------------------------------------------------
## Intent: This makefile contains an example of condititionally using
##         logic when a named target is used.
## -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##

SRC     ?= notes
EDITOR  ?= vi

## Define var IS_TARGET_{t} when detected
$(if $(findstring edit,$(MAKECMDGOALS)),\
  $(eval IS_TARGET_archive := true))

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all : help

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
edit :
	$(EDITOR) "$(SRC)"

## -----------------------------------------------------------------------
## Intent: Move active text file into an archive directory then recreate
##         document for the next batch of edits.
## -----------------------------------------------------------------------
ifdef IS_TARGET_archive
  TS           ?= $(error TS= is required)
else
  yymmdd       := $(shell date '+%Y%m%d')
  yymmddhhmmss := $(shell date '+%Y%m%d%H%M%S')
  TS           := $(yymmdd)

# better answer:
#   $(if $(IS_TARGET_archive),\
#     $(eval include makefiles/conditional/archive.mk))
endif

archive :
	[[ -f "$(SRC)" ]] && { mv "$(SRC)" "$(yymmddhhmmss)"; } || { true; }
	echo > "$(SRC)"

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo 'Usage: $(MAKE) [options] [target] ...'
	@printf '  %-33.33s %s\n' 'edit'    'Load data files into an editor'
	@printf '  %-33.33s %s\n' 'archive' 'Archive current data file'

# [EOF]
