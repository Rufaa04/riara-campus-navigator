#!/bin/sh
# Linux / macOS
g++ -std=c++17 -O2 -Wall -o navigator src/main.cpp -pthread && echo "Built ./navigator  ->  run:  ./navigator"
