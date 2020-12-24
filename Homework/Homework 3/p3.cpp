//* CS47 - Project #3 by Paul Chon */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct student
{
  long	ID;          /* 8 bytes in 64-bit, and 4 bypes in 32-bit */
  char	name[24];
};

/* This function returns the char* to the name string if the input sid has a match on the student ID
   from the array of student structures */

long search_by_id (char* list, long count, long sid)
{
	long index=0;
asm
(
	"movq %1, %%rax;"           
	"movq %2, %%rbx;" 	
	"movq %3, %%rcx;"
	"xorq %%rdx, %%rdx;"
"loop_start:"
	"cmpq %%rdx, %%rcx;"
	"je not_found;"
	"movq (%%rax), %%rsi;"
	"cmpq %%rsi, %%rbx;"
	"je found;"
	"addq $32, %%rax;"   /* 32 = size of each record for 64-bit; In 32-bit, it is 28 */ 
	"inc %%rdx;"	
    "jmp loop_start;"
"not_found:"
	"xorq %%rax, %%rax;"
	"jmp done;"
"found:"
	"addq $8, %%rax;"
"done:"
 	 : "=a" (index)
	 : "r" (list), "r" (sid), "r" (count)
	 : 
	 );
	 return index;
}

/* 
Returns the ID of the element in the list that matches token using an iterative implementation 
of binary search.
*/
long search_by_name (char* list, long count, char* token)
{
	long index = 0;

	struct student *clist = (struct student*)list;

asm
(
	"movq %1, %%rax;" // Move list into %rax
	"movq %%rax, %%r12;" // Move %rax into %r12, which will save the very beginning of the list
	"movq %2, %%rbx;" // Move token into %rbx
	"movq %3, %%rcx;" // Move count into %rcx, which will act as the high index
	"xorq %%rdx, %%rdx;" // XOR %rdx with itself, which will act as a counter
	"xorq %%rdi, %%rdi;" // XOR %rdi with itself, which will act as the midpoint address
	"movq %%rcx, %%rdi;" // Move %rcx to %rdi
	"xorq %%r11, %%r11;" // XOR %r11 with itself, which will act as the low index
	
"begin_loop:" // Loop to go through the list to find the matching name
	"cmpq %%rcx, %%r11;" // Compare %rcx with %r11
	"jg not_discovered;" // If %r11 is greater than %rcx, jump to not_discovered. Basically when low > high
	"addq %%r11, %%rdi;" // Add %r11 to %rdi
	"shr $1, %%rdi;" // Shift %rdi right by 1, which divides %rdi by 2. Now %rdi holds the midpoint again
	"shl $5, %%rdi;" // Shift %rdi left by 5, which multiplies %rdi by 32. Now %rdi holds the correct offset to get the element at list[mid]
	"movq %%r12, %%rsi;" // Move %r12 into %rsi, which makes %rsi holds the address starting at the beginning of the list
	"addq %%rdi, %%rsi;" // Add %rdi to %rsi. Now %rsi has the element at list[mid]
	"movq %%rsi, %%rax;" // Move %rsi into %rax. Now %rax also has the element at list[mid], which is needed because %rsi get used later on for comparing
	"shr $5, %%rdi;" // Shift %rdi right by 5, which divides %rdi by 32. Now %rdi holds the midpoint index again
	"addq $8, %%rsi;" // Add 8 to %rsi to get to the name because the first 8 bytes are the ID
	"movq %%rbx, %%r9;" // Move %rbx into %r9
	
	"to_upper:" // Loop to do case insensitive compare of both the token and current element. Converts all characters to uppercase to do so.
		"movb (%%rsi), %%r8b;" // Move character stored at dereferenced %rsi into %r8b
		"movb (%%r9), %%r10b;" // Move character stored at dereferenced %r9 into %r10b
		"cmpb $0x61, %%r10b;" // Compare 0x61 ('a') with %r10b, which is the current character of the token string. Checks if %r10b is already uppercase.
		"jl inner_upper;" // If %r10b is less than 0x61 ('a'), then jump to inner_upper
		"subb $0x20, %%r10b;" // Subtract 0x20 from %r10b. This converts lowercase to uppercase.
		
		"inner_upper:" // Converts the current character of the current name in list to uppercase
			"testb %%r8b, %%r8b;" // Test %r8b with %r8b, essentially uses AND operation to compare
			"je test;" // If %r8b is equal to %r8b, then jump to test. This checks if %r8b is 0, which means the end of the name.
			"cmpb $0x61, %%r8b;" // Compare 0x61 ('a') with %r8b
			"jl next;" // If %r8b is less than 0x61 ('a') then jump to next. Checks if %r8b is already lowercase
			"subb $0x20, %%r8b;" // Subtract 0x20 from %r8b. This converts lowercase to uppercase.
			"jmp next;" // Unconditional jump to next used to skip over test.
		
		"test:" // Test whether the next character of the token stored in %r10b is 0. Prevents against partial searching.
			"movb (%%r9), %%r10b;" // Move dereferenced %r9 into %r10b. Now %r10b should contain the next character of the token.
			"testb %%r10b, %%r10b;" // Test %r10b with %r10b, essentially uses AND operation to compare
			"je discovered;" // If %r10b is equal to %r10b, then jump to test. This checks if %r10b is 0, which means the end of the name.

"next:" // Used to jump to the next iteration of the loop or continue comparing
	"incq %%rsi;" // Increment %rsi. Goes to next character of current name in list
	"incq %%r9;" // Increment %r9. Goes to next character in token
	"cmpb %%r8b, %%r10b;" // Compare %r8b with %r10b
	"je to_upper;" // If %r10b is equal to %r8b then jump to inner_upper, which means continue comparing characters
	"jl less_than;" // If %r10b is less than %r8b jump to less_than, basically if list[mid] > token
	"jmp greater_than;" // Unconditional jump to greater_than, if list[mid] < token
	"addq $32, %%rax;" // Add 32 to %rax which is the size of each structure (8 byte long + 24 byte char array)
	"incq %%rdx;" // Increment %rdx, which is the counter
	
"less_than:" // If list[mid] > token, function will jump here
	"decq %%rdi;" // Decrement %rdi
	"movq %%rdi, %%rcx;" // Move %rdi to %rcx. Now %rcx, which is the high index, holds mid - 1
	"jmp begin_loop;" // Unconditional jump to begin_loop
	
"greater_than:" // If list[mid] < token, function will jump here
	"incq %%rdi;" // Increment %rdi
	"movq %%rdi, %%r11;" // Move %rdi to %r11. Now, %r11, which is the low index, holds mid + 1
	"jmp begin_loop;" // Unconditional jump to begin_loop

"not_discovered:" // When token does not match any names in list
	"xorq %%rax, %%rax;" // XOR %rax to return 0
	"jmp end;" // Unconditional jump to end

"discovered:" // When token matches one of the names in list
	"movq (%%rax), %%rax;" // Move dereferenced %rax into %rax. This moves the current ID value into %rax

"end:" // End of asm function
 	: "=a" (index)
	: "r" (list), "r" (token), "r" (count)
	: 
	);
	return index; // Changed this to index because otherwise the whole function breaks
}

int main(int argc, char** argv)
{
	char *token;
	char *sname=NULL;
	FILE *fptr;
	long id = 0;
	long sid = 0;
	long i = 0;
	struct student list[100];	/* array of structure */
	
	if (argc != 4)
	{
		printf("Usage: %s filename token student_id\n", argv[0]);
		return 1;
	}

	token = argv[2];

	sid = atol(argv[3]);

	printf("\n");

	fptr = fopen((argv[1]), "rtc");
	if (fptr == NULL)
      printf( "File %s was not opened\n",argv[1] );
	else
   {
      /* Set pointer to beginning of file: */
      fseek( fptr, 0L, SEEK_SET );

      /* Read data from file: */
	  while ( fscanf(fptr, "%s", (char*) &list[i].name) != EOF )
	  {
	  list[i].ID = i+1001;
          printf( "%s ", list[i].name );
		  i++;
	  }

      printf( "\n\nNumber of names = %ld\n", i );
      printf( "Search Token = %s\n", token );
      fclose( fptr );
   }

	printf( "\nStudent Id = %ld; Name = %s.\n\n", sid, (char*)search_by_id((char*)list, i, sid));

   id = search_by_name ((char*)list, i, token);
   
   if (id)
	   printf( "Student Id = %ld; Name = %s.\n", id, list[id-(1001)].name );
   else
     printf( "Student is not found.\n");

   return 0;
}



	


