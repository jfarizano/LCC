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
  char *str = malloc(sizeof(char) * 100);
  printf("Ingrese un string:\n");
  fgets(str, 100, stdin);
  string_reverse(str);
  printf("%s\n", str);
  free(str);
  return 0;
}
