	.data
#################################################
#problem 1
#################################################

.comm str_1,101,32 #first string
.comm str_2,101,32 #second string
len_1:	#len means length
.space 4
len_2:
.space 4
value:
.space 4
scanf_block:
.string "%s"
printf_block:
.string "%d\n"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp #prolog
#################################################
pushl $str_1
pushl $scanf_block
call scanf
pushl $str_2
pushl $scanf_block
call scanf
addl $16, %esp
movl $-1, value
#################################################
movl $str_1, %esi
movl $0, %ecx
label_1: #we want to know length(str_1)
lodsb
cmp $0, %al
je break_1
addl $1, %ecx
jmp label_1
break_1:
movl %ecx, len_1
#################################################
        movl $str_2, %esi
        movl $0, %ecx
label_2: #the same thing about length(str_2)
        lodsb
        cmp $0, %al
        je break_2
        addl $1, %ecx
        jmp label_2
break_2:
        movl %ecx, len_2
#################################################
movl len_2, %ecx
movl len_1, %eax
subl %eax, %ecx
cmp $0, %ecx #if len_2<len_1
jl finish #there is no str_1 in str_2
addl $1, %ecx #cos first symbol for us if "first" - not "zero"
#################################################
loop_label:	
subl $1, %ecx #in needs to the cycle"
pushl %ecx
movl $str_2, %esi
movl $str_1, %edi
addl %ecx, %esi
movl len_1, %ecx
loop_in:
pushl %ecx #save len_1 str_1 for cycle
cmpsb #compare all str_1 with chars from str_2
popl %ecx
jne break_in #not that one!
loop loop_in
popl %ecx
movl %ecx, value #number of char, which we need - 1
pushl value
break_in:
popl %ecx
addl $1, %ecx #back %ecx - value
loop loop_label
#################################################
finish:
addl $1, value #the number=value+1
pushl value
pushl $printf_block
call printf #print
addl $8, %esp
#################################################
        movl %ebp, %esp #epilog
        popl %ebp
        movl $0, %eax
        ret
