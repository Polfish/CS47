#!/bin/sh
# Goes to the current directory of the file, so put this file in the same directory as the program
cd "$(dirname "$0")" # You could also use cd "${0%/*}"

# https://stackoverflow.com/questions/11616835/r-command-not-found-bashrc-bash-profile Use this if you are using a Windows/Unix thing like Cygwin
# Compile program
gcc -c encrypt.cpp
gcc -L. -o p4 p4.cpp -lencrypt
gcc -shared -o libencrypt.dll encrypt.o

# Run Program
for counter in `seq 0 26`; do # For the for loop you can do C/Java style or {0..26..<how much to increment/decrement>}
./p4 "Frank Butt" 0 1 $counter & 
done > result.txt
	