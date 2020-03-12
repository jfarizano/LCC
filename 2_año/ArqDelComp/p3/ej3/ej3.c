#include <stdio.h>
#include <math.h>

/*
N = 6.02252 * 10^23

Aplicamos logaritmo para ponerlo en base 2

log_2(N) = 76.4043461824
N = 6.02252 * 2^76.4043461824
N = 6.02252 * 2^0.4043461824 * 2^76
N = 7.97073885229 * 2^76

Convierto la parte entera a binario:

(7)_10 = (111)_2

Convierto la parte fraccional a binario:


0.97073885229 * 2 = 1.94147770458
0.94147770458 * 2 = 1.88295540916
0.88295540916 * 2 = 1.76591081832
0.76591081832 * 2 = 1.53182163664
0.53182163664 * 2 = 1.06364327328
0.06364327328 * 2 = 0.12728654656
0.12728654656 * 2 = 0.25457309312
0.25457309312 * 2 = 0.50914618624
0.50914618624 * 2 = 1.01829237248
0.01829237248 * 2 = 0.03658474496
0.03658474496 * 2 = 0.07316948992
0.07316948992 * 2 = 0.14633897984
0.14633897984 * 2 = 0.29267795968
0.29267795968 * 2 = 0.58535591936
0.58535591936 * 2 = 1.17071183872
0.17071183872 * 2 = 0.34142367744
0.34142367744 * 2 = 0.68284735488
0.68284735488 * 2 = 1.36569470976
0.36569470976 * 2 = 0.73138941952
0.73138941952 * 2 = 1.46277883904
0.46277883904 * 2 = 0.92555767808
0.92555767808 * 2 = 1.85111535616
0.85111535616 * 2 = 1.70223071232

Entonces: (0.97073885229)_10 = (0.11111000100000100101011)_2

Por lo que, (N)_10 = (111.11111000100000100101011)_2 * 2^76

Normalizando obtenemos:

(N)_10 = (1.1111111000100000100101011)_2 * 2^78

Sesgado del exponente:

E = 78 + 127 = 205
(E)_10 = (11001101)_2

Finalmente nos queda:

(N)_10 = (0|11001101|11111110001000001001011)_IEEE754
*/

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

long long int fraccionDouble(double n) {
  long long int mascara = (1 << 52) - 1;
  double* puntero1 = &n;
  long long int* puntero2 = (long long int*)puntero1;
  long long int fraccion = *puntero2 & mascara;
  return fraccion;
}

long long int exponenteDouble(double n) {
  long long int mascara = (1 << 11) - 1;
  double* puntero1 = &n;
  long long int* puntero2 = (long long int*)puntero1;
  long long int exponente = (*puntero2 >> 52) & mascara;
  return exponente;
}

int main() {
  float AvoFloat = 6.02252 * pow(10, 23);
  double AvoDouble = 6.02252 * pow(10, 23);


  printf("Constante de Avogrado\n");
  printf("Exponente en float = %d, fraccion en float = %d\n", exponenteFloat(AvoFloat), fraccionFloat(AvoFloat));
  printf("Exponente en double = %lld\n, fraccion en double = %lld\n", exponenteDouble(AvoDouble), fraccionDouble(AvoDouble));

  return 0;
}