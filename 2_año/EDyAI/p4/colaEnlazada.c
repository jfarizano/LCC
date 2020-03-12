#include <stdio.h>
#include <stdlib.h>

typedef struct _CNodo {
  void* dato;
  struct _CNodo *ant;
  struct _CNodo *sig;
} CNodo;

typedef CNodo* Cola;

Cola cola_crear() {
  return NULL;
}

int cola_vacia(Cola lista) {
  return lista == NULL;
}

void* cola_primero(Cola lista) {
  return lista->ant->dato;
}

Cola cola_encolar(Cola lista, void* dato) {
  CNodo *nuevoNodo = malloc(sizeof(CNodo));
  nuevoNodo->dato = dato;

  if (cola_vacia(lista)) {
    nuevoNodo->sig = nuevoNodo;
    nuevoNodo->ant = nuevoNodo;
  } else {
    nuevoNodo->sig = lista;
    nuevoNodo->ant = lista->ant;
    nuevoNodo->ant->sig = nuevoNodo;
    lista->ant = nuevoNodo;
  }

  return nuevoNodo;
}

Cola cola_desencolar(Cola lista) {
  if (lista == lista->ant) {
    free(lista);
    return NULL;
  } else {
    CNodo *temp = lista->ant;
    lista->ant->ant->sig = lista;
    lista->ant = lista->ant->ant;
    free(temp);
    return lista;
  }
}

void cola_destruir(Cola lista) {
  CNodo *nodoAEliminar;
  CNodo *nodoInicial = lista;

  while (lista->sig != nodoInicial) {
    nodoAEliminar = lista;
    lista = lista->sig;
    free(nodoAEliminar);
  }

  free(lista);
}
