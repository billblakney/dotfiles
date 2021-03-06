#!/bin/bash
############################
# Copy home directory files to dotfiles.
############################

function usage {
   echo "Usage: ${0##*/} [<dotfile> [<dotfile> ...]]"
   echo "  Use zero args to diff all dotfiles"
   echo "  The format of a dotfile is \"dot.*\""
   exit 1
}

function error {
   echo $1
}

if [ "$#" -eq 1 ] && [ "$1" == "-h" ]
then
   usage
fi

if [ "$#" -eq 0 ]; then
   dotfiles=($(find . -name 'dot.*'))
else
   dotfiles=( "$@" )
fi

regex='dot\.(.*)'

for dotfile in "${dotfiles[@]}"
do
   if [[ $dotfile =~ $regex ]]; then
      root="${BASH_REMATCH[1]}"
   else
      root=$dotfile
   fi

   localname=dot.$root
   homename=../.$root

   if [[ ! -e $homename ]]; then
      echo "ERROR: Couldn't find $homename"
   else
      echo cp $homename $localname
      cp $homename $localname
   fi
done
