Name: Paul Chon (014018771)
OS: Windows 64-bit
Code is in 64-bit

Compiler: Cygwin 64-bit gcc 10.2.0 (If you are going to download this compiler, then you should know 
that Cygwin by default does NOT come with gcc, you have to find the gcc package when installing 
Cygwin and install the one you want, which in this case is gcc 10.2.0)

Output for "gcc --version":
gcc (GCC) 10.2.0
Copyright (C) 2020 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Note:
Added the direction variable into the inline assembly, which wasn't there before. 
(IMPORTANT) When using double quotes for the input string and putting an exclamation mark at the 
beginning of the input string, it returns the error: event not found. For example:
$ ./p4 "!FOK&M3Fgg" 0 1 5
bash: !FOK: event not found

The way that I've found to go around this is to use single quotes instead of double
quotes and it will work. Using the same example as before:
$ ./p4 '!FOK&M3Fgg' 0 1 5
Current keys: Direction=1, Shiftcount=5
Source string = !FOK&M3Fgg
Target string = !ajf&h3aBB
Number of characters converted = 7

