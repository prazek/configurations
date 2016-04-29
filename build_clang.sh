#!/bin/bash
#script to build clang with clang tools
username='prazek'

#llvm
cd 
git clone http://llvm.org/git/llvm.git
cd llvm
git config branch.master.rebase true
git svn init https://llvm.org/svn/llvm-project/llvm/trunk --username=<$username>
git config svn-remote.svn.fetch :refs/remotes/origin/master
git svn rebase -l

#clang
cd tools
git clone http://llvm.org/git/clang.git
cd clang
git svn init https://llvm.org/svn/llvm-project/cfe/trunk --username=<$username>
git config svn-remote.svn.fetch :refs/remotes/origin/master
git svn rebase -l

# clang-tidy clang-format etc
cd tools
git clone http://llvm.org/git/clang-tools-extra.git extra
git svn init https://llvm.org/svn/llvm-project/clang-tools-extra/trunk --username=<$username>
git config svn-remote.svn.fetch :refs/remotes/origin/master
git svn rebase -l

# sanitizers
cd ~/llvm/projects
% git clone http://llvm.org/git/compiler-rt.git

# lld
cd ~/llvm/tools
git clone http://llvm.org/git/lld.git

echo "Building"
cd
mkdir llvm-build-release
cmake ../llvm -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=ccache++ -DCMAKE_C_COMPILER=clang -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
ninja check-all



