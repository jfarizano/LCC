#include <stdio.h>

int main(){

    int habitacion;

    printf("Habitaciones:\n1.Azul\n2.Roja\n3.Verde\n4.Rosa\n5.Gris\n");
    printf("Ingrese un número asociado a una habitación\n");
    scanf("%d", &habitacion);

    switch(habitacion){
        case 1:
            printf("La habitación %d tiene 2 camas y se encuentra en la primera planta\n", habitacion);
            break;
        case 2:
            printf("La habitación %d tiene 1 cama y se encuentra en la primera planta\n", habitacion);
            break;
        case 3:
            printf("La habitación %d tiene 3 camas y se encuentra en la segunda planta\n", habitacion);
            break;
        case 4:
            printf("La habitación %d tiene 2 camas y se encuentra en la segunda planta\n", habitacion);
            break;
        case 5:
            printf("La habitación %d tiene 1 cama y se encuentra en la tercera planta\n", habitacion);
            break;
        default:
            printf("Número no asociado a habitacón\n");
    }
    return 0;
}
