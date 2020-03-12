#include <stdio.h>
#include <stdlib.h>

/* Ejercicio 5: El programa lee desde la entrada estándar un mensaje, y lo
 * codifica caracter a caracter, mediante una clave que se le pasa como
 * argumento a la función. Para ejecutar debemos poner el nombre del ejecutable
 * seguido de un número que indica la clave, por ejemplo:
 * "~$ ./ej5.o 15 " */

void codificar_mensaje(int clave) {
  char c;
  int i;

  while ((i = getc(stdin)) != EOF) {
    c = i;
    c = c ^ clave;
    printf("%c", c);
  }
  printf("\n");
}

int main(int argc, char* argv[]) {
  if (argc == 2) {
    codificar_mensaje(atoi(argv[1]));
  } else {
    printf("Error: Cantidad de argumentos inválida.\n");
  }
  return 0;
}
