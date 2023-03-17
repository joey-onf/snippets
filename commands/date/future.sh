#!/bin/bash
## -----------------------------------------------------------------------
## Intent: Calculate future dates given an offset
## -----------------------------------------------------------------------

for span in '90 days' '2 months 10 days';
do
    echo
    echo "Date in the future: $span"
    when="$(date --date="$span")"
    echo "  $when"
done

# [EOF]
