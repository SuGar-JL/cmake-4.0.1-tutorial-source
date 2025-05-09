#!/bin/bash

# 1. build
mkdir debug && cd debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build .
cd ..
mkdir release && cd release
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .
ctest -N
ctest [-VV] #-C Debug -D Experimental

cd ..
cpack --config MultiCPackConfig.cmake
ls -l .
