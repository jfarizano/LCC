#include <stdio.h>

int div(int a, int b);

int main() {
  int a = 7, b = 2;

  printf("División entera: %d/%d = %d\n", a, b, div(a, b));

  a = 8, b = 2;
  printf("División entera: %d/%d = %d\n", a, b, div(a, b));

  a = 7, b = -2;
  printf("División entera: %d/%d = %d\n", a, b, div(a, b));

  a = -8, b = 2;
  printf("División entera: %d/%d = %d\n", a, b, div(a, b));

  a = -7, b = -2;
  printf("División entera: %d/%d = %d\n", a, b, div(a, b));

  b = 0;
  printf("División por cero: 0x%x\n", div(a,b));

  return 0;
}