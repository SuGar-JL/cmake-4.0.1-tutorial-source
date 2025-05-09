#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .
cmake --install . --prefix "./installdir"
ctest -N
ctest [-VV] -C Debug -D Experimental
cpack
cpack --config CPackSourceConfig.cmake
ls -l .
# 2. test with install dir
# Linux 动态链接器默认只在标准库路径（如 /usr/lib）和程序的当前目录下查找 .so 文件
cp ./installdir/lib/libMathFunctions.so ./installdir/bin
tree ./installdir
cd ./installdir/bin
./Tutorial 100
./Tutorial || true

cd ../..
# 3. test with cpack
tar -xzvf ./Tutorial-1.0-Linux.tar.gz
cp ./Tutorial-1.0-Linux/lib/libMathFunctions.so ./Tutorial-1.0-Linux/bin
tree ./Tutorial-1.0-Linux
cd ./Tutorial-1.0-Linux/bin
./Tutorial 100
./Tutorial || true
