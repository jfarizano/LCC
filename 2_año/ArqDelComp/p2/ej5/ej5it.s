# Versión iterativa de la función factorial.

.global fact1


fact1:
    movq %rdi, %rcx
    movq $1, %rax
    jmp fact

fact:
    mulq %rcx # Multiplico %rcx con %rax, aprovechando que rcx se decrementa solo por la instrucción loop.
    loop fact

    ret
