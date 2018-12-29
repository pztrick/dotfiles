#!/bin/bash
# set -e
# 
# echo "init.sh ~ configures vimrc and gitconfig and updates submodules\ndoes NOT configure gui.sh"
# bash psp.sh
# bash ppa.sh
# bash vimrc.sh
# bash gitconfig.sh
# sudo apt-get install -y git
git pullall
cd ~/.files/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~/.files/init
sudo bash pip.sh
# bash node.sh
bash extra.sh
cd ~
rm -rf .bashrc
ln -sf .files/bashrc .bashrc
rm -rf .bash_aliases
ln -sf .files/aliases .bash_aliases

sudo addgroup docker
sudo usermod -a -G docker patrick
