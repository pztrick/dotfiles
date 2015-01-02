echo "init.sh ~ configures vimrc and gitconfig and updates submodules\ndoes NOT configure bashrc or aliases"
bash psp.sh
bash ppa.sh
bash vimrc.sh
bash gitconfig.sh
bash ansible.sh
sudo apt-get install -y git
git pullall
sudo bash pip.sh
