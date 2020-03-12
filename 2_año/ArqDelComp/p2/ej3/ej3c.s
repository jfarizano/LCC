    .global main
main:
    movl $-1, %eax
    movl $0xFFFFFF00, %ecx
    and %eax, %ecx
    ret
    