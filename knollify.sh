#! /bin/bash

Linux-Configuration-commands
============================

Commands to customize a new installation/system

#always have syntax highlighting on in vim
echo "syntax on" > ~/.vimrc

#make vimdiff default git difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.dt difftool
git config --global merge.tool vimdiff


#---Aliases---#
#monitor system log with syntax highlighting
sed -i '$a alias syshow=\x27sudo tail -n 50 -F /var/log/syslog | source-highlight --out-format=esc -o STDOUT -s log\x27' ~/.bash_aliases
sed -i '$a alias crep=\x27GREP_COLOR="1;35" grep --color\x27' ~/.bash_aliases
sed -i '$a alias pout=\x27ps aux | grep -v "grep" | GREP_COLOR="1;35" grep --color "$@"\x27' ~/.bash_aliases
