# base-files version 3.9-3

# To pick up the latest recommended .bashrc content,
# look in /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# Environment Variables
# #####################

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP=/tmp
# export TEMP=/tmp

# Or use TMPDIR instead
# export TMPDIR=/tmp

# Added by Bill
PATH=${PATH}:/cygdrive/c/Program\ Files/Vim/vim74
PATH=${PATH}:/cygdrive/m/workspace/perlscripts/cg
PATH=${PATH}:/cygdrive/c/tools/apache-ant-1.9.4/bin
PATH=${PATH}:/cygdrive/c/tools/ctags58
PATH=${PATH}:/cygdrive/c/tools/eclipse
PATH=${PATH}:/cygdrive/c/tools/Qt/5.3/mingw482_32/bin
PATH=${PATH}:/cygdrive/c/Program\ Files\ \(x86\)/VideoLan/VLC:/usr/sbin
PATH=${PATH}:~/util
PATH=.:${PATH}

# Shell Options
# #############

# See man bash for more options...

# Don't wait for job termination notification
# set -o notify

# Don't use ^D to exit
# set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"
export HISTCONTROL="ignoreboth"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
#
alias ls='ls -1gABFG --color=always --file-type --group-directories-first'
alias v='~/scripts/vimwrapper.sh' 
#
# aliases related to environment/configuration
#
alias s='source ~/.bashrc' 
alias qb='~/scripts/vimwrapper.sh ~/.bashrc'
alias qv='~/scripts/vimwrapper.sh c:/Program\ Files/Vim/_vimrc'
alias h='history'
alias hc='history -c'
#
# directory/project specific aliases
#
alias ws='cd; cd ~/workspace'
alias rd='cd; cd ~/workspace/rundat'
alias of='cd; cd ~/workspace/ofagent'
alias sw1='cd ~/workspace/ofagent/switches/roadm1'
alias sw2='cd ~/workspace/ofagent/switches/roadm2'
alias sw3='cd ~/workspace/ofagent/switches/roadm3'
alias x3='cd /cygdrive/n/sonar'
#
# aliases: other
#
alias gvs='gvim -S Session.vim &'
alias jj='dojacobe.sh'
#
# source alias files
source ~/.bash.alias.dotfiles
source ~/.bash.alias.git


# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

# These lines fix some bash bugs related to processing of the '\r' character.
# I ran into these bugs when compiling log4cxx and found this solution on
# the web. -Bill Blakney, jan2013
export SHELLOPTS
set -o igncr

# I added this so that I can run gitk from the bash shell. Need to start
# the X11 server first, though, before it can be run.
export DISPLAY=:0.0

# Added by Bill, mar2013, to allow gvim command "vert diffsplit <fname>" to work.
export TMP=~/tmp
export TEMP=~/tmp
export TMPDIR=~/tmp
export TEMPDIR=~/tmp
# Was having some problem at one time and so added the GIT_DISCOVERY.. export.
# But I don't think it was related to the problem, and coudl probably be removed.
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export JAVA_HOME=c:/Program\ Files/Java/jdk1.7.0_67
