# get vim-config
```
git clone https://github.com/llynch/vim-config.git vim-config
```

# setup vim-config
```
mv ~/.vimrc ~/.vimrc.old
mv ~/.vim ~/.vim.old
ln -s $(readlink -f vim-config) ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

# setup vim
```
:PlugInstall
```
