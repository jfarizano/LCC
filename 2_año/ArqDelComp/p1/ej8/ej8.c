#include <stdio.h>
#include <gmp.h>
#include "../aux/nro.c"

int main() {
  nro n1, n2, resultado;

  for (int i = 0; i < 8; i++) {
    n1.N[i] = 37683;
  }

  for (int i = 8; i < 16; i++) {
    n1.N[i] = 0;
  }

  for (int i = 0; i < 8; i++) {
    n2.N[i] = 16930;
  }

  for (int i = 8; i < 16; i++) {
    n2.N[i] = 0;
  }

  resultado = mult_nro(n1, n2);

  printf("n1, ");
  print(n1);
  printf("n2, ");
  print(n2);
  printf("Resultado de multiplicar ambos, ");
  print(resultado);

  return 0;
}