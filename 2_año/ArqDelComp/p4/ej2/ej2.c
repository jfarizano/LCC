#include <stdio.h>

int factiter(int x);
int factrecur(int x);

int main() {
  int a;
  printf("Ingrese un número: ");
  scanf("%d", &a);
  printf("\n");

  printf("Forma iterativa: %d! = %d\n", a, factiter(a));
  printf("Forma recursiva: %d! = %d\n", a, factrecur(a));

  return 0;
}