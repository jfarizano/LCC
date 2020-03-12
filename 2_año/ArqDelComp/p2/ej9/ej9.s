# IMPORTANTE: compilar como: 'gcc -no-pie ej9.s -g'

.data

fmt: .string "%d"
entero: .long -100
funcs: .quad f1
       .quad f2
       .quad f3

.text

f1: movl $0, %esi
    movq $fmt, %rdi
    call printf
    jmp fin

f2: movl $1, %esi
    movq $fmt, %rdi
    call printf
    jmp fin

f3: movl $2, %esi
    movq $fmt, %rdi
    call printf
    jmp fin

.global main

main: 
    pushq %rbp
    movq %rsp, %rbp

    # Leemos el entero.
    movq $entero, %rsi
    movq $fmt, %rdi
    xorq %rax, %rax
    call scanf

    xorq %rax, %rax

    # Completar con dos instrucciones:

    imull $19, entero, %edx # 'entero' es un long, lo guardamos en el registro de 4 bytes.
                            # multiplicamos por 19, que es la distacia entre las direcciones
                            # f1, f2 y f3.
    addq $f1, %rdx  # a la direccion de f1, le sumamos nuestro desplazamiento
                    # y así hacemos un salto a la función que queremos ejecutar.
    jmp *%rdx

fin:
    movq %rbp, %rsp
    popq %rbp
    ret
