#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .
cmake --install . --prefix "./installdir"
ctest -N
ctest [-VV] -C Debug -D Experimental
# 2. test
cd installdir/bin
./Tutorial 100
./Tutorial || true
