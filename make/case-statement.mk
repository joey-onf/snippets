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
# Intent: Makefile case statement example
# -----------------------------------------------------------------------

##-------------------##
##---]  GLOBALS  [---##
##-------------------##

arg	?= $(error arg= is required)

ifeq ($(arg),hera)
  $(info Detected Greek godess Hera)
  value	:= hera
  url	:= https://en.wikipedia.org/wiki/Hera

else ifeq ($(arg),pleiades)
  $(info Detected the seven sister-nymphs)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Hera

else ifeq ($(arg),maia)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Maia

else ifeq ($(arg),electra)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Electra_(Pleiad)

else ifeq ($(arg),taygete)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Taygete

else ifeq ($(arg),alcyone)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Alcyone_(Pleiad)

else ifeq ($(arg),celaeno)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Celaeno_(Pleiad)

else ifeq ($(arg),asterope)
  $(info Detected Pleiades $(arg)
  value	:= pleiades
  url	:= https://en.wikipedia.org/wiki/Asterope_(Greek_myth)

else
  $(info USER=$(arg) is not a figure in Greek mythology)
  value	=  catchall
  url	:= $(null)
fi

## -----------------------------------------------------------------------
## -----------------------------------------------------------------------
all :
	@echo "Detected value is [$(value)]"
	@echo "URL=[$(url)]"

# [EOF]
