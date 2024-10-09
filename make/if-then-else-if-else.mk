# -*- makefile -*-
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
# Intent: Nested if-then-else-if example
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##

arg	?= $(error arg= is required)

ifeq ($(arg),$(USER))
  $(info Detected USER=[$(arg)])

else ifdef OVERRIDE
  $(info Detected OVERRIDE= flag)

else ifndef BAD_FLAG
  $(info [GOOD] BAD_FLAG= is undefined)

else
  $(info Catchall block, BAD_FLAG=1 is defined)

endif

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all :
	@echo 'An example of if-then-else-if conditional nesting'

# [SEE ALSO]
#   o https://stackoverflow.com/questions/8059556/how-to-write-multiple-conditions-in-makefile-am-with-else-if

# [EOF]
