#!/usr/bin/env sh

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

cat vimrc > ~/.vimrc

vim +PluginInstall +qall >/dev/null 2>&1
