.include "io.s"
.include "syscalls.s"
.data
    .equ        SEEK_END,        2
    .equ        AF_INET,         2
    .equ        PORT,            16
    .equ        SOL_SOCKET,      1
    .equ        SO_REUSEADDR,    2
    .equ        SO_REUSEPORT,    15

    bind_msg: .asciz "Socket bound.\n"
    listen_msg: .asciz "Server listen.\n"
    dbg: .asciz "Debug msg! "
    err_msg: .asciz "ERROR"
    address:
        .short AF_INET
        .short PORT
        .int 0
        .fill 0,8,0
.text
.globl _start

exit:
    mov   $SYS_exit, %rax
    mov   $0, %rdi
    syscall

_start:
    movw $3002, %di
    rorw $8, %di
    call print_number
    jmp exit