.text
.global rgb_to_gray1
.global rgb_to_gray2
.global ycbcr_to_gray

rgb_to_gray1:
  andi t0, a0, 255 # Primeros 8 bits de a0 en t0

  srl t1, a0, 8 # Siguientes 8 bits en t1
  andi t1, t1, 0xFF

  srl t2, a0, 16 # Los otros 8 en t2
  andi t2, t2, 0xFF

  mv t3, zero
  addi t3, t3, 3

  div t0, t0, t3
  div t1, t1, t3
  div t2, t2, t3

  mv a0, t0
  add a0, a0, t1
  add a0, a0, t2
  ret

rgb_to_gray2:
  andi t0, a0, 255 # Primeros 8 bits de a0 en t0

  srl t1, a0, 8 # Siguientes 8 bits en t1
  andi t1, t1, 0xFF

  srl t2, a0, 16 # Los otros 8 en t2
  andi t2, t2, 0xFF

  mv t3, zero
  addi t3, t3, 100

  mv t4, zero
  addi t4, t4, 11

  mul t2, t2, t4
  addi t4, t4, 19
  mul t0, t0, t4
  addi t4, t4, 29
  mul t1, t1, t4 

  div t0, t0, t3
  div t1, t1, t3
  div t2, t2, t3

  mv a0, t0
  add a0, a0, t1
  add a0, a0, t2
  ret

ycbcr_to_gray:
  andi a0, a0, 0xFF
  ret
