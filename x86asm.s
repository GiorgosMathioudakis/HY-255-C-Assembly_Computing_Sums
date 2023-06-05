# -----------------------------------
# Program x86asm.s
# Compute and print the sum 0+...+N
# -----------------------------------

	.section .data	# declaring data section 
N:	.long 1000	    # define N as long with value 1000
S:	.long 0		    # define S as long with value 0
Msg:	.ascii "The sum from 0 to %d is %d\n\0"


	.section .text	# coding section
.globl main
main:	
	pushl %ebp	    # stores the stack frame of main on the stack and increases esp
	movl %esp, %ebp	# copies stack frame of %esp to %ebp 

 	# initialize
    movl N, %ebx	# %ebx <- N 

 	# compute sum
L1:
	addl %ebx, S	# S += #ebx
	decl %ebx       # %ebx-=1
	cmpl $0, %ebx   # compare 0 and %ebx value 
	jng  L2	    	# jump to L2 
    movl $L1, %eax	# copy label adress of L1 to %eax
    jmp *%eax   	# jump to adress pointed by eax

L2:
	# print result
	pushl S	    	# store S value to stack and increase esp
	pushl N	        # store N value to stack and increase esp
	pushl $Msg  	# store Msg string to stack and increase esp
	call printf 	# calls for printf
	popl %eax   	# print Msg and decrease esp
	popl %eax   	# print N and decrease esp
	popl %eax   	# print S and decrease esp

	# exit
	movl $0, %eax  	# store value 0 to %eax
    leave	    	# Exit
 	ret             # return to adress of stack pointer
	 
