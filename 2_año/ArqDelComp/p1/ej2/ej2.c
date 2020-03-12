#include <stdio.h>
#include "../aux/bin.c"

int main() {
  int n1 = 12341, n2 = 0xF3B, n3 = 1 << 2;

  printf("%d %d %d %d\n", isOne(n1, 5), isOne(n2, 2), isOne(n3, 2), isOne(n3, 1));

  return 0;
}