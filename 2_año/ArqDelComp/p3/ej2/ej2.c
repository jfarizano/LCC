#include <stdio.h>
#include <math.h>

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

int myisnanFloat(float n) {
  return exponenteFloat(n) == (1 << 8) - 1 && fraccionFloat(n) != 0;
}

int myisnan2(float n){
	return !(n == n);
}


int main() {
  float g = 0.0;
  float f = 0.0 / g;

  if (myisnan(f)) {
    printf("Es NAN\n");
  } else {
    printf("No es NAN\n");
  }

  return 0;
}


// Apartado c)
// +inf no es NAN, +inf tiene el mismo exponente que NAN pero la fracción
// es igual a 0 y tiene el bit de signo apagado.
// -inf es igual pero tiene el bit de signo prendido.

// Apartado d)
// Si sumo un valor a +inf sigue siendo +inf