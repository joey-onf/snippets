# -*- makefile -*-
## -----------------------------------------------------------------------
## -----------------------------------------------------------------------

.PHONY: lint

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
help ::
	@echo
	@echo "[LINT]"
	@echo "  lint               Syntax check everything"

##--------------------##
##---]  INCLUDES  [---##
##--------------------##
include $(ONF_MK)/lint/bash.mk
include $(ONF_MK)/lint/xml.mk
include $(ONF_MK)/lint/yaml.mk

# $(foreach inc,$(wildcard $(ONF_MK)/lint/*.mk),$(eval include $(inc)))

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
lint : $(lint)

todo ::
	@echo
	@echo "[LINT]"
	@echo "  o Replace find -name with per-file/dependency handling"

# [EOF]
