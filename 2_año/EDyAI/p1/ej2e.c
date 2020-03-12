#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

int string_len(char* str){
  int len = 0;

  while (str[len] != '\0'){
    len++;
  }

  return len;
}

int string_subcadena(char *str1, char *str2){
  int encontrada = -1;
  int len1 = string_len(str1), len2 = string_len(str2);
  assert(len1>=len2);

  for (int i = 0; i < len1 && encontrada == -1; i++){
    if (str1[i] == str2[0]){
      int seguir = 1;

      for (int j = 1; j < len2 && seguir == 1; j++){
        if (str1[i+j] != str2[j]){
          seguir = 0;
        } else if (j == len2-1) {
          encontrada = 1;
        }
      }

    }
  }

  return encontrada;
}

int main(){
  char str1[] = "Anticonstitucionalmente";
  char str2[] = "nalmente";
  int encontrada = string_subcadena(str1, str2);
  printf((encontrada == -1) ? "No\n" : "Si\n");
}
