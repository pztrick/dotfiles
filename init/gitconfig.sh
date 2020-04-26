sudo rm -r ~/.gitconfig 2> /dev/null
ln -s ~/.files/gitconfig ~/.gitconfig
sudo wget https://raw.githubusercontent.com/newren/git-filter-repo/master/git-filter-repo -O /usr/local/bin/git-filter-repo
sudo chmod +x /usr/local/bin/git-filter-repo
