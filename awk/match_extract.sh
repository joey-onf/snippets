#!/bin/bash

git status | awk -F':' 'modified: {print $2}'
