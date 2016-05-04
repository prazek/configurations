#!/bin/bash
#script to build clang with clang tools
username='prazek'

#llvm
cd 
git clone http://llvm.org/git/llvm.git
cd llvm
git config branch.master.rebase true
git svn init https://llvm.org/svn/llvm-project/llvm/trunk --username=$username
git config svn-remote.svn.fetch :refs/remotes/origin/master
echo "fetching svn for $PWD"
git svn rebase -l | tail

#clang
cd tools
git clone http://llvm.org/git/clang.git
cd clang
git svn init https://llvm.org/svn/llvm-project/cfe/trunk --username=$username
git config svn-remote.svn.fetch :refs/remotes/origin/master
echo "fetching svn $PWD"
git svn rebase -l | tail

# clang-tidy clang-format etc
cd tools

git clone git@github.com:prazek/clang-extra.git extra
cd extra
git remote add upstream https://llvm.org/git/clang-tools-extra
git svn init https://llvm.org/svn/llvm-project/clang-tools-extra/trunk --username=$username
git config svn-remote.svn.fetch :refs/remotes/upstream/master
echo "fetching svn $PWD"
git svn rebase -l | tail

echo "Building"
cd
mkdir llvm-build
cd llvm-build
cmake ../llvm -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=ccache++ -DCMAKE_C_COMPILER=clang \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DLLVM_ENABLE_ASSERTIONS=ON
ninja check-all



