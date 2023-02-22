#!/bin/bash
# -----------------------------------------------------------------------
# Intent: Helper script, copy skeleton program into destination.
# -----------------------------------------------------------------------

## -----------------------------------------------------------------------
## Intent: Display program usage
## -----------------------------------------------------------------------
function help()
{
    cat <<EOH
Usage: $0 [options] ...
Options:
  --dst             Destination directory for file copy.
  --pgm             Name of command script to install.

  --help            Display this mesage
EOH
}

##----------------##
##---]  MAIN  [---##
##----------------##
while [ $# -gt 0 ]; do
    arg="$1"; shift
    case "$arg" in
	-*dst)  declare -g dst="$1"; shift ;;
	-*pgm)  declare -g pgm="$1"; shift ;;
	-*help) help ;;
	*) echo "[SKIP] Unknown argument $arg" ;;
    esac
done

# Derive pgm= from dst=
[[ ! -v dst ]]    && { echo "ERROR: --dst is required" ; exit 1; }
[[ ! -v pgm ]]    && { echo "ERROR: --pgm is required" ; exit 1; }
[[ -d "$dst" ]]   && { echo "ERROR: --dst exists $dst"   ; exit 1; }

declare -p dst
declare -p pgm

src="tmpl"
mkdir -p "$dst"
rsync -rv --checksum '.' "${dst}/."

## -----------------------------------------------------------------------
## Install:
##   o copy template sources into destination directory.
##   o augment command name and imports to enable the new tool
## -----------------------------------------------------------------------
pushd "$dst"

/bin/rm -v 'makefile'
/bin/rm -v 'README.md'
/bin/rm -v 'bin/deploy.sh'

mv -v 'bin/tmpl.py' "bin/${pgm}.py"
mv -v 'tmpl' "${pgm}"

find . -name '*.py' -print0 \
    | xargs -0 sed --in-place='' "s/import tmpl\./import ${pgm}./"
find . -name '*.py' -print0 \
    | xargs -0 sed --in-place='' "s/from tmpl\./from ${pgm}./"

set -x
tree .

bin/${pgm}.py --help
set +x

popd

# [EOF]
