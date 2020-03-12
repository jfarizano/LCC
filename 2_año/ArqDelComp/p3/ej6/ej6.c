#include <stdio.h>

int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);

int main()
{
  float x, y;

  if (solve(1, 1, 1, 1, 1, 2, &x, &y) == 0)
  {
    printf("%f %f\n", x, y);
  }
  else
  {
    printf("Sistema sin solución única\n");
  }
  return 0;
}