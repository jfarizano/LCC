#include <stdio.h>

/* Ejercicio 4: la función toma 3 valores a, b y c y rota sus valores, es decir,
 * el valor de a queda en b, el de b en c y el de c en a. */

void rotar_valores(int* a, int* b, int* c) {
  *a = *a ^ *b;
  *b = *a ^ *b;
  *a = *a ^ *b;

  *a = *a ^ *c;
  *c = *a ^ *c;
  *a = *a ^ *c;
}

int main() {
  int a = 1, b = 2, c = 3;
  printf("Valores originales: %d, %d, %d\n", a, b, c);
  rotar_valores(&a, &b, &c);
  printf("Valores rotados: %d, %d, %d\n", a, b, c);

  a = 123;
  b = 2103;
  c = 1234124;

  printf("Valores originales: %d, %d, %d\n", a, b, c);
  rotar_valores(&a, &b, &c);
  printf("Valores rotados: %d, %d, %d\n", a, b, c);

  return 0;
}