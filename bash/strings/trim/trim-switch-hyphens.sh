#!/bin/bash

for raw in '--foo' '-bar' 'abc' '-----def';
do
    arg="$raw"
    arg="${arg##--*}"
    echo "** ARG=[$arg], RAW=[$raw]"
done
