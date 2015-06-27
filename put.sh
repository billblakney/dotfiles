#!/bin/bash
############################
# put
# This script copies the specified local file to the dotted file
# in the parent directory.
############################
if [ "$#" -lt 1 ]; then
    echo "Usage: ${0##*/} bashrc ..."
    exit 1
fi

for arg in "$@"
do
   root=$arg
   localname="dot.$arg"
   homename="../.$arg"

   if [ -e $localname ]; then
      echo cp $localname $homename
      cp $localname $homename
   else
      echo "WARNING: No dotfile for $arg"
   fi
done
