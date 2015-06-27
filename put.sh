#!/bin/bash
############################
# Copy dotfiles to home directory.
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
      if [[ -e $localname ]]; then
         echo cp $localname $homename
         cp $localname $homename
      else
         echo "WARNING: File not found: $localname"
      fi
   else
      echo "WARNING: Invalid request: $localname"
   fi
done
