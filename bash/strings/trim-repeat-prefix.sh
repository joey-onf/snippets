#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Remove repeating character prefix from a string
## -----------------------------------------------------------------------

shopt -s extglob

##----------------##
##---]  MAIN  [---##
##----------------##
declare str='zzzzzz foo bar'
printf "${str##+(z)}\n"


# [SEE ALSO]
# https://stackoverflow.com/questions/66816956/remove-repeated-characters-from-the-beginning-of-a-string-in-bash
