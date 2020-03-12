#include <stdio.h>

int main(){

    int a, b;

    for(a = 0; a <= 20; a++){
        for(b = 0; b <= 30; b++){
            printf("%d²+%d²= %d\n", a, b, (a*a)+(b*b));
        }
    }
    return 0;
}