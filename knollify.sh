#! /bin/bash

#Linux-Configuration-commands#
#============================#

#Commands to customize a new installation/system


#make vimdiff default git difftool
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.dt difftool
git config --global merge.tool vimdiff


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
