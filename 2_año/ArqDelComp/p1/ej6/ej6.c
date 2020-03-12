#include <stdio.h>
#include "../aux/bin.c"

/* Ejercicio 6 : Algoritmo del Campesino Ruso.*/

unsigned mult(unsigned a, unsigned b) {
  if (b == 0) {  // Si b es 0, retornamos 0.
    return 0;
  } else if (b == 1) {  // Si b es 1, retornamos a.
    return a;
  } else if (!(isOne(b, 0))) {  // Si el primer bit es 0, b es par.
    return mult(a << 1, b >> 1);
  } else {  // b es impar.
    return a + mult(a << 1, b >> 1);
  }
}

int main() {
  unsigned n1 = 200, n2 = 53151;

  printf("%u x %u = %u\n", n1, n2, mult(n1, n2));

  n1 = 0xEF, n2 = 5;
  printf("%u x %u = %u\n", n1, n2, mult(n1, n2));

  n1 = 0x101010, n2 = 42; 
  printf("%u x %u = %u\n", n1, n2, mult(n1, n2));

  return 0;
}