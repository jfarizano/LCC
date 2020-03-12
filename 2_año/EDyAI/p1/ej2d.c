#include <stdio.h>
#include <stdlib.h>

int string_len(char* str){
  int len = 0;

  while (str[len] != '\0'){
    len++;
  }

  return len;
}

int string_compare(char *str1, char *str2){
  int resultado = 0, i = 0;
  int len1 = string_len(str1), len2 = string_len(str2);

  while (i < len1 && i < len2 && resultado == 0){
    if (str1[i] < str2[i]){
      resultado = -1;
    }else if (str1[i]>str2[i]){
      resultado = 1;
    }

    i++;
  }

  return resultado;
}


int main(){
  char str1[] = "mercurio";
  char str2[] = "merceditas";
  printf("%d\n", string_compare(str1, str2));
  return 0;
}
