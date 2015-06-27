#!/bin/bash
############################
# get
# This script copies the specified local file to the dotted file
# in the parent directory.
############################
if [ "$#" -ne 1 ]; then
    echo "Usage: ${0##*/} <fname>"
    exit 1
fi

echo cp $1 ../.$1
cp $1 ../.$1
