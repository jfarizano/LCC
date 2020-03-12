#include <stdio.h>
#include <math.h>

float sumatoria1(){

    float resultado = 0;

    for(int i = 1; i <= 100; i++){
        resultado += (1.0/i);
    }

    return resultado;
}

float sumatoria2(){

    float resultado = 0;

    for(int i = 1; i <= 30; i++){
        resultado += 1.0/(i*i);
    }

    return resultado;
}

float sumatoria3(){

    float resultado = 0;

    for(int i = 1; i <= 25; i++){
        resultado += 1.0/pow(i, i);
    }

    return resultado;
}

float sumatoria4(){

    float resultado = 0;

    for(int i = 2; i <= 10; i++){
        resultado += (i+1)*i;
    }

    return resultado;
}


float main(){

    float resultado1, resultado2, resultado3, resultado4;
    resultado1 = sumatoria1();
    resultado2 = sumatoria2();
    resultado3 = sumatoria3();
    resultado4 = sumatoria4();

    printf("Los resultados son: %f, %f, %f y %f\n", resultado1, resultado2, resultado3, resultado4);

    return 0;
}
