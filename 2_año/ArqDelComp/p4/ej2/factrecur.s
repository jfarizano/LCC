.text
.global factrecur

factrecur:
  mv t0, zero
  addi t0, t0, 1
  mv t1, t0 

  addi sp, sp, -16
  sd   ra, (sp)
  call fact
  ld   ra, (sp)
  addi sp, sp, 16
  jr ra
fact:
  bleu a0, t1, finrecur # Si a0 <= 1 salta a finrecur
  mul t0, t0, a0
  addi a0, a0, -1

  addi sp, sp, -16
  sd   ra, (sp)
  call fact
finrecur:
  mv a0, t0
  ld   ra, (sp)
  addi sp, sp, 16
  jr ra
fin:
  ret
  