sudo rm -r ~/.vim 2> /dev/null
sudo rm -r ~/.vimrc 2> /dev/null
ln -s ~/.files ~/.vim
ln -s ~/.files/vimrc ~/.vimrc
ln -s ~/.files/tmux.conf ~/.tmux.conf
