.global main

main:
    movq $0, %rax
    movq $0x20, %rax
    rolq $4, %rax

    retq
