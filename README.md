### Clone your dotfiles
```
git clone git://github.com/pztrick/dotfiles.git .files
```

### Clone any submodules
```
cd .files
git submodule init
git submodule update
```

### Set up your symbolic links
```
ln -s .files/bashrc .bashrc
ln -s .files/aliases .bash_aliases
ln -s .files/gitconfig .gitconfig
ln -s .files/vimrc .vimrc
ln -s .files .vim
```

### How to install a new vim plugin
```
git submodule add git://github.com/author/vim-plugin-name.git bundle/plugin-name
git add .
git commit -m 'Added plugin ~ plugin-name`
```

### How to update installed plugins
```
git submodule foreach git pull origin master
```

### Plugins Reference

vim-togglemouse

* `<F12>` toggles mouse focus between terminal cursor and vim cursor

vim-multiple-cursors

* `<C-n>` advances to next iteration of selection
* `<C-x>` ignores current selection and advances to next
* `<C-p>` returns to previous selection

### Useful git commands

```
DIR=lib/xyz/Documentation; git filter-repo --path $DIR --invert-paths
git filter-repo --path-glob '*.chm' --invert-paths
```
