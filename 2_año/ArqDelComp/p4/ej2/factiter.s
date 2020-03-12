.text
.global factiter

factiter:
  mv t0, a0
  mv a0, zero
  addi a0, a0, 1
  mv t1, a0
seguir:
  mul a0, a0, t0
  addi t0, t0, -1
  bgtu t0, t1, seguir
fin:
  ret
