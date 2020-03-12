#include <stdio.h>

void foo(int* a){
  a = NULL;
}

int main (){
  int a[67];
  a[0] = 123;
  printf (" %d\n", a[0]);
  foo(a);
  printf (" %d\n", a[0]);
}
