#!/bin/bash

#create bundle directory
mkdir -p ~/.vim/bundle

#install necessary software
sudo apt-get install vim
sudo apt install build-essential cmake python3-dev
sudo apt-get install tmux

#clone vundle plugin manager and YouCompleteMe
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ycm-core/YouCompleteMe ~/.vim/bundle/

#copy vimrc and tmux.conf files to home directory
cp .vimrc ~/
cp .tmux.conf ~/

#install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
python3 ~/.vim/bundle/YouCompleteMe/install.py --clangd-completer
cd

#install plugins from vimrc
vim +PluginInstall +qall
