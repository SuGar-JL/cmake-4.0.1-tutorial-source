#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .
# cmake --install . --prefix "/usr" # 默认安装到 /usr/local， 但是找不到共享库
cmake --install . --prefix "./installdir"
ctest -N
# ctest [-VV] -C Debug -D Experimental
cpack
cpack --config CPackSourceConfig.cmake
ls -l .
export LD_LIBRARY_PATH=./installdir/lib:$LD_LIBRARY_PATH
whereis Tutorial
# 2. test with install dir
Tutorial 100
Tutorial || true

# Linux 动态链接器默认只在标准库路径（如 /usr/lib）和程序的当前目录下查找 .so 文件
# 3. test with cpack
tar -xzvf ./Tutorial-1.0-Linux.tar.gz
tree ./Tutorial-1.0-Linux
Tutorial-1.0-Linux/bin/Tutorial 100
Tutorial-1.0-Linux/bin/Tutorial || true
