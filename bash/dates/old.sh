#!/bin/bash

echo "YESTERDAY"
date --date="yesterday" +%Y/%m/%d

echo "ONE MONTH"
date -d "30 days ago" +"%d/%m/%Y"

date --date='1 year ago'
# date -v -1d It will give (current date -1) means 1 day before .
# date -v +1d This will give (current date +1) means 1 day after.
