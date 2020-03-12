#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "ej3.c"

void arreglo_enteros_ajustar(ArregloEnteros* arreglo, int capacidad){
  arreglo->capacidad = capacidad;
  arreglo->direccion = realloc(arreglo->direccion, (sizeof(int) * capacidad));
}

void arreglo_enteros_insertar(ArregloEnteros* arreglo, int pos, int dato){
  int capacidad = arreglo_enteros_capacidad(arreglo) + 1;
  arreglo_enteros_ajustar(arreglo, capacidad);

  for (int i = capacidad - 1; i >= pos; i--){
    arreglo->direccion[i] = arreglo->direccion[i - 1];
  }

  arreglo->direccion[pos] = dato;
}

void arreglo_enteros_eliminar(ArregloEnteros* arreglo, int pos){
  int capacidad = arreglo_enteros_capacidad(arreglo);
  for (int i = pos; i < capacidad; i++){
    arreglo->direccion[i] = arreglo->direccion[i+1];
  }
  arreglo_enteros_ajustar(arreglo, capacidad-1);
}

int main(){

  int a;
  scanf("%d", &a);
  ArregloEnteros *arreglo = arreglo_enteros_crear(a);
  for (int i = 0; i < a; i++){
    arreglo->direccion[i] = i;
  }

  arreglo_enteros_insertar(arreglo, 0, 99);
  arreglo_enteros_insertar(arreglo, 0, 99);
  arreglo_enteros_insertar(arreglo, 0, 99);

  arreglo_enteros_imprimir(arreglo);

  arreglo_enteros_eliminar(arreglo, 0);
  arreglo_enteros_imprimir(arreglo);

  return 0;



}
