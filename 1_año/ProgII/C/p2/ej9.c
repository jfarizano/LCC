#include <stdio.h>

int main(){
    int enteros[100];

    for(int i = 0; i < 100; i++){
        enteros[i] = i;
    }
    for(int i = 0; i < 100; i++){
        printf("%d\n", enteros[i]);
    }
    return 0;
}
