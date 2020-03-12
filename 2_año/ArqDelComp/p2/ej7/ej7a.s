.global main

main:
    movq $0, %rax
    movq $0xFFFFFFFFEEEEEEEE, %rax # Numero a modo de ejemplo.
    rolq $32, %rax

    retq
