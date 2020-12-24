/* 
  encrypt.cpp - This file contains the code to encrypt and decrypt an input string
                and output the modified string.
*/

#include "key.h"
#include <string.h>

__declspec() long s_encrypt (char *src, char* dest, long en_flag);
__declspec() void get_key (long *dir, long *count);
__declspec() void set_key (long dir, long count);

__declspec() void get_key (long *dir, long *count)
{
	*dir = direction;
	*count = shiftcount;
}

__declspec() void set_key (long dir, long count)
{
	direction = dir;
	shiftcount = count;
}


__declspec() long s_encrypt (char *src, char* dest, long en_flag)
{
  
  long characters_changed = 0; // How many characters changed
  
asm
(
	"movq %1, %%rax;" // Move src into %rax
	"movq %%rax, %%r11;" // Move %rax into %r11 because doing the modulus later on requires %rax
    "movq %2, %%rbx;" // Move dest into %rbx
    "movq %3, %%rcx;" // Move en_flag into %rcx
	"movq %4, %%rax;" // Move shiftcount into %rsi
	"movq $26, %%rsi;" // Move 26 into %rsi
	"cqo;" // Convert quadword to octword; Set up for doing division/modulus
	"idivq %%rsi;" // Divide %rax by %rsi and remainder is in %rdx
	"movq %%rdx, %%rsi;" // Move %rdx, which is the remainder into %rsi
	"movq %%r11, %%rax;" // Move %r11 back into %rax, restoring %rax
	"xorq %%r8, %%r8;" // XOR %r8 with %r8, which is used a counter for how many characters have changed
	"xorq %%rdi, %%rdi;" // Used as string length
	
"string_length:" // Loop to find the string length
	"movb (%%rax,%%rdi,1), %%dl;" // Move the byte at %rax + %rdi * 1 to %dl
	"testb %%dl, %%dl;" // Test %dl with %dl
	"je loop_start;" // If %dl is equal to %dl, jump to test. So, this will only jump to test when %dl is equal to 0.
	"incq %%rdi;" // Increment %rdi
	"jmp string_length;" // Unconditional jump to string_length

"loop_start:" // Start of loop
	"movq %5, %%r9;" // Move direction into %r9
    "movb (%%rax), %%dl;" // Move dereferenced %rax into %dl
	"cmpb $0x41, %%dl;" // Compare 'A' (0x41) with %dl
	"jl next;" // If byte stored in %dl is less than 'A' (0x41), then jump to next
	"cmpb $0x5A, %%dl;" // Compare 'Z' (0x5A) with %dl
	"jle test;" // If byte stored in %dl is less than or equal to 'Z' (0x5A), then jump to lower
	"cmpb $0x61, %%dl;" // Compare 'a' (0x61) with %dl
	"jl next;" // If byte stored in %dl is less than 'a' (0x61), then jump to next
	"cmpb $0x7A, %%dl;" // Compare 'z' (0x7A) with %dl
	"jg next;" // If byte stored in %dl is greater than 'z' (0x7A), then jump to next
	
"test:"
	"xorq %%rcx, %%r9;" // XOR %rcx with %r9
	"cmpq $1, %%r9;" // Compare %r9 with 1
	"je backward;" // If %r9 is equal to 1 jump to backward

"forward:" // Shifts characters forward. Have to use unsigned jump instruction for these because with 
		   // signed jumps, anything over 0x7A is negative, which causes characters not to be cycled if they go over 0x7A.
	"movb %%dl, %%r10b;"
	"addb %%sil, %%dl;" // Add %sil to %dl, where %sil is the shift count
	"incq %%r8;" // Increment %r8
	"cmpb $0x5A, %%dl;" // Compare 'Z' (0x5A) with %dl
	"jbe cycle_test_upper;" // If %dl less than or equal to 'Z' (0x5A), jump to cycle_test_upper
	"cmpb $0x61, %%dl;" // Compare 'a' (0x61) with %dl
	"jb cycle_max;" // If %dl is less than 'a' (0x61), then jump to cycle_max
	"cmpb $0x7A, %%dl;" // Compare 'z' (0x7A) with %dl
	"ja cycle_max;" // If %dl is greater than 'z' (0x7A) then jump to cycle_max
	"jmp cycle_test_lower;" // Unconditional jump to cycle_test_lower

"backward:" // Shifts characters backward
	"movb %%dl, %%r10b;"
	"subb %%sil, %%dl;" // Subtract %sil from %dl
	"incq %%r8;" // Increment %r8
	"cmpb $0x41, %%dl;" // Compare 'A' (0x41) with %dl
	"jl cycle_min;" // If %dl is less than 'A' (0x41), then jump to cycle_min
	"cmpb $0x5A, %%dl;" // Compare 'Z' (0x5A) with %dl
	"jle cycle_test_upper;" // If %dl is less than or equal to 'Z' (0x5A), then jump to cycle_test_upper
	"cmpb $0x61, %%dl;" // Compare 'a' (0x61) with %dl
	"jl cycle_min;" // If %dl is less than 'Z' (0x5A), then jump to cycle_min
	"jmp cycle_test_lower;" // Unconditional jump to cycle_test_lower
	
"cycle_test_lower:" // If %dl after shifting is lowercase, see if %dl was originally uppercase, which means the character needs to be cycled
	"cmpb $0x5A, %%r10b;" // Compare 'Z' (0x5A) with %r10b, which stores the original %dl
	"jle cycle_max;" // If %r10b is less than or equal to 'Z' (0x5A), jump to cycle_max
	"jmp toggle_case;" // Unconditional jump to toggle_case

"cycle_test_upper:" // If %dl after shifting is uppercase, see if %dl was originally lowercase, which means the character needs to be cycled
	"cmpb $0x61, %%r10b;" // %dl is uppercase, but %r10b is actually lowercase
	"jge cycle_min;"
	"jmp toggle_case;" // Unconditional jump to toggle_case

"cycle_min:" // If shiftcount makes %dl less than the minimum hex number for being a character, then make %dl back into a character
	"addb $26, %%dl;" // Add 26 to %dl
	"jmp toggle_case;" // Unconditional jump to next

"cycle_max:" // If shiftcount makes %dl greater than the maximum hex number for being a character, then make %dl back into a character
	"subb $26, %%dl;" // Subtract 26 to %dl

"toggle_case:" // Toggles the case of characters
	"cmpb $0x5A, %%dl;" // Compare 'Z' (0x5A) with %dl
	"jle to_lower;" // If byte stored in %dl is less than or equal to 'Z' (0x5A), then jump to to_lower
	"subb $0x20, %%dl;" // Subtract 0x20 to %dl converts lowercase to uppercase
	"jmp next;" // Unconditional jump to test

"to_lower:" // Convert uppercase to lowercase
	"addb $0x20, %%dl;" // Add 0x20 to %dl; basically converts uppercase letters to lowercase

"next:" // Before going to next iteration of the loop
    "movb %%dl, (%%rbx);" // Move %dl into dereferenced %rbx
    "inc %%rax;" // Increment %rax
    "inc %%rbx;" // Increment %rbx
    "dec %%rdi;" // Decrement %rdi
    "cmpq $0, %%rdi;" // Compare %rdi with 0
    "jne loop_start;" // If rdi not equal to 0, then jump to loop_start
    "movb $0, (%%rbx);" // Move 0 into dereferenced %rbx
	"movq %%r8, %%rax;" // Move %r8 into %rax
 	 : "=a" (characters_changed)
	 : "r" (src), "m" (dest), "m" (en_flag), "m" (shiftcount), "m" (direction)
	 : 
	 );

	return characters_changed;

}