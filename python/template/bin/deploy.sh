#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Deploy template as a new program.
# -----------------------------------------------------------------------

src="tmpl"
# dst='validate'
dst=''
if [ ${#dst} -eq 0 ]; then
    echo "Select a program name to deploy"
    exit 1
fi

if [ ! -d "$validate" ]; then
    mv -v "${src}" "$validate"
fi

find . -name '*.py' -print0 \
     | xargs -0 sed --in-place='' "s/${src}/${dst}/g"

# [EOF]
