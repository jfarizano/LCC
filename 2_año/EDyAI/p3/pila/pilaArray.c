#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct _Pila {
  int *datos;
  int ultimo;
  int size;
} *Pila;

Pila pila_crear() {
  Pila pila = malloc(sizeof(Pila));
  pila->size = 100;
  pila->datos = malloc(sizeof(int) * pila->size);
  pila->ultimo = -1;
}

int pila_es_vacia(Pila pila) {
  return pila->ultimo == -1;
}

int pila_top(Pila pila) {
  return pila->datos[pila->ultimo];
}

void pila_push(Pila pila, int dato) {
  if (pila->ultimo >= pila->size){
    pila->size *= 2;
    pila->datos = realloc(pila->datos, sizeof(int) * pila->size);
  }

  pila->ultimo++;
  pila->datos[pila->ultimo] = dato;
}

void pila_pop(Pila pila) {
  pila->ultimo--;
}

void pila_imprimir(Pila pila) {
  for (int i = 0; i <= pila->ultimo; i++) {
    printf("%d ", pila->datos[pila->ultimo-i]);
  }
  printf("\n");
}

void pila_destruir(Pila pila) {
  free(pila->datos);
  free(pila);
}

int main() {
  Pila pila = pila_crear();

  for (int i = 0; i <= 5000; i++) {
    pila_push(pila, i);
  }
  
  pila_imprimir(pila);
  pila_destruir(pila);
}