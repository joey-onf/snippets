# -*- makefile -*-                         # Purely for editor colorization
# -----------------------------------------------------------------------
# Copyright 2024 Joey Armstrong All Rights Reserved
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# -----------------------------------------------------------------------
# SPDX-FileCopyrightText: 2024 Joey Armstrong All Rights Reserved
# SPDX-License-Identifier: Apache-2.0
# -----------------------------------------------------------------------

# -----------------------------------------------------------------------
# ** .FEATURES: archives
# ** .FEATURES: check-symlink
# ** .FEATURES: else-if
# ** .FEATURES: extra-prereqs
# ** .FEATURES: grouped-target
# ** .FEATURES: jobserver
# ** .FEATURES: load
# ** .FEATURES: nocomment
# ** .FEATURES: oneshell
# ** .FEATURES: order-only
# ** .FEATURES: output-sync
# ** .FEATURES: second-expansion
# ** .FEATURES: shortest-stem
# ** .FEATURES: target-specific
# ** .FEATURES: undefine
# -----------------------------------------------------------------------

# Archive (ar) files using the archive(member) syntax
features-url--archives +=

# The -L and --check-symlink-times flags
features-url--check-symlink +=

# Else branches in the non-nested form else if X
features-url--else-if +=

features-url--extra-prereqs +=
features-url--grouped-target +=
features-url--guile +=
features-url--jobserver +=
features-url--jobserver-fifo +=
features-url--load +=
features-url--notintermediate +=

# Is feature nocomment still supported or undocumented ?
features-url--nocomment +=

features-url--oneshell +=

# Build but not rebuild targets based on prerequisites
features-url--order-only += \
  https://www.gnu.org/software/make/manual/html_node/Prerequisite-Types.html

features-url--output-sync +=
features-url--second-expansion +=
features-url--shell-export +=
features-url--shortest-stem +=

# Using the shortest stem option when choosing between pattern rules that match a target
features-url--target-specific += \
  https://www.gnu.org/software/make/manual/html_node/Target_002dspecific.html

features-url--undefine +=

## -----------------------------------------------------------------------
## Intent: Iterate, display all features with links to documentation
## -----------------------------------------------------------------------
show-features =\
  $(foreach val,$(sort $(.FEATURES)),\
    $(info ** .FEATURES: $(val))\
    $(if $(features-url--$(val)),$(info $(space)	$(features-url--$(val))))\
  )

##----------------##
##---]  MAIN  [---##
##----------------##
all : features-header features-trailer

## -----------------------------------------------------------------------
## Intent: Display primary resource for search and new feature additions
## -----------------------------------------------------------------------
.PHONY: features-header
features-header :

	@echo
	@echo '[Search for new .FEATURES]'
	@echo '-==========================================================================='

	@printf '%s\n' 'https://www.gnu.org/software/make/manual/make.html'
	@printf '  - %s\n' 'ctrl-F Search for ".FEATURES"'
	@printf '  - %s\n' '6.14 Other Special Variables'

## -----------------------------------------------------------------------
## Intent: Dispaly individual features with documentation links
## -----------------------------------------------------------------------
features-trailer-banner :
	@echo
	@echo '.FEATURES supported by GNU make'
	@echo '-------------------------------'

.PHONY: features-trailer
features-trailer : features-trailer-banner
	$(call show-features)


# [SEE ALSO]
# -----------------------------------------------------------------------
# https://www.gnu.org/software/make/manual/make.html
#   - ctrl-F Search for '.FEATURES'
#   - 6.14 Other Special Variables
#
# https://stackoverflow.com/questions/58039810/makefiles-what-is-an-order-only-prerequisite
# -----------------------------------------------------------------------

# [EOF]
