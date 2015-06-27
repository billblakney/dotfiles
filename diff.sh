#!/bin/bash
############################
# diff.sh
# This script does a diff of specified local file versus the dotted file in
# the parent directory.
############################
if [ "$#" -ne 1 ]; then
    echo "Usage: ${0##*/} <fname>"
    exit 1
fi

echo diff $1 ../.$1
diff $1 ../.$1
