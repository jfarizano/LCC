#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

int string_len(char* str){
  int len = 0;

  while (str[len] != '\0'){
    len++;
  }

  return len;
}

int string_concat(char *str1, char *str2, int max){
  int copiados = 0;
  int len1 = string_len(str1), len2 = string_len(str2);

  for (; copiados < max && copiados < len2; copiados++){
    str1[len1+copiados] = str2[copiados];
  }

  return copiados;
}

void ingreso_palabras(char **arregloStrings, int capacidad){
  char *buff = malloc(sizeof(char) * 100);
  int len;
  printf("Ingrese los strings, uno por uno separados por un enter\n");
  for (int i = 0; i < capacidad; i++){
    scanf("%s", buff);
    len = string_len(buff);
    arregloStrings[i] = malloc(sizeof(char) * len);
    strcpy(arregloStrings[i], buff);
  }
  free(buff);
}

int obtener_tamanio_res(char **arregloStrings, char *sep, int cantidad){
  int cantCaracteres = 0;

  for (int i = 0; i < cantidad; i++){
    cantCaracteres += string_len(arregloStrings[i]);
  }

  cantCaracteres += (string_len(sep) * (cantidad - 1));

  return cantCaracteres+1;
}

void string_unir(char *arregloStrings[], int capacidad, char *sep, char *res){
  int lenSep = string_len(sep);
  for (int i = 0; i < capacidad-1; i++){
    string_concat(res, arregloStrings[i], string_len(arregloStrings[i]));
    string_concat(res, sep, lenSep);
  }
  int ultimo = capacidad-1;
  string_concat(res, arregloStrings[ultimo], string_len(arregloStrings[ultimo]));
}

int main(){
  int capacidad;
  printf("¿Cuántos strings se van a ingresar?\n");
  scanf("%d", &capacidad);
  assert(capacidad > 0);
  char **arregloStrings = malloc(sizeof(char*) * capacidad);
  ingreso_palabras(arregloStrings, capacidad);

  char *buff = malloc(sizeof(char) * 100);
  printf("Ingrese el string separador\n");
  scanf("%s", buff);
  int len = string_len(buff);
  char *sep = malloc(sizeof(char) * len);
  strcpy(sep, buff);
  free(buff);

  int tamanioRes = obtener_tamanio_res(arregloStrings, sep, capacidad);
  char *res = malloc(sizeof(char) * tamanioRes);

  string_unir(arregloStrings, capacidad, sep, res);

  printf("El resultado es:\n");
  printf("%s\n", res);

  return 0;
}
