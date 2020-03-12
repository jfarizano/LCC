#include <stdio.h>
#include <stdlib.h>

int string_len(char* str){
  int len = 0;

  while(str[len] != '\0'){
    len++;
  };

  return len;
}

int main(){
  char *str = malloc(sizeof(char) * 100);
  printf("Ingrese un string:\n");
  fgets(str, 100, stdin);
  int len = string_len(str);
  printf("%d\n", len);
  free(str);
  return 0;
}
