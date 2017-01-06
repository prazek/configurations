#!/bin/bash

sudo apt-get update

sudo apt-get install \
    g++ valgrind \
    vim \
    git git-svn subversion gitk \
    libedit-dev \
    ccache cmake-curses-gui ninja-build \
    sl \
    htop \

# this might fail
sudo apt-get install yakuake
sudo apt-get install \
    clang-3.7 clang-format-3.7 

# docs
sudo apt-get install sphinx-common

#arcanist

sudo apt-get install php7.0-cli php7.0-curl 
mkdir arcanist
cd arcanist
git clone https://github.com/phacility/libphutil.git
git clone https://github.com/phacility/arcanist.git


