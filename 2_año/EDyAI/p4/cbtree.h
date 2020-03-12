#ifndef __CBTREE_H__
#define __CBTREE_H__

typedef void (*FuncionVisitante) (int dato);

typedef void (*FuncionVisitanteExtra) (int dato, void *extra);

typedef enum {
  CBTREE_RECORRIDO_IN,
  CBTREE_RECORRIDO_PRE,
  CBTREE_RECORRIDO_POST,
} CBTreeOrdenDeRecorrido;

typedef struct _CBNodo {
  int *datos;
  int cantElementos = 0;
} CBNodo;

typedef CBNodo *CBTree;

#endif /* __CBTREE_H__ */
