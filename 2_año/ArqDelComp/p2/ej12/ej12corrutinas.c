#include "ej12guindows.h"
#include <stdio.h>

// Ejercicio 12: observación:

/* Para verificar el apartado 12_c), desconmentar las líneas que dicen
'apartado c)' y comentar los bucles 'for'.
 */

static task t1, t2, t3, taskmain;

static void ft1(void)
{
    // unsigned j; // Apartado c)
    // printf("t1: %p\n", &j); // Apartado c)
    for (double d = -1; ; d += 0.001) {
        printf("d=%f\n", d);
        TRANSFER(t1, t2);
    }
    TRANSFER(t1, t2);
}

static void ft2(void)
{
    unsigned j;
    // printf("t2: %p\n", &j); // Apartado c)
    for (unsigned i = 0; i < 10000; i++) {
        printf("i=%u\n", i);
        TRANSFER(t2, t3);
    }
    // TRANSFER(t2, t3); // Apartado c)
    TRANSFER(t2, taskmain);
}

static void ft3(void){
    unsigned j;
    // printf("t3: %p\n", &j); // Apartado c)
    for (unsigned i = 0; i < 5000; i++){
        printf("t3: i=%u\n", i);
        TRANSFER(t3, t1);
    }
    TRANSFER(t3, taskmain);
}

int main(void)
{
    stack(t1, ft1);
    stack(t2, ft2);
    stack(t3, ft3);
    TRANSFER(taskmain, t1);
    return 0;
}
