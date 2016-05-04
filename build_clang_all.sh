#!/bin/bash
#script to build clang with clang tools
username='prazek'

mkdir full-release
cd full-release

#llvm
cd 
git clone http://llvm.org/git/llvm.git
cd llvm

#clang
cd tools
git clone http://llvm.org/git/clang.git
cd clang

# clang-tidy clang-format etc
cd tools
git clone http://llvm.org/git/clang-tools-extra.git extra

# sanitizers
cd ~/full-release/llvm/projects
% git clone http://llvm.org/git/compiler-rt.git

# lld
cd ~/full-release/llvm/tools
git clone http://llvm.org/git/lld.git

cd ~/full-release/llvm/projects
git clone http://llvm.org/git/libcxx.git
git clone http://llvm.org/git/libcxxabi.git


echo "Building"
cd ~/full-release

mkdir llvm-build-release
cd llvm-build-release
cmake ../llvm -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc
ninja check-all



