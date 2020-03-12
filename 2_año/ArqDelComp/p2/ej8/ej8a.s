# IMPORTANTE: compilar como: gcc -no-pie ej8.c ej8a.s ej8b.s -g

# Buscar un caracter dentro de una cadena apuntada por rdi.


.global findc

findc:
    movq %rdx, %rcx # La longitud de la cadena viene en el 3er argumento.
    cld # Iremos incrementando rdi (DF = 0)
    movb %sil, %al # El caracter que queremos buscar está en rsi, 
                   # lo pasamos a rax para poder usar scasl 

encontrar:
    sigue:
        scasb # Comparamos lo apuntado en rdi con rax
        je found # Si la ZF se activó lo encontramos.
        loop sigue # Caso contrario seguimos iterando.
        xorq %rax, %rax # No lo encontramos, retornamos 0.
        jmp fin
    found:
        xorq %rax, %rax
        incq %rax # Lo encontramos, retornamos 1
    fin:
        ret
