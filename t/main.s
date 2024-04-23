.include "syscalls.s"
.data
listen_msg: .asciz "Server listen.\n"

.text 
.globl _start
exit:
    mov $SYS_exit, %rax
    mov $0, %rdi
    syscall

sock:
    mov $SYS_socket, %rax
    mov $2, %rdi 
    mov $1, %rsi
    mov $0,%rdx
    syscall
    ret

str_len:
    mov %rcx, %r13
	xor %rcx, %rcx
    str_len_loop:
    cmpb $0, (%rsi, %rcx)
    je str_len_end
    inc %rcx
    jmp str_len_loop
    str_len_end:
    mov %rcx, %rdx
    mov %r13, %rcx
    xor %r13, %r13
    ret

print:
    mov $SYS_write, %rax
	mov $1, %rdi
    # call str_len
    syscall
    ret
print_number:# (2 ^ 32) - 1
#               4294967295
    
    push %rbp
    mov %rsp, %rbp

    mov %rdi, %rax
    xor %edx, %edx
    mov $10,%ebx
    div %ebx # remain go to edx
    mov %rdx, %rax
    addb $48 ,%al
    movb %al, -4(%rbp)
    movb $10, -5(%rbp)

    sub $30, %rsp
    mov %al, 20(%rsp)
    lea 20(%rsp), %rsi
    mov $2, %rdx
    call print

    pop %rbp
    jmp exit
    

    
# bind:
#     mov $SYS_bind, %rax
_start:

    # call sock

    # mov %eax, %edi

    mov $133, %rdi
    call print_number
    jmp exit
