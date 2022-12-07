# -*- makefile -*-
# -----------------------------------------------------------------------
#
# -----------------------------------------------------------------------

# Common makefiles
ONF_TOP ?= .
ONF_MK  ?= $(ONF_TOP)/makefiles

# Local makefiles
TOP     := .
MAKEDIR ?= $(TOP)/makefiles

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
-include $(ONF_MK)/include.mk
include $(MAKEDIR)/include.mk

# -----------------------------------------------------------------------
# Intent: Include lint/helm/include.mk when target link-helm is requested.
# Usage: make lint-helm
# -----------------------------------------------------------------------

# 1) on-demand defines the desired target.
on-demand   := lint-helm

# 2) MAKECMDGOALS= contains what make plans to do
have-target := $(findstring $(on-demand),$(MAKECMDGOALS)

#   3) GNU Make $(findstring) will check if lint-html is in the list
#   4) Answer will be either 'lint-html' or $(null).
#   5) $(if) $(have-target) $(load-makefile--dynamically)
$(if $(have-target),\
    $(eval include $(MAKEDIR)/lint/helm/include.mk))

# [EOF]
