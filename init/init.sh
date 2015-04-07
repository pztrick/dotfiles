echo "init.sh ~ configures vimrc and gitconfig and updates submodules\ndoes NOT configure gui.sh"
bash psp.sh
bash ppa.sh
bash vimrc.sh
bash gitconfig.sh
bash ansible.sh
sudo apt-get install -y git
git pullall
sudo bash pip.sh
bash patrick.sh
bash extra.sh
cd ~
rm -rf .bashrc
ln -s .files/bashrc .bashrc
rm -rf .bash_aliases
ln -s .files/aliases .bash_aliases
