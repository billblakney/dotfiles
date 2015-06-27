#!/bin/bash
############################
# Copy home directory files to dotfiles.
############################
if [ "$#" -lt 1 ]; then
    echo "Usage: ${0##*/} dot.bashrc ..."
    exit 1
fi

# Regular expression for ./dot.*
re='dot\.(.*)'

for arg in "$@"
do
   localname="$arg"
   if [[ $localname =~ $re ]]; then
      root="${BASH_REMATCH[1]}";
      homename="../.$root"
      if [[ -e $homename ]]; then
         echo cp $homename $localname
         cp $homename $localname
      else
         echo "WARNING: File not found: $homename"
      fi
   else
      echo "WARNING: Invalid request: $localname"
   fi
done
