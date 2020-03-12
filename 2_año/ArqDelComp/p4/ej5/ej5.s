.data

a: .float 2.0
b: .float 1.0
c: .float 1.0
d: .float 2.0

str: .asciz "Determinante = %f\n"

.text

.global det

# a = fa0, b = fa1, c = fa2, d = fa3
# det = ad - bc
det:
  fmul.s fa1, fa1, fa2
  fmsub.s fa0, fa0, fa3, fa1
  ret

.global main

main:

# Guardamos los datos

la t0, a
la t1, b
la t2, c
la t3, d

flw fa0, (t0)
flw fa1, (t1)
flw fa2, (t2)
flw fa3, (t3)

# Guardamos la dirección de retorno.
addi sp, sp, -16
sd ra, (sp)

call det

# Restauramos la dirección de retorno.
ld ra, (sp)
addi sp, sp, 16

ret
