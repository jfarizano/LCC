#include "btree.h"
#include "colaEnlazada.c"
#include <stdlib.h>

BTree btree_crear() {
  return NULL;
}

void btree_destruir(BTree arbol) {
  if (arbol != NULL) {
    btree_destruir(arbol->left);
    btree_destruir(arbol->right);
    free(arbol);
  }
}

BTree btree_unir(int dato, BTree left, BTree right) {
  BTree nuevoarbol = malloc(sizeof(BTNodo));
  nuevoarbol->dato = dato;
  nuevoarbol->left = left;
  nuevoarbol->right = right;
  return nuevoarbol;
}

int btree_suma(BTree arbol) {
  if (arbol != NULL) {
    return (arbol->dato + btree_suma(arbol->left) + btree_suma(arbol->right));
  } else {
    return 0;
  }
}

int btree_cantidad(BTree arbol) {
  if (arbol != NULL) {
    return (1 + btree_cantidad(arbol->left) + btree_cantidad(arbol->right));
  } else {
    return 0;
  }
}

int btree_altura(BTree arbol) {
  if (arbol != NULL) {
    int altura;
    int alturaLeft = btree_cantidad(arbol->left);
    int alturaRight = btree_cantidad(arbol->right);
    altura = (alturaLeft >= alturaRight ? alturaLeft : alturaRight) + 1;
    return altura;
  } else {
    return 0;
  }
}

void btree_recorrer(BTree arbol, BTreeOrdenDeRecorrido orden,
                    FuncionVisitante visit) {
  switch (orden) {
    case BTREE_RECORRIDO_IN:
    btree_recorrido_in(arbol, visit);
    break;

    case BTREE_RECORRIDO_PRE:
    btree_recorrido_pre(arbol, visit);
    break;

    case BTREE_RECORRIDO_POST:
    btree_recorrido_post(arbol, visit);
    break;
  }
}

void btree_recorrido_in(BTree arbol, FuncionVisitante visit) {
  if (arbol != NULL) {
    btree_recorrido_in(arbol->left, visit);
    visit(arbol->dato);
    btree_recorrido_in(arbol->right, visit);
  }
}

void btree_recorrido_pre(BTree arbol, FuncionVisitante visit) {
  if (arbol != NULL) {
    visit(arbol->dato);
    btree_recorrido_pre(arbol->left, visit);
    btree_recorrido_pre(arbol->right, visit);
  }
}

void btree_recorrido_post(BTree arbol, FuncionVisitante visit) {
  if (arbol != NULL) {
    btree_recorrido_post(arbol->left, visit);
    btree_recorrido_post(arbol->right, visit);
    visit(arbol->dato);
  }
}

void btree_recorrer_extra(BTree arbol, BTreeOrdenDeRecorrido orden,
                          FuncionVisitanteExtra visit, void *extra) {
  switch (orden) {
    case BTREE_RECORRIDO_IN:
    btree_recorrido_in_extra(arbol, visit, extra);
    break;

    case BTREE_RECORRIDO_PRE:
    btree_recorrido_pre_extra(arbol, visit, extra);
    break;

    case BTREE_RECORRIDO_POST:
    btree_recorrido_post_extra(arbol, visit, extra);
    break;
  }
}

void btree_recorrido_in_extra(BTree arbol, FuncionVisitanteExtra visit,
                              void *extra) {
  if (arbol != NULL) {
    btree_recorrido_in_extra(arbol->left, visit, extra);
    visit(arbol->dato, extra);
    btree_recorrido_in_extra(arbol->right, visit, extra);
  }
}

void btree_recorrido_pre_extra(BTree arbol, FuncionVisitanteExtra visit,
                                void *extra) {
  if (arbol != NULL) {
    visit(arbol->dato, extra);
    btree_recorrido_pre_extra(arbol->left, visit, extra);
    btree_recorrido_pre_extra(arbol->right, visit, extra);
  }
}

void btree_recorrido_post_extra(BTree arbol, FuncionVisitanteExtra visit,
                                void *extra) {
  if (arbol != NULL) {
    btree_recorrido_post_extra(arbol->left, visit, extra);
    btree_recorrido_post_extra(arbol->right, visit, extra);
    visit(arbol->dato, extra);
  }
}

int btree_suma_extra(BTree arbol) {
  if (arbol != NULL) {
    int test = 0;
    void *resultado = &test;
    btree_recorrer_extra(arbol, BTREE_RECORRIDO_IN, sumar, resultado);
    return test;
  }
  return 0;
}

void sumar(int dato, void *extra) {
  int *resultado = (int*)extra;
  *resultado += dato;
  extra = (void*)resultado;
}

int btree_cantidad_extra(BTree arbol) {
  if (arbol != NULL) {
    int test = 0;
    void *resultado = &test;
    btree_recorrer_extra(arbol, BTREE_RECORRIDO_IN, sumar_uno, resultado);
    return test;
  }
  return 0;
}

void sumar_uno(int dato, void *extra) {
  int *resultado = (int*)extra;
  *resultado += 1;
  extra = (void*)resultado;
}

void btree_recorrer_bfs(BTree arbol, FuncionVisitante visit) {

  Cola colaSubArboles = cola_crear();
  colaSubArboles = cola_encolar(colaSubArboles, arbol);
  BTree actual;

  while (!cola_vacia(colaSubArboles)) {
    actual = (BTree)cola_primero(colaSubArboles);

    if (actual->left != NULL) {
      colaSubArboles = cola_encolar(colaSubArboles, (void*)actual->left);
      actual = (BTree)cola_primero(colaSubArboles);
    }

    if (actual->right != NULL) {
      colaSubArboles = cola_encolar(colaSubArboles, (void*)actual->right);
    }

    visit(actual->dato);

    colaSubArboles = cola_desencolar(colaSubArboles);
  }

}

void btree_mirror(BTree arbol) {
  if (arbol != NULL) {
    BTree temp = arbol->left;
    arbol->left = arbol->right;
    arbol->right = temp;
    btree_mirror(arbol->left);
    btree_mirror(arbol->right);
  }
}
