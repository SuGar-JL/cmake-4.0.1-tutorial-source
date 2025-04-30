#!/bin/bash

# 1. build
mkdir -p build && cd build
cmake ../
cmake --build .

# 2. test
output=$(./Tutorial 100)
echo "./Tutorial 100 => ${output}"
if [ "$output" != "The square root of 100 is 10" ]; then
    exit 1
fi

output=$(./Tutorial)
echo "./Tutorial => ${output}"
if [ "$output" != "Usage: ./Tutorial number" ]; then
    exit 1
fi
