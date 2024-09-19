# -*- makefile -*-
## -----------------------------------------------------------------------
## Intent: Examnples of path manipulation
## -----------------------------------------------------------------------

split-path = $(strip \
  $(info ** splitpath: 1=$(1), 2=$(2), 3=$(3))\
  $(foreach dir,$(1),\
  $(foreach from,$(2),\
  $(foreach to,$(3),\
    $(info ** dir=$(dir), from=$(from), to=$(tod))\
	$(info ** ans=$(subst $(from),$(to)$(space),$(dir)))\
    $(firstword \
	  $(subst $(from),$(to)$(space),$(dir)) \
    ) \
  )))\
)

all :

from	:= /snippets/makefile
to		:= /sandbox/foobar

here	:= $(abspath .)
sbx		:= $(call split-path,$(here),$(form),$(to))

$(info ** here=$(here))
$(info ** from=$(from), to=$(to))
$(info ** split-path = $(sbx))



# [EOF]
