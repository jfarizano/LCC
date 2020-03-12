.global sum_sse
.text
sum_sse:
  movl %edx, %ecx
  cmpl $4, %ecx
  jb menor
mayorigual:
  movaps (%rdi), %xmm0
  movaps (%rsi), %xmm1
  addps %xmm1, %xmm0
  movaps %xmm0, (%rdi)
  addq $16, %rsi
  addq $16, %rdi
  subl $4, %ecx
  cmpl $4, %ecx
  jb menor
  jmp mayorigual
menor:
  cmpl $0, %ecx
  je fin
  movss (%rdi), %xmm0
  movss (%rsi), %xmm1
  addss %xmm1, %xmm0
  movss %xmm0, (%rdi)
  addq $4, %rdi
  addq $4, %rsi
  decl %ecx
  jmp menor
fin:
  ret

