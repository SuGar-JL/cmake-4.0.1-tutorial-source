#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .

# 2. test
./Tutorial 100
./Tutorial || true
