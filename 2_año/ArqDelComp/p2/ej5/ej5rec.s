# Versión recursiva de la función factorial.

.global fact2

fact2:
    movq $1, %rax # Valor de retorno.
    jmp fact

fact:
    cmpq $1, %rdi # Comparo rdi con 1
    jbe terminar # Si es menor o  igual termino
    mulq %rdi # Multiplico rax por rdi
    decq %rdi # Decremento rdi en uno (x = x - 1)
    call fact # Llamada recursiva == fact(x-1)
terminar:
    ret
