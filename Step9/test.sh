#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .
cmake --install . --prefix "./installdir"
ctest -N
ctest [-VV] -C Debug -D Experimental
cpack
# 2. test
# cd installdir/bin
tar -xzvf ./Tutorial-1.0-Linux.tar.gz
ls -l
# ./Tutorial 100
# ./Tutorial || true
