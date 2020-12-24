/* Project 2 by Paul Chon*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/**
* Sorts a list either ascending or descending
* long* list - points to the address of the list
* count - how many numbers there are in the list
* opcode - 1 for ascending and 2 for descending
*/
void sorter (long* list, long count, long opcode)
{
asm
(
	"movq %0, %%rax;" // Move list to %rax
	"movq %1, %%rbx;" // Move opcode to %rbx
	"movq %2, %%rcx;" // Move count to %rcx for the outer loop
	"movq %%rcx, %%rdi;" // Also move count to %rdi for the inner loop
	"decq %%rcx;" // Decrement %rcx because the outer loop is count - 1
	"xorq %%rdx, %%rdx;" // XOR %rdx, which will act as the outer loop counter or x
	"xorq %%rsi, %%rsi;" // XOR %rsi, which will act as the inner loop counter or y
	
"outer_loop:" // The outer for loop
	"cmpq %%rdx, %%rcx;" // Compare %rcx with %rdx
	"jle done;" // If %rcx is less than or equal to %rdx jump to done
	"movq %%rdx, %%rsi;" // Move %rsi to %rdx which is the same as y=x
	
	"inner_loop:" // The inner for loop
		"cmpq %%rsi, %%rdi;"
		"jle inner_done2;"
		"movq (%%rax, %%rdx, 8), %%r10;" // Move list[%rdx] which is the same as list[x] in %r10
		"movq (%%rax, %%rsi, 8), %%r11;" // Move list[%rsi] which is the same as list[y] in %r11
		"cmpq $1, %%rbx;" // Compare %rbx with 1
		"jne descending;" // If %rbx does not equal to 1, then jump to descending
		
		"ascending:" // Sorts ascending
			"cmpq %%r11, %%r10;" // Compare %r10 with %r11
			"jg swap;" // If %r10 is greater than %r11 jump to swap
			"jmp inner_done1;" // Unconditionally jump to inner_done1 happens when
							   // %%r10 is less than or equal to %%r11
			
		"descending:" // Sorts descending
			"cmpq %%r11, %%r10;" // Compare %r10 with %r11
			"jl swap;" // If %r10 is less than %r11 jump to swap
			
		"inner_done1:" // Continues inner loop if swap doesn't happen
			"incq %%rsi;" // Increment %rsi, which is the inner loop counter
			"jmp inner_loop;" // Unconditional jump to inner_loop
		
		"swap:" // Swaps list[%rdx] with list[%rsi] which is the same as swapping list [x] with list [y]
			"xchgq %%r10, (%%rax, %%rsi, 8);" // Swap %r10 with list[y]
			"xchgq %%r11, (%%rax, %%rdx, 8);" // Swap %r11 with list[x]
			"incq %%rsi;" // Increment %rsi
			"jmp inner_loop;" // Unconditional jump to outer_loop
		
		"inner_done2:" // When inner loop is finished, exits inner loop and goes to outer loop
			"incq %%rdx;" // Increment %rdx, which is the outer loop counter
			"jmp outer_loop;" // Unconditional jump to outer_loop
			
"done:" // When everything is finished
 	 : 
	 : "r" (list), "r" (opcode), "r" (count)
	 : 
	 );
}

int main(int argc, char** argv)
{
	long numlist[1000], asc;
	FILE *fptr;

	long i = 0;
	
	if (argc != 3)
	{
		printf("Usage: %s filename asc_des\n", argv[0]);
		return 1;
	}

	asc = atol (argv[2]);
	asc = (asc == 1) ? 1 : 2;

	printf("\n");

	fptr = fopen((argv[1]), "rtc");
	if (fptr == NULL)
      printf( "File %s was not opened\n",argv[1] );
	else
   {
      /* Set pointer to beginning of file: */
      fseek( fptr, 0L, SEEK_SET );

      /* Read data from file: */
	  while ( fscanf(fptr, "%ld", &numlist[i]) != EOF )
	  {
          printf( "%ld ", numlist[i] );
		  i++;
	  }

      printf( "\n\nNumber of integer = %ld\n", i );
      printf( "Ascend_or_Descend = %ld\n\n", asc );
      fclose( fptr );
   }

   sorter(numlist, i, asc);

   for (int j = 0; j < i; j++)
          printf( "%ld ", numlist[j] );

   printf("\n");

   return 0;
}



	


