# -----------------------------------
# Program x86asm.s
# Compute and print the sum 0+...+N
# -----------------------------------

	.section .data	# declare section
N:	.long 1000	    # int n = 1000
S:	.long 0		    # int S = 1000
Msg:	.ascii "The sum from 0 to %d is %d\n\0"


	.section .text	# coding section
.globl main
main:	
	pushl %ebp	    # copies stack of main to stack and increases esp
	movl %esp, %ebp	# moves pointer of %esp to %ebp and increases esp

 	# initialize
    movl N, %ebx	# %ebx = N 

 	# compute sum
L1:
	addl %ebx, S	# S += %ebx
	decl %ebx       # %ebx -=1
	cmpl $0, %ebx   # compare &ebx with value 0 / %ebx-0 
	jng  L2	    	# jump to L2 if %ebx <=0
    movl $L1, %eax	# moves adress of L1 to %eax
    jmp *%eax   	# jump to adress pointed by eax

L2:
	# print result
	pushl S	    	# copies S value to stack and increase esp
	pushl N	        # copies N value to stack and increase esp
	pushl $Msg  	# copies Msg value to stack and increase esp
	call printf 	# calls for printf
	popl %eax   	# Take S off stack and decrease esp
	popl %eax   	# Take N off stack and decrease esp
	popl %eax   	# Take Msg off stack and decrease esp

	# exit
	movl $0, %eax  	# %eax = 0
    leave	    	# call for exit
 	ret             # jump to address on sp