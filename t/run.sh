#!	/usr/bin/bash

# echo "BUILDING"

rm main.o main
as main.s -I. -g  -o main.o
ld  main.o -o main 
./main

# as main.s  -g  -o main.o
# as syscalls.s -g -o syscalls.o
# as io.s -g -o io.o
# ld main.o syscalls.o io.o -o main2
# # ld main.o syscalls.o io.o -o main2

# ./main2
