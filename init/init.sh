#!/bin/bash
set -e

echo "init.sh ~ configures vimrc and gitconfig and updates submodules\ndoes NOT configure gui.sh"
bash apt.sh
bash vimrc.sh
bash gitconfig.sh
git pullall
cd ~/.files/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~/.files/init
cd ~
rm -rf .bashrc
ln -sf .files/bashrc .bashrc
rm -rf .bash_aliases
ln -sf .files/aliases .bash_aliases

sudo addgroup docker
sudo usermod -a -G docker $USER
