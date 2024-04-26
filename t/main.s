.include "io.s"
.include "syscalls.s"
.data
    .equ        AF_INET, 2
    .equ        PORT, 3002

    bind_msg: .asciz "Socket bound.\n"
    listen_msg: .asciz "Server listen.\n"
    dbg: .asciz "Debug msg! "
    address:
        .short PORT
        .short AF_INET
        .int 0
        .fill 0,8,0

.text 
.globl      _start
exit:
    mov     $SYS_exit, %rax
    mov     $0, %rdi
    syscall

sock:
    mov     $SYS_socket, %rax
    mov     $AF_INET, %rdi # AF_INET
    mov     $1, %rsi
    mov     $0, %rdx
    syscall
    ret

bind:
# C Struct representation
#
#sizeof(sockaddr_in) = 16 
#   sa_family_t 2
#   in_port_t   2
#   in_addr     4 
#   void_bytes  8

    push     %rbp
    mov      %rsp, %rbp
    sub      $8, %rsp

    mov      $SYS_bind,   %rax
    movw     $AF_INET,   (%rsp)
    movw     $PORT, 2(%rsp)
    movl     $0, 4(%rsp)
    lea      (address), %rsi
    mov      $16, %rdx
    syscall
    add      $8, %rsp
    pop      %rbp
    ret

listen:
    mov     $SYS_listen, %rax
    mov     $2, %rsi
    syscall
    ret

close_fd:
    mov     $SYS_close, %rax
    syscall
    ret

_start:
    
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x20, %rsp

    call    sock # return value/eax/fd of socket
    movq    %rax, (%rbp) # saving FD of socket
    mov     %rax, %rdi
    call    print_number
    mov     (%rbp), %rdi # using FD of socket
    call    bind

    mov     %rax, %rdi
    call    print_number
    
    mov $bind_msg, %rsi
    call print_ln

    mov $listen_msg, %rsi
    call print_ln

    mov     (%rbp), %rdi # using FD of socket
    call    listen
    mov     %rax, %rdi
    call    print_number

    mov     (%rbp), %rdi # using FD of socket
    call    close_fd

    add     $0x20, %rsp
    pop     %rbp
    jmp     exit
