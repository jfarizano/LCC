#include <stdio.h>
#include <string.h>

int main(){
    
    int len, tam = 21;
    char str[tam], carac;
    
    printf("Ingrese una cadena de máximo 20 chars\n");
    fgets(str, tam, stdin);
    len = strlen(str);

    for(int i = len; i >= 0; i--){
        printf("%c", str[i]);
    }

    printf("\n");

    return 0;
}