# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

color_prompt=yes
filecount=$(ls -l | grep "^-" | wc -l)
dircount=$(ls -l | grep "^d" | wc -l)
# dirsize=$(du -hs | awk '{print $1}')
if [[ ${EUID} == 0 ]] ; then
    sq_color="\[\033[0;31m\]"
    user_color="\[\e[38;5;15m\]"
else
    # sq_color="\[\033[0;34m\]"
    user_color="\[\e[38;5;53m\]"
    sq_color="\[\e[01;34m\]"
    # sq_color="\[\e[38;5;27m\]"
fi

ender="\[\e[00m\]"
mach_color="\[\e[38;5;6m\]"
prompt1="$sq_color\342\224\214\342\224\200[$ender"
promptdiv1="$sq_color]\342\224\200[$ender"
promptdiv2="$sq_color]\342\224\200($ender"
promptdiv3="$sq_color)\342\224\200[$ender"
user_info="$user_color\u$mach_color@\h$ender"
dir_info="$user_color\w$ender$user_color"
prompt3="$sq_color\342\224\224\342\224\200\342\225\274\[\e[00m\]"
prompt4="$sq_color\342\224\200\342\226\210\342\226\210$ender"
promptTime="$promptdiv1$user_color\A \d$sq_color]$ender"

if [ "$color_prompt" = yes ]; then

    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="${debian_chroot:+($debian_chroot)}\n\n$prompt1$user_info$promptdiv1$dir_info$ender$promptTime\n$prompt3"

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Miniconda3 4.3.21 installer
# export PYTHONPATH="${PYTHONPATH}:/home/mr_user/Dropbox/Schule/TU_Berlin/python_lib"
export PATH="/home/mr_user/miniconda3/bin:$PATH"
export PATH="/home/mr_user/Workspace/kingdom-death-monster:$PATH"
export PYTHONPATH="/home/mr_user/Workspace/neuronaldynamics-exercises:${PYTHONPATH}"
export PYTHONPATH="/home/mr_user/Workspace:${PYTHONPATH}"
export PYTHONPATH="/home/mr_user/Workspace/phd_codebase:${PYTHONPATH}"
