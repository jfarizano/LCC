#include <stdio.h>

int fraccionFloat(float n) {
  int mascara = (1 << 23) -1;
  float* puntero1 = &n;
  int* puntero2 = (int*)puntero1;
  int fraccion = *puntero2 & mascara;
  return fraccion;
}

int exponenteFloat(float n) {
  int mascara = (1 << 8) - 1;
  float* puntero1 = &n;
  int* puntero2 = (int*)puntero1;
  int exponente = (*puntero2 >> 23) & mascara;
  return exponente;
}

int main() {
  float test = 0.123456789;
  printf("fraccion = %d\n", fraccionFloat(test));
  printf("exponente = %d\n", exponenteFloat(test));
  return 0;
}