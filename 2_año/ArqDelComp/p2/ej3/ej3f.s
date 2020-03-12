    .global main

main:
    movl $-1, %eax
    movl $1, %ecx
    shll $8, %ecx
    not %ecx
    and %ecx, %eax
    retq
    