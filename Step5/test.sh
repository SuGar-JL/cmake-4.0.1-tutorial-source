#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .
cmake --install . --prefix "./installdir"
ctest -N
ctest -C Release -VV
# 2. test
cd installdir/bin
./Tutorial 100
./Tutorial || true
