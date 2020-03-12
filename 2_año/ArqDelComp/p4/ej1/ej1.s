.text
.global div
div:
  mv t0, a0 # t0 = dividendo
  mv a0, zero # a0 = 0
  beqz a1, divporcero
  beqz t0, fin # Si el dividendo es 0 devuelvo 0, finalizo
  bltz t0, dividendoneg
dividendopos:
  bltz a1, masdivmenos
masdivmas:
  blt t0, a1, fin
  j mismosigno
masdivmenos:
  neg a1, a1
  blt t0, a1, fin
  j distintosigno
dividendoneg:
  bltz a1, menosdivmenos
menosdivmas:
  neg t0, t0
  blt t0, a1, fin
  j distintosigno
menosdivmenos:
  neg t0, t0
  neg a1, a1
  blt t0, a1, fin
  j mismosigno
mismosigno:
  sub t0, t0, a1
  bltz t0, fin
  addi a0, a0, 1
  bgez t0, mismosigno
distintosigno:
  sub t0, t0, a1
  bltz t0, fin
  addi a0, a0, -1
  bgez t0, distintosigno
divporcero:
  addi a0, zero, -1
fin:
  ret
