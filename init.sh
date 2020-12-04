#!/usr/bin/env sh
apt-get update
apt-get install -y vim ctags cscope

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

cat vimrc > ~/.vimrc
vim +PluginInstall +visual +qall
