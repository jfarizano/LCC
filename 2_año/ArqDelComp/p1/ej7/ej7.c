#include <stdio.h>
#include <gmp.h>
#include "../aux/nro.c"

void apartado_a() {
  nro n;

  n.N[0] = 1;
  for (int i = 1; i < 16; i++) {
    n.N[i] = 0;
  }

  print(n);

  if (es_cero(n)) {
    printf("n es cero\n");
  } else {
    printf("n no es cero\n");
  }

  if (es_uno(n)) {
    printf("n es uno\n");
  } else {
    printf("n no es uno\n");
  }

  if (es_par(n)) {
    printf("n es par\n");
  } else {
    printf("n no es par\n");
  }

  n.N[0] -= 1;

  if (es_cero(n)) {
    printf("n-1 es cero\n");
  } else {
    printf("n-1 no es cero\n");
  }
  
  n.N[0] += 2;

  if (es_par(n)) {
    printf("n+1 es par\n");
  } else {
    printf("n+1 no es par\n");
  }

}

void apartado_b() {
  nro n1, n2;

  for (int i = 0; i < 16; i++) {
    n1.N[i] = 45875;
  }

  print(n1);
  printf("n en binario:\n");
  printbin_nro(n1);

  n2 = correr_der(n1, 8);
  printf("n desplazado 8 bits a la derecha en binario:\n");
  printbin_nro(n2);

  n2 = correr_izq(n1, 21);
  printf("n desplazado 21 bits a la izquierda en binario:\n");
  printbin_nro(n2);  
}

void apartado_c() {
  nro n1, n2, resultado;

  for (int i = 0; i < 16; i++) {
    n1.N[i] = 37683;
  }

  for (int i = 0; i < 16; i++) {
    n2.N[i] = 16930;
  }

  resultado = sumar_nro(n1, n2);

  printf("Primer ");
  print(n1);

  printf("Segundo ");
  print(n2);

  printf("Resultado de la suma entre ambos, ");
  print(resultado);
}

int main() {
  printf("Ingrese uno de estos números para testear diferentes apartados:");
  printf("1 - Funciones para comparar a 1 y 0 y determinar paridad\n");
  printf("2 - Desplazamiento de bits\n");
  printf("3 - Suma entre valores de tipo nro\n");
  printf("Ingrese cualquier otro valor para salir\n");

  int opcion;
  printf("Opción n°: ");
  scanf("%d", &opcion);
  printf("\n");

  if (opcion == 1) {
    apartado_a();
  } else if (opcion == 2) {
    apartado_b();
  } else if (opcion == 3) {
    apartado_c();
  }

  return 0;
}