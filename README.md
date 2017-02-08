# get vim-config
```
git clone https://github.com/llynch/vim-config.git vim-config
```

# setup vim-config
```
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
ln -s $(readlink -f vim-config/.vimrc) ~/.vimrc
ln -s $(readlink -f vim-config) ~/.vim
```

# get vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

# setup vim
```
:PluginInstall
```
