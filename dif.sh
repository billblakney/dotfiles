#!/bin/bash
############################
# Diff local dotfiles with home directory.
############################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function usage {
   echo "Usage: ${0##*/} [<dotfile> [<dotfile> ...]]"
   echo "  Use zero args to diff all dotfiles"
   echo "  The format of a dotfile is \"dot.*\""
   exit 1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function error {
   echo $1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# main
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
args=($@)

# command-line flags
qregex='-q'
hregex='-h'

# command-line settings
qflag=""

#-------------------------
# process command-line args
#-------------------------
for arg in "${args[@]}"
do
   if [[ $arg =~ $hregex ]]; then
      usage
      exit 1
   elif [[ $arg =~ $qregex ]]; then
      qflag="-q"
      args=(${args[@]/$qflag/})
   fi
done

#-------------------------
# set dotfiles list
#-------------------------
if [ "${#args[@]}" -eq 0 ]; then
   dotfiles=($(find . -name 'dot.*'))
else
   dotfiles=( "${args[@]}" )
fi

#-------------------------
# process dotfiles
#-------------------------
regex='dot\.(.*)'

for dotfile in "${dotfiles[@]}"
do
   # Real dotfiles begin with "dot." prefix, but can be specified
   # on the command-line arguments with or without that prefix.
   if [[ $dotfile =~ $regex ]]; then
      root="${BASH_REMATCH[1]}"
   else
      root=$dotfile
   fi

   localname=dot.$root
   homename=../.$root

   if [[ ! -e $localname ]]; then
      echo "ERROR: Couldn't find $localname"
   elif [[ ! -e $homename ]]; then
      echo "ERROR: Couldn't find $homename"
   else
      #echo diff $qflag $localname $homename
      diff $qflag $localname $homename
   fi
done
