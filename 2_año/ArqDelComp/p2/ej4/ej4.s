# Ejercicio 4:

.global main

main:
    movl $-1, %eax
    movl $2, %ecx
    imull %ecx

    shlq $32, %rdx
    orq %rdx,%rax # Resultado como signed.

    xorq %rax, %rax
    movw $-1, %ax
    movw $2, %cx
    mulw %cx
    
    andq $0xffffffffffffffff, %rax # Resultado como unsigned.
    
    ret