#!/bin/bash

# https://stackoverflow.com/questions/6585895/command-line-program-to-indent-php-files

find . -name '*.php' -printf "echo -e \"G=gg\n:wq\n\" | vim %p\n" | sh
