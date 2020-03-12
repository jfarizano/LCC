#include <stdio.h>
#include <stdlib.h>

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

int main(){
  char str1[13] = "Probando";
  char str2[] = "Estoefpfjgipjpgdfjp";
  int max = 50, copiados;
  printf("%s %s\n", str1, str2);
  copiados = string_concat(str1, str2, max);
  printf("%s\n", str1);
  printf("Fueron copiados %d caracteres\n", copiados);
}
