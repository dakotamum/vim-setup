#!/bin/bash

#install necessary software
sudo apt-get install neovim
sudo apt install build-essential cmake python3-dev
sudo apt-get install tmux

mkdir -p ./config/nvim/

#clone vundle plugin manager and YouCompleteMe
git clone https://github.com/ycm-core/YouCompleteMe ~/.config/nvim/autoload/plugged/YouCompleteMe

#copy vimrc and tmux.conf files to home directory
cp .init ~/.config/nvim/
cp .tmux.conf ~/

#install YouCompleteMe
cd ~/.config/nvim/autoload/plugged/YouCompleteMe
git submodule update --init --recursive
python3 ~/.config/nvim/autoload/plugged/YouCompleteMe/install.py --clangd-completer
cd

#install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

#install plugins from vimrc
nvim +PlugInstall +qall
