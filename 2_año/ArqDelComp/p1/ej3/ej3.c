#include <stdio.h>
#include "../aux/bin.c"

int main() {
  int n1 = 0, n2 = 0;

  for (int i = 1; i < 63; i += 2) {
    n1 = n1 | ((int)1 << i);
  }

  for (int i = 3; i < 63; i += 4) {
    n2 = n2 | ((int)1 << i);
  }

  printbin(n1);
  printf("============================================\n");
  printbin(n2);

  return 0;
}