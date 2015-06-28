#!/bin/bash
############################
# Diff local dotfiles with home directory.
############################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function usage {
   echo "Usage: ${0##*/} [-q] [-v] [-h] [<dotfile_list>]"
   echo "   -h = print help"
   echo "   -q = do diffs with -q (quite mode)"
   echo "   -v = verbose output"
   echo "   <dotfile_list> is list of local dotfiles."
   echo "      A local dotfile may be specified with or without the \"dot.\"prefix."
   echo "      For example, the command \"dif.sh vimrc\" is equivalent to the command"
   echo "      \"dif.sh dot.vimrc\""
   echo ""
   echo "If no dotfiles are specified, all dotfiles will be diffed"
   exit 1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function error {
   echo ERROR: $1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function warn {
   echo WARN: $1
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# main
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
args=($@)

# command-line flags
qregex='-q'
hregex='-h'
vregex='-v'

# command-line settings
qflag=""
vflag=0

#-------------------------
# process command-line flags
# remove them from args
#-------------------------
for arg in "${args[@]}"
do
   if [[ $arg =~ $hregex ]]; then
      usage
      exit 1
   elif [[ $arg =~ $qregex ]]; then
      qflag="-q"
      args=(${args[@]/$qregex/})
   elif [[ $arg =~ $vregex ]]; then
      vflag=1
      args=(${args[@]/$vregex/})
   fi
done

# test code
#echo numargs: ${#args[@]}
#echo args: ${args[@]}
#exit 1

#-------------------------
# set dotfiles list
# if args is empty, do all dotfiles
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
      root=${BASH_REMATCH[1]}
   else
      root=$dotfile
   fi

   localname=dot.$root
   homename=../.$root

   if [[ ! -e $localname ]]; then
      error "Couldn't find $localname"
   elif [[ ! -e $homename ]]; then
      error "Couldn't find $homename"
   else
      if [ $vflag -eq 1 ]; then
         echo diff $qflag $localname $homename
      fi
      diff $qflag $localname $homename
   fi
done
