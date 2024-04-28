.include "io.s"
.include "syscalls.s"
.text
.globl _start
_start:
    push    %rbp
    mov     %rsp, %rbp
    sub     $20, %rsp

    mov     $2, %rsi
    or      $5, %rsi

    mov     %rsi, %rdi
    call    print_number

    add     $20, %rsp
    pop     %rbp
    mov     $SYS_exit, %rax
    mov     $0, %rdi
    syscall