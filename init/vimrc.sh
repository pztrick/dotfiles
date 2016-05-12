sudo rm -r ~/.vim 2> /dev/null
sudo rm -r ~/.vimrc 2> /dev/null
ln -sf ~/.files ~/.vim
ln -sf ~/.files/vimrc ~/.vimrc
ln -sf ~/.files/tmux.conf ~/.tmux.conf
