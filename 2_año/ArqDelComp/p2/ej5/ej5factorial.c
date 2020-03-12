#include <stdio.h>

unsigned int fact1(unsigned int);
unsigned int fact2(unsigned int);

int main(void){
    unsigned int x;
    scanf("%u", &x);
    printf("fact1: %u\n", fact1(x));
    printf("fact2: %u\n", fact2(x));
    return 0;
}
