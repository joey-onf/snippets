#!/bin/bash

grep -r --exclude={\*~,\*.map} "OK" bar/ | grep -vP '(?<!debug)\.js'
