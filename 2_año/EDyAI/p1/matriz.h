#ifndef __MATRIZ_H__
#define __MATRIZ_H__

#include <stdlib.h>

typedef struct Matriz_ Matriz;

/*
** Crea una nueva matriz
*/
Matriz* matriz_crear(size_t numFilas, size_t numColumnas);

/*
** Destruye una matriz
*/
void matriz_destruir(Matriz* matriz);

/*
** Obtiene el dato guardado en la posición dada de la matriz
*/
double matriz_leer(Matriz* matriz, size_t fil, size_t col);

/*
** Modifica el dato guardado en la posición dada de la matriz
*/
void matriz_escribir(Matriz* matriz, size_t fil, size_t col, double val);

/*
** Obtiene número de filas de la matriz
*/
size_t matriz_num_filas(Matriz* matriz);

/*
** Obtiene número de columnas de la matriz
*/
size_t matriz_num_columnas(Matriz* matriz);

/*
** Imprime en consola la matriz dada
*/
void matriz_imprimir(Matriz* matriz);

/*
** Intercambia dos filas dadas
*/
void matriz_intercambiar_filas(Matriz* matriz, size_t fila1, size_t fila2);

/*
** Dadas dos matrices, devuelve una nueva matriz con el resultado de sumarlas
*/
Matriz* matriz_sumar(Matriz* matriz1, Matriz* matriz2);

/*
** Dadas dos matrices, devuelve una nueva matriz con el resultado de multiplicarlas
*/
Matriz* matriz_multiplicar(Matriz* matriz1, Matriz* matriz2);

#endif /* __MATRIZ_H__ */
