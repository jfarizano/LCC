/* Ejercicio 2: dado un número n y un número b, la función devuelve 1 si el bit
 * b de n es 1, y 0 en caso contrario. */

int isOne(int n, int b) { 
    return (n >> b) & 1; 
}

/* Ejercicio 3: toma un entero de 64 bits y lo imprime en binario. */

void printbin(int n) {
  for (int i = 63; i >= 0; i--) {
    printf("%d", isOne(n, i));
  }
  printf("\n");
}