#!/bin/bash
#
# Get list of all dot.* files.
list=($(find . -name 'dot.*'))
#
# Regular expression for ./dot.*
re='\.\/dot(.*)'
#
for i in ${list[@]};
do
   if [[ $i =~ $re ]]; then
      echo diff $i ../${BASH_REMATCH[1]};
      diff $i ../${BASH_REMATCH[1]};
   fi
done
