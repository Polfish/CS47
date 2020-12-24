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

long search_by_name (char* list, long count, char* token)
{
	long index = 0;

	struct student *clist = (struct student*)list;

asm
(
	"movq %1, %%rax;" // Move list into %rax
	"movq %2, %%rbx;" // Move token into %rbx
	"movq %3, %%rcx;" // Move count into %rcx
	"xorq %%rdx, %%rdx;" // XOR %rdx with itself, which will act as a counter
	
"loop_begin:" // Loop to go through the list to find the matching name
	"movq %%rax, %%rsi;" // Move %rax into %rsi
	"addq $8, %%rsi;" // Add 8 to %rsi to get to the name because the first 8 bytes are the ID
	"cmpq %%rcx, %%rdx;" // Compare %rcx with %rdx
	"jge not_discovered;" // If %rdx is greater than or equal to %rcx, then jump to not_discovered
	"movq %%rbx, %%r9;" // Move %rbx into %r9
	
	"to_upper:" // Loop to do case insensitive compare of both the token and current element. Converts all characters to uppercase to do so.
		"movb (%%rsi), %%r8b;" // Move character stored at dereferenced %rsi into %r8b
		"movb (%%r9), %%r10b;" // Move character stored at dereferenced %r9 into %r10b
		"cmpb $0x61, %%r10b;" // Compare 0x61 ('a') with %r10b, which is the current character of the token string. Checks if %r10b is already uppercase.
		"jl inner_upper;" // If %r10b is less than 0x61 ('a'), then jump to inner_upper
		"subb $0x20, %%r10b;" // Subtract 0x20 from %r10b. This converts lowercase to uppercase.
		
		"inner_upper:" // Converts the current character of the current string in list to uppercase
			"testb %%r8b, %%r8b;" // Test %r8b with %r8b, essentially uses AND operation to compare
			"je test;" // If %r8b is equal to %r8b, then jump to test. This checks if %r8b is 0, which means the end of the string.
			"cmpb $0x61, %%r8b;" // Compare 0x61 ('a') with %r8b.
			"jl next;" // If %r8b is less than 0x61 ('a') then jump to next. Checks if %r8b is already lowercase
			"subb $0x20, %%r8b;" // Subtract 0x20 from %r8b. This converts lowercase to uppercase.
			"jmp next;" // Unconditional jump to next used to skip over test.
		
		"test:" // Test whether the next character of the token stored in %r10b is 0. Prevents against partial searching.
			"movb (%%r9), %%r10b;" // Move dereferenced %r9 into %r10b. Now %r10b should contain the next character of the token.
			"testb %%r10b, %%r10b;" // Test %r10b with %r10b, essentially uses AND operation to compare
			"je discovered;" // If %r10b is equal to %r10b, then jump to test. This checks if %r10b is 0, which means the end of the string.

"next:" // Used to jump to the next iteration of the loop or continue comparing
	"incq %%rsi;" // Increment %rsi to get to the next character of the current element in list
	"incq %%r9;" // Increment %r9 to get to the next character of the token
	"cmpb %%r8b, %%r10b;" // Compare %r8b with %r10b
	"je to_upper;" // If %r10b is equal to %r8b then jump to inner_upper, which means continue comparing characters
	"addq $32, %%rax;" // Add 32 to %rax which is the size of each structure (8 byte long + 24 byte char array)
	"incq %%rdx;" // Increment %rdx, which is the counter
	"jmp loop_begin;" // Unconditional jump to loop

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



	


