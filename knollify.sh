#! /bin/bash

#Linux-Configuration-commands#
#============================#

#Commands to customize a new installation/system

# First download git: 
# $ sudo apt-get -y install git
# $ git clone https://github.com/MisterUser/Linux-Configuration-commands.git ~/.linux_configs
# $ chmod +x ~/.linux_configs/knollify.sh
# $ ~/.linux_configs/knollify.sh

# Create backup directories
mkdir ~/Books
mkdir ~/Movies
mkdir ~/Personal_Movies
mkdir ~/Personal_Music
mkdir ~/Personal_Photos
mkdir ~/Workspace

cd ~

sudo apt -y install git 
sudo apt -y install vim
sudo apt -y install tmux 
sudo apt -y install tree
sudo apt -y install ncurses-term
sudo apt -y install gtk-redshift
sudo apt -y install gparted
sudo apt -y install exfat-fuse exfat-utils
sudo apt -y install inkscape
sudo apt -y install htop
sudo apt -y install wget
sudo apt -y install texstudio
# If Ubuntu: sudo apt -y install guake
# for Xubuntu->Settings->Keyboard->Shortcuts->Add
#      paste 'xfce4-terminal --drop-down' 
#      then give F12 as hotkey

# Latex
sudo apt-get -y install texlive texlive-lang-german texlive-doc-de texlive-latex-extra
sudo apt-get -y install dvipng  # for matplotlib


# config files
mv ~/.bashrc ~/.bashrc_old
ln -s ~/.linux_configs/.bashrc ~/.bashrc
ln -s ~/.linux_configs/.bash_aliases ~/.bash_aliases
ln -s ~/.linux_configs/.vim ~/.vim
ln -s ~/.linux_configs/.vim/.vimrc ~/.vimrc
ln -s ~/.linux_configs/.screenrc ~/.screenrc
ln -s ~/.linux_configs/.tmux.conf ~/.tmux.conf

source .bashrc

#make vimdiff default git difftool
git config --global user.email "mr@user.com"
git config --global user.name "Mr User"
git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.dt difftool
git config --global merge.tool vimdiff


# install Anaconda or Miniconda
# export PATH="/home/mr_user/anaconda3/bin:$PATH"
# conda install numpy scipy matplotlib numba scikit-learn jupyter ipython seaborn


# [DEPRECATED]install chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt-get -y install libappindicator1 libindicator7
# sudo dpkg -i google-chrome-stable_current_amd64.deb
# rm -f google-chrome-stable_current_amd64.deb

# [DEPRECATED] install dropbox
# use .deb package
# then in settings-> session and startup -> application autostart
#  change Dropbox code to
#   sleep 15 && dropbox stop && env DBUS_SESSION_BUS_ADDRESS="" dropbox start -i




sudo apt-get update && sudo apt-get upgrade -y

# Other Programs
# install pycharm -> code in dropbox/Schule/TU_Berlin/6OUUZ3ECUO.txt
# Dropbox
# Mendeley Desktop
# Terminator
# Rosegarden
# Ardour
# tuxguitar
# QjackCTL
# guitarix
# Audacity
# Hydrogen (drums)
# julia
# Calibre


#-------------------------------NOTES----------------------------#
#---For Qt Xterm settings---#
#edit .Xresources in home directory
# xterm*font: *-fixed-*-*-*-20-*
# xterm*vt100*geometry: 70x300+0+0

#then reload X using 
# $ xrdb -merge ~/.Xresources

#to see gitlog in vim
# git log | vim - -R

#to splice git log into files
# git log | grep source/Networks/ZigBee/generic_zigbee_device.cpp/.h | awk -v RS='[@]' '{print}'
