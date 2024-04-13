.cdecls C "/usr/include/sys/socket.h"
.data

str: .asciz "paaaa\n"
.text 
.global _start
_start:
    mov $1, %rax
    mov $1, %rdi
    mov $str,  %rsi
    mov $6, %rdx
    syscall

    mov $60, %rax
    mov $0, %rdi
    syscall
