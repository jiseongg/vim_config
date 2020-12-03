#!/usr/bin/env sh
apt-get update
apt-get install -y ctags cscope

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

mv vimrc ~/.vimrc
