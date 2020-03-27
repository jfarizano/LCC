#include <stdio.h>

int main(){

    int cara;
    printf("INGRESE UNA CARARARARARARA\n");
    scanf("%d", &cara);

    switch(cara){
        case 1:
            printf("Seis\n");
            break;
        case 2:
            printf("Cinco\n");
            break;
        case 3:
            printf("Cuatro\n");
            break;
        case 4:
            printf("Tres\n");
            break;
        case 5:
            printf("Dos\n");
            break;
        case 6:
            printf("Uno\n");
            break;
        case 20:
            printf("nat crit\n");
            break;
        default:
            printf("¿Qué tenés? ¿Un d20 pelotudo?\n");
            break;
    }

    return 0;
}
