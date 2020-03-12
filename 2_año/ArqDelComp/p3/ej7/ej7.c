#include <stdio.h>

void sum(float *a, float *b, int len);

int main()
{
  int n = 10;

  float a[n], b[n];

  for (int i = 0; i < n; i++)
  {
    a[i] = (float)i;
    b[i] = (float)(i + 3);
  }

  a[0] = 0.5;
  b[0] = 3.4;

  printf("Numeros originales\n");

  for (int i = 0; i < n; i++)
  {
    printf("%f\n", a[i]);
  }
  printf("==========================\n");
  for (int i = 0; i < n; i++)
  {
    printf("%f\n", b[i]);
  }

  sum(a, b, n);

  printf("Resultado\n");

  for (int i = 0; i < n; i++)
  {
    printf("%f\n", a[i]);
  }

  return 0;
}