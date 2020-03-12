    .global main

main:
    movl $1, %eax
    shll $31, %eax
    movl $1, %ecx
    shll $15, %ecx
    or %ecx, %eax # El resultado queda en %eax
    ret
