#ifndef __BTREE_H__
#define __BTREE_H__

typedef void (*FuncionVisitante) (int dato);

typedef void (*FuncionVisitanteExtra) (int dato, void *extra);

typedef enum {
  BTREE_RECORRIDO_IN,
  BTREE_RECORRIDO_PRE,
  BTREE_RECORRIDO_POST,
} BTreeOrdenDeRecorrido;

typedef struct _BTNodo {
  int dato;
  struct _BTNodo *left;
  struct _BTNodo *right;
} BTNodo;

typedef BTNodo *BTree;

/**
 * Devuelve un arbol vacío.
 */
BTree btree_crear();

/**
 * Destruccion del árbol.
 */
void btree_destruir(BTree arbol);

/**
 * Crea un nuevo arbol, con el dato dado en el arbol raiz, y los subarboles dados
 * a izquierda y derecha.
 */
BTree btree_unir(int dato, BTree left, BTree right);

/**
 * Recorrido del arbol, utilizando la funcion pasada.
 */
void btree_recorrer(BTree arbol, BTreeOrdenDeRecorrido orden,
                    FuncionVisitante visit);

int btree_suma(BTree arbol);

int btree_cantidad(BTree arbol);

int btree_altura(BTree arbol);

void btree_recorrido_in(BTree arbol, FuncionVisitante visit);

void btree_recorrido_pre(BTree arbol, FuncionVisitante visit);

void btree_recorrido_post(BTree arbol, FuncionVisitante visit);

void btree_recorrer_extra(BTree arbol, BTreeOrdenDeRecorrido orden,
                          FuncionVisitanteExtra visit, void *extra);

void btree_recorrido_in_extra(BTree arbol, FuncionVisitanteExtra visit,
                              void *extra);

void btree_recorrido_pre_extra(BTree arbol, FuncionVisitanteExtra visit,
                                void *extra);

void btree_recorrido_post_extra(BTree arbol, FuncionVisitanteExtra visit,
                                void *extra);

int btree_suma_extra(BTree arbol);

void sumar(int dato, void *extra);

int btree_cantidad_extra(BTree arbol);

void sumar_uno(int dato, void *extra);

void btree_recorrer_bfs(BTree arbol, FuncionVisitante visit);

void btree_mirror(BTree arbol);

#endif /* __BTREE_H__ */
