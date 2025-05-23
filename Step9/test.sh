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
# 2. test
ls -l ./installdir
./installdir/bin/Tutorial 100
./installdir/bin/Tutorial || true

tar -xzvf ./Tutorial-1.0-Linux.tar.gz
ls -l ./Tutorial-1.0-Linux
./Tutorial-1.0-Linux/bin/Tutorial 100
./Tutorial-1.0-Linux/bin/Tutorial || true
