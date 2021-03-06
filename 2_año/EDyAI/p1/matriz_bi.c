#include <stdio.h>
#include "matriz.h"

struct Matriz_ {
    double** dato;
    size_t numFilas;
    size_t numColumnas;
};

Matriz* matriz_crear(size_t numFilas, size_t numColumnas) {
  Matriz* nuevaMatriz = malloc(sizeof(Matriz));
  nuevaMatriz->numFilas = numFilas;
  nuevaMatriz->numColumnas = numColumnas;
  nuevaMatriz->dato = malloc(sizeof(double*) * numFilas);

  for (int i = 0; i < numFilas; i++){
    nuevaMatriz->dato[i] = malloc(sizeof(double) * numColumnas);
  }

  return nuevaMatriz;

}

void matriz_destruir(Matriz* matriz) {
  size_t numFilas = matriz_num_filas(matriz);

  for (size_t i = 0; i < numFilas; i++){
    free(matriz->dato[i]);
  }
  free(matriz->dato);
  free(matriz);
}

double matriz_leer(Matriz* matriz, size_t fila, size_t col) {
  return matriz->dato[fila][col];
}

void matriz_escribir(Matriz* matriz, size_t fila, size_t col, double dato) {
  matriz->dato[fila][col] = dato;
}

size_t matriz_num_filas(Matriz* matriz) {
  return matriz->numFilas;
}

size_t matriz_num_columnas(Matriz* matriz) {
  return matriz->numColumnas;
}

void matriz_imprimir(Matriz* matriz){
  size_t numFilas = matriz_num_filas(matriz); 
  size_t numColumnas = matriz_num_columnas(matriz);
  
  for (size_t i = 0; i < numFilas; i++){
    for (size_t j = 0; j < numColumnas; j++){
      printf("%f ", matriz_leer(matriz, i, j));
    }
    printf("\n");
  }
}

void matriz_intercambiar_filas(Matriz* matriz, size_t fila1, size_t fila2){
  double* temp = matriz->dato[fila1];
  matriz->dato[fila1] = matriz->dato[fila2];
  matriz->dato[fila2] = temp;
}

Matriz* matriz_sumar(Matriz* matriz1, Matriz* matriz2){
  size_t numFilas = matriz_num_filas(matriz1);
  size_t numColumnas = matriz_num_columnas(matriz1);
  Matriz* resultado = matriz_crear(numFilas, numColumnas);

  for (size_t i = 0; i < numFilas; i++){
    for (size_t j = 0; j < numColumnas; j++){
      double a = matriz_leer(matriz1, i, j);
      double b = matriz_leer(matriz2, i, j);
      matriz_escribir(resultado, i, j, a+b);
    }
  }

  return resultado;
}

Matriz* matriz_multiplicar(Matriz* matriz1, Matriz* matriz2){
  size_t numFilas = matriz_num_filas(matriz1);
  size_t numColumnas = matriz_num_columnas(matriz2);
  size_t n = matriz_num_columnas(matriz1);

  Matriz* resultado = matriz_crear(numFilas, numColumnas);

  for (size_t i = 0; i < numFilas; i++){
    for (size_t j = 0; j < numColumnas; j++){

      double sumatoria = 0;
      for (size_t k = 0; k < n; k++){
        double a = matriz_leer(matriz1, i, k);
        double b = matriz_leer(matriz2, k, j);
        sumatoria += (a * b);
      }
      matriz_escribir(resultado, i, j, sumatoria);

    }
  }


  return resultado;
}