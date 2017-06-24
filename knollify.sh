#! /bin/bash

#Linux-Configuration-commands#
#============================#

#Commands to customize a new installation/system
sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install screen

# sudo apt-get -y install chromium-browser
# sudo apt-get -y install guake

# Latex
sudo apt-get install texlive texlive-lang-german texlive-doc-de texlive-latex-extra
sudo apt-get install dvipng  # for matplotlib

git clone https://github.com/MisterUser/Linux-Configuration-commands.git ~/linux_configs

ln -s ~/linux_configs/.bashrc ~/.bashrc
ln -s ~/linux_configs/.bash_aliases ~/.bash_aliases
ln -s ~/linux_configs/.vim ~/.vim
ln -s ~/linux_configs/.vim/.vimrc ~/.vimrc
ln -s ~/linux_configs/.screenrc ~/.screenrc

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
# numpy scipy matplotlib numba scikit-learn jupyter ipython 
# pip install jupyter

# install dropbox
# install chrome
# install pycharm



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
