
pow:
  cmp $0, %rcx
  je .L_send_pow_result
  cmp $1, %rcx
  je .L_send_pow_result_if_one
  mov %rdi, %r8
.L_pow_loop:
    imul %r8, %rdi
    dec %rcx
    cmp $0, %rcx
    jne .L_pow_loop
.L_send_pow_result:
    mov %rcx, %rax
    ret
.L_send_pow_result_if_one:
    mov %rdi, %rax
    ret

atoi:
  call str_len
  mov %rdx, %rcx
  mov $10, %rdi
  call pow
  mov %rax, %rdi

  mov $0, %rdx
.L_atoi_loop:
    
