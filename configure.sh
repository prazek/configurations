#!/bin/bash

mkdir ~/.vim_backup

cp .bashrc .vimrc .gitconfig ~/
cp yakuakerc ~/.kde/share/config/yakuakerc

#setting gold as linker
cd /usr/bin
sudo ln -sf ld.gold ld

cd -
sudo cp ccache++ /usr/bin/
# if you want to cache clang I would recomend ~40GB
ccache -M 40GB

#http://askubuntu.com/questions/72452/how-to-turn-off-compizs-drag-to-maximize-behaviour

