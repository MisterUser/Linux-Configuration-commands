#! /bin/bash

#Linux-Configuration-commands#
#============================#

#Commands to customize a new installation/system

#always have syntax highlighting on in vim
echo "syntax on" > ~/.vimrc
map <F7> :%s/\%V#/ /
map <F8> :%s/\%V/#/

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
sed -i '$a alias la=\x27ls -a\x27' ~/.bash_aliases
sed -i '$a alias ll=\x27ls -l -a\x27' ~/.bash_aliases



#----Command Prompt Color----#
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\n\n\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\[\033[01;32m\]\$\[\033[00m\]'


#---For Qt Xterm settings---#
#edit .Xresources in home directory
xterm*font: *-fixed-*-*-*-20-*
xterm*vt100*geometry: 70x300+0+0

#then reload X using 
$ xrdb -merge ~/.Xresources

#to see gitlog in vim
git log | vim - -R

#to splice git log into files
git log | grep source/Networks/ZigBee/generic_zigbee_device.cpp/.h | awk -v RS='[@]' '{print}'
