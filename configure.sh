#!/bin/bash

mkdir ~/.vim_backup

cp .bashrc .vimrc .gitconfig ~/

cd /usr/bin
#setting gold as linker
sudo ln -sf ld ld.gold

cd -
sudo cp ccache++ /usr/bin/
# if you want to cache clang I would recomend ~40GB
ccache -M 8GB

