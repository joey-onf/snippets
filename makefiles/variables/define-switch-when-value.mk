# -*- makefile -*-
## -----------------------------------------------------------------------
## Intent: define-when-defined.mk
##   o Append a command line switch when a macro containing the
##     switch value is defined (ps-arg)
## -----------------------------------------------------------------------
## Usage:
##   % make                 ps-arg defined by makefile.
##   % make ps-arg=ntp      command line override
## -----------------------------------------------------------------------

ps-cmd  := ps
ps-args := $(null)

# ps-arg := bluetooth
# ps-arg := dialout
# ps-arg := ntp

$(if $(ps-arg)\
   ,$(eval ps-args += --group $(ps-arg))\
   ,$(info [SKIP] ps-args))

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
run:
	$(ps-cmd) $(ps-args)

# [EOF]
