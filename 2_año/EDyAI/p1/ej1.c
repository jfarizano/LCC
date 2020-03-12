#include <stdio.h>
#include <stdlib.h>

void bubble_sort(float arreglo[], int longitud) {

  for (int iter = 0 ; iter < longitud - 1 ; iter++) {
      for (int i = 0 ; i < longitud - iter - 1; i++) {
          if (arreglo[i] > arreglo[i + 1]) {
            float aux = arreglo[i];
            arreglo[i] = arreglo[i + 1];
            arreglo[i + 1] = aux;
          }
      }
  }
}

float mediana(float *arreglo, int longitud){

  float mediana;
  int mitad;

  // Copia y ordenamiento del arreglo
  float *arregloOrdenado = malloc(sizeof(float) * longitud);

  for (int i = 0; i < longitud; i++){
    arregloOrdenado[i] = arreglo[i];
  }
  bubble_sort(arregloOrdenado, longitud);

  // Obtención de la mediana
  if (longitud % 2 == 0){
    mitad = (longitud / 2) - 1;
    float m1 = arregloOrdenado[mitad];
    float m2 = arregloOrdenado[mitad + 1];
    mediana = (m1 + m2) / 2;
  } else {
    mitad = longitud / 2;
    mediana = arregloOrdenado[mitad];
  }

  free(arregloOrdenado);

  return mediana;
}

int main(){

  float med;
  //float arreglo[9] = {6.4, 4.2, 5.3, 8.9, 3.2, 2.3, 4.2, 9.1, 8.1};
  //float arreglo[8] = {3.52, 14.4, 163.4, 134.5, 12.2, 1.82, 70.4, 13.4};
  float arreglo[4] = {54.3, 13.3, 14.5, 17.1};
  int longitud = sizeof(arreglo)/sizeof(arreglo[0]);

  med = mediana(arreglo, longitud);

  printf("La mediana es %f\n", med);

  return 0;

}
