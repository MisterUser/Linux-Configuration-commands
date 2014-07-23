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
alias syshow='sudo tail -n 50 -F /var/log/syslog | source-highlight --out-format=esc -o STDOUT -s log'
alias crep='GREP_COLOR="1;35" grep --color'
alias pout='ps aux | grep -v "grep" | GREP_COLOR="1;35" grep --color "$@"'


