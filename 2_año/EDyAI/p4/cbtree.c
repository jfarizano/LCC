#include "cbtree.h"
#include "colaEnlazada.c"
#include <stdlib.h>
#include <math.h>

CBTree cbtree_crear(int niveles) {
  CBTree arbol = malloc(sizeof(CBNodo));
  arbol->datos = malloc(sizeof(int) * pow(2, niveles));
  
  return arbol;
}

void cbtree_destruir(CBTree arbol) {
  free(arbol->datos);
  free(arbol);
}

void cbtree_insertar(CBTree arbol, int dato) {
  arbol->datos[arbol->cantElementos] = dato;
  arbol->cantElementos++;
}

int cbtree_nelementos(CBTree arbol) {
  return arbol->cantElementos;
}

void cbtree_recorrer(CBTree arbol, BTreeOrdenDeRecorrido orden,
                    FuncionVisitante visit) {
  switch (orden) {
    case BTREE_RECORRIDO_IN:
    cbtree_recorrido_in(arbol, visit);
    break;

    case BTREE_RECORRIDO_PRE:
    cbtree_recorrido_pre(arbol, visit);
    break;

    case BTREE_RECORRIDO_POST:
    cbtree_recorrido_post(arbol, visit);
    break;
  }
}
