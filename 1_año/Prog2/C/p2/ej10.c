#include <stdio.h>

int main(){
    int enteros[50], contador = 0;

    for(int i = 0; i < 100; i++){
        if(i % 2 == 0){
            enteros[contador] = 100 + i;
            contador++;
        }
    }

    for(int i = 49; i > 0; i--){
        printf("%d\n", enteros[i]);
    }
    return 0;
}
