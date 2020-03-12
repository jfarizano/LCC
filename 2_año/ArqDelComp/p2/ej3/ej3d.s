    .global main
main:
    movl $0xAA, %eax
    shll $24, %eax
    movl $0xAA, %ecx
    or %ecx, %eax

    retq

