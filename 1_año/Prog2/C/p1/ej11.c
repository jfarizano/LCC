#include <stdio.h>

int main(){

    int m3[50];

    for(int i = 0; i < 50; i++){
        m3[i] = 3*i;
    }

    for(int i = 49; i >= 0; i--){
        printf("%d\n", m3[i]);
    }

    return 0;
}
