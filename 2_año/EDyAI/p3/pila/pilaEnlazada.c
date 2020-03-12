#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct _PNodo {
  int dato;
  struct _PNodo *abajo;
} *PNodo;

typedef PNodo Pila; 

Pila pila_crear() {
  return NULL;
}

int pila_es_vacia(Pila pila) {
  return pila == NULL;
}

int pila_top(Pila pila) {
  assert(pila != NULL);
  return pila->dato;
}

Pila pila_push(Pila pila, int dato) {
  PNodo nuevoNodo = malloc(sizeof(PNodo));
  nuevoNodo->dato = dato;
  nuevoNodo->abajo = pila;

  return nuevoNodo;
}

Pila pila_pop(Pila pila) {
  Pila temp = pila->abajo;
  free(pila);
  return temp;
}

void pila_imprimir(Pila pila) {
  for (PNodo nodo; nodo != NULL; nodo = nodo->abajo) {
    printf("%d ", nodo->dato);
  }
  printf("\n");
}

void pila_destruir(Pila pila) {
  PNodo nodoAEliminar;
  while(pila != NULL) {
    nodoAEliminar = pila;
    pila = pila->abajo;
    free(nodoAEliminar);
  }
}

int main() {
  Pila pila = pila_crear();
  for (int i = 0; i <= 5000; i++) {
    pila = pila_push(pila, i);
  }
  pila_imprimir(pila);
  pila_destruir(pila);

}