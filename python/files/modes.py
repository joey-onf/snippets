#!/usr/bin/env python
## -----------------------------------------------------------------------
## Intent:
##   o create a temp directory with permission restricted to the owner.
## -----------------------------------------------------------------------

##-------------------##
##---]  IMPORTS  [---##
##-------------------##
import os
from pathlib           import Path
import tempfile

##----------------##
##---]  MAIN  [---##
##----------------##
default_mode  = 0o0700 # owner-access-only
default_umask = 0o0077 # mask group and other

os.umask(default_mode)

temp_dir  = tempfile._get_default_tempdir()
temp_name = next(tempfile._get_candidate_names())

## Create a new directory
path = Path(temp_dir + '/' + temp_name)
if not path.exists():
    path.mkdir(mode=default_mode, exist_ok=True)

## Adjust mode if directory is pre-existing
temp_str  = path.as_posix()
mode = path.stat().st_mode
if mode != default_mode:
    path.chmod(default_mode)

# import pdb
# pdb.set_trace()

print("temp_str = %s" % temp_str)
path.rmdir()

# [EOF]
