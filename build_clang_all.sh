#!/bin/bash
#script to build clang with clang tools
username='prazek'

cd
mkdir full-release
cd full-release

#llvm
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
git clone http://llvm.org/git/compiler-rt.git

# lld
#cd ~/full-release/llvm/tools
#git clone http://llvm.org/git/lld.git

#cd ~/full-release/llvm/projects
git clone http://llvm.org/git/libcxx.git
git clone http://llvm.org/git/libcxxabi.git

cd ~/full-release
mkdir llvm-build-release
cd llvm-build-release
echo "Building in $PWD"

cmake ../llvm -GNinja -DCMAKE_BUILD_TYPE=Release
ninja check-all



