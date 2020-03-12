#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int *direccion;
  int capacidad;
} ArregloEnteros;

ArregloEnteros* arreglo_enteros_crear(int capacidad){
  ArregloEnteros *arreglo = malloc(sizeof(ArregloEnteros));
  arreglo->direccion = malloc(sizeof(int) * capacidad);
  arreglo->capacidad = capacidad;
  return arreglo;
}

void arreglo_enteros_destruir(ArregloEnteros* arreglo){
  free(arreglo->direccion);
  free(arreglo);
}

int arreglo_enteros_leer(ArregloEnteros* arreglo, int pos){
  return arreglo->direccion[pos];
}

void arreglo_enteros_escribir(ArregloEnteros* arreglo, int pos, int dato){
  arreglo->direccion[pos] = dato;
}

int arreglo_enteros_capacidad(ArregloEnteros* arreglo){
  return arreglo->capacidad;
}

void arreglo_enteros_imprimir(ArregloEnteros* arreglo){
  int capacidad = arreglo_enteros_capacidad(arreglo);
  for (int i = 0; i < capacidad; i++){
    printf("%d ", arreglo->direccion[i]);
  }
  printf("\n");
}
