#---------------------------------------------------------------------------
# Scott Hodgin's .bashrc file
#
# First Modified 2 May 2008
# Last Modified 20 July 2011
# Version 4
#
# This file is read by interactive shells only. Use this file to define
# aliases, functions and other interactive features for the command prompt.
#---------------------------------------------------------------------------


#---------------------------------------------------------------------------
# Aliases  
#---------------------------------------------------------------------------
# To temporarily bypass an alias, proceed the command with a \

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

if [ $OSTYPE == 'darwin10.0' ]; then
	alias ls='ls -h  -G'        # classify files in color
	alias ll='ls -hl -G'        # long list
	alias la='ls -hA -G'        # all but . and ..
	alias lal='ls -hlA -G'      # long and all
	alias lc='wc -l'            # count the lines in a document
    export LSCOLORS="gxfxcxdxbxegedabagacad"
else
	alias ls='ls -h --classify  --color=tty'        # classify files in color
	alias ll='ls -hl --color=auto'                  # long list
	alias la='ls -hAl --color=auto'                 # all but . and ..
	export LS_COLORS="di=01;36"                     # change directory color for ls
fi

alias unt='tar -zxvf' 							# un tar
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'                     # show differences in colour
alias py='python'

alias reload='source ~/.bashrc'


#---------------------------------------------------------------------------
# Mac Specific Settings 
#---------------------------------------------------------------------------

if  [ $OSTYPE == 'darwin10.0' ]; then
	CLICOLOR="xterm-color"  #default ``cons25'', ``xterm-color''
	LSCOLORS="gxfxcxdxbxegedabagacad"
fi


#---------------------------------------------------------------------------
# Exports
#---------------------------------------------------------------------------
export HISTFILESIZE=3000
#export HISTCONTROL=ignoredups #don't put duplicate lines in the history.
# Make bash append rather than overwrite the history on disk
# shopt -s histappend

# Use vim as default editor and man page viewer
export EDITOR=/usr/bin/vim
#export MANPAGER="col -b | view -c 'set ft=man nomod nolist' -"


#---------------------------------------------------------------------------
# Shell Options
#---------------------------------------------------------------------------
set -o vi #Use vi mode
# Don't wait for job termination notification
# set -o notify
# Don't use ^D to exit
# set -o ignoreeof
# Use case-insensitive filename globbing
# shopt -s nocaseglob


# start color scheme: \e[x;ym
# end color scheme:   \e[m

# black      0;30  Dark Gray    1;30
# Blue 	     0;34  Light Blue   1;34
# Green      0;32  Light Green  1;32
# Cyan       0;36  Light Cyan   1;36 
# Red        0;31  Light Red    1;31
# Purple     0;35  Light Purple 1;35
# Brown      0;33  Yellow       1;33
# Light Gray 0;37  White        1;37

# \u    current username
# \h    hostname
# \w    current working path          "~/.bash"
# \W    current working directory     ".bash"

PS1="\e[0;35m\w\e[m"
if [ $(whoami) == 'root' ]; then
	PS1="$PS1 \e[0;31m#\e[m "
else
	PS1="$PS1 \e[0;32m$\e[m "
fi


#---------------------------------------------------------------------------
# Completion options
#---------------------------------------------------------------------------
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


#---------------------------------------------------------------------------
# Functions
#---------------------------------------------------------------------------

function lswc()
{
	for FILE in $(ls); do echo "$FILE - $(cat $FILE | wc -l)"; done
}
