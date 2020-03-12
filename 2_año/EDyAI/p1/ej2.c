#include <stdio.h>
#include <stdlib.h>

int string_len(char* str){
  int len = 0;

  while(str[len] != '\0'){
    len++;
  };

  return len;
}

void string_reverse(char* str){
  int len = string_len(str);
  char *strReverse = malloc(sizeof(char) * (len+1));

  for (int i = 0; i < len; i++){
    strReverse[i] = str[len - i - 1];
  }
  strReverse[len] = '\0';

  for (int i = 0; i <= len; i++){
    str[i] = strReverse[i];
  }
  free(strReverse);
}

int main(){
  int opcion;
  printf("1 - Largo de la cadena\n");
  printf("2 - Revertir cadena\n");
  printf("3 - Concatenar cadenas\n");
  printf("4 - Comparar cadenas\n");
  printf("5 - Buscar subcadena\n");
  printf("6 - Unir arreglo de cadenas\n");
  printf("Ingrese una opción: ");
  scanf("%d", &opcion);

  if (opcion == 1){
    char *str = malloc(sizeof(char) * 100);
    printf("Ingrese un string:\n");
    scanf("%s", str);
    int len = string_len(str);
    rintf("%d\n", len);
      free(str);
  } else if (opcion == 2){
    char *str = malloc(sizeof(char) * 100);
    printf("Ingrese un string: ");
    scanf("%s", str);
    string_reverse(str);
    printf("%s\n", str);
    free(str);
  } else if (opcion == 3){


  }


  return 0;
}
