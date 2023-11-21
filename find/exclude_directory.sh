#!/bin/bash

find / \
     -not -path '/tmp' \
     -not -path '/run' \
     -not -path '/proc' \
     -print
