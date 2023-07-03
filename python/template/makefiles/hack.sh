#!/bin/bash

## -----------------------------------------------------------------------
## What is really needed is to create a submodule that references a
## subdirectory in the remote repository (repo:onf-make/makefiles).
##
## repo:onf-make is a complete example, root directory contains a usable
## [Mm]akefile and makefiles/ contains library makefile logic.
## -----------------------------------------------------------------------

# mkdir -p makefiles
# git submodule add "https://gerrit.opencord.org/onf-make/makefiles" makefiles/onf

# https://gerrit.opencord.org/onf-make/makefiles

git clone https://gerrit.opencord.org/onf-make
# git clone https://gerrit.opencord.org/onf-make/ onf
mv onf-make/makefiles onf
rm -fr onf-make


# [EOF]
