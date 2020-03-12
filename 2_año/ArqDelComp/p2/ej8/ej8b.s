# IMPORTANTE: compilar como: gcc -no-pie ej8.c ej8a.s ej8b.s -g

# Compara dos string: si s1 es mayor que s2 devuelve 1, si es menor devuelve -1
# y si son iguales devuelve 0.

.global comparar

# Ambas cadenas están en rdi y rsi por convención.

comparar:
  cld # Vamos incrementando ambos registros.
  movq %rdx, %rcx # La cantidad de iteraciones es la longitud dada.

compararcad:
  cmpsb 
  jnz dif # s1 != s2
  loop compararcad
  # Son iguales
  jmp fin
  ret

  dif: # Son distintas, revisamos cual es mayor y cual es menor.
    decq %rdi 
    decq %rsi
    cmpsb
    ja lower
    movq $1, %rax
    ret

    lower:
      movq $-1, %rax # s2 es menor
      ret

  fin:
    movq $0, %rax # s1 es igual s2
    ret
