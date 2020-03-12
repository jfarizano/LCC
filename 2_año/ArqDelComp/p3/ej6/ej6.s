.global solve
.text
# %xmm0 = a
# %xmm1 = b
# %xmm2 = c
# %xmm3 = d
# %xmm4 = e
# %xmm5 = f
# (%rdi) = x 
# (%rsi) = y

solve:
  # Calculo determinante matriz 2x2 del sistema
  movss %xmm0, %xmm6
  mulss %xmm4, %xmm6
  movss %xmm1, %xmm7
  mulss %xmm3, %xmm7
  subss %xmm7, %xmm6 # El determinante me queda en xmm6

  # Si det = 0, el sistema no tiene solucion unica
  xorq %rax, %rax
  cvtsi2ss %rax, %xmm7
  ucomiss %xmm7, %xmm6
  je irresoluble

  # Calculo x e y mediante el método de Cramer
  # Calculo x
  movss %xmm2, %xmm7
  mulss %xmm4, %xmm7
  movss %xmm1, %xmm8
  mulss %xmm5, %xmm8
  subss %xmm8, %xmm7
  divss %xmm6, %xmm7
  movss %xmm7, (%rdi)

  # Calculo y
  movss %xmm0, %xmm7
  mulss %xmm5, %xmm7
  movss %xmm2, %xmm8
  mulss %xmm3, %xmm8
  subss %xmm8, %xmm7
  divss %xmm6, %xmm7
  movss %xmm7, (%rsi)

  jmp fin
irresoluble:
  movq $-1, %rax
fin:
  ret
