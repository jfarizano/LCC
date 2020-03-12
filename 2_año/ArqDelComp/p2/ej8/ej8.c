#include <stdio.h>
#include <string.h>

// IMPORTANTE: compilar como: gcc -no-pie ej8.c ej8a.s ej8b.s -g

// Desde acá llamamos a las funciones del ejercicio a) y b)

int findc(char *s, char c, int len);
int comparar(char *s1, char *s2, int len);

int main(){
    char s1[100], s2[100];
    char c;
    scanf("%s", s1);
    scanf("%s", s2);
    scanf(" %c", &c);
    int len1 = strlen(s1);
    int len2 = strlen(s2);
    printf("findc: %d\n", findc(s1, c, len1)); // Apartado a)
    printf("comparar: %d\n", comparar(s1, s2, len1)); // Apartado b)

    return 0;
}
