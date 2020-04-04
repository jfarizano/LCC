#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> 
#include <pthread.h>

// Anda bien pero arreglar que imprima bien el nro de hilo xq lo hace mal.

/* Definición de la estructura y sinónimo de tipo.*/

typedef struct cond_barrier{
  unsigned int n; 
  int cant_finalizados;
} barrier_t;

barrier_t* barrera;

/************/

/************/

/* Funcion auxiliar */

/* Operaciones*/

/* Creación de una barrera de condición, tomando como argumento la cantidad de
hilos que se van a esperar*/

void barrier_init(barrier_t *barr, unsigned int count){
  barr->n = count;
  barr->cant_finalizados = 0;
  return;
}

/* Función *bloqueante* para esperar a los demás hilos */

void barrier_wait(barrier_t *barr){
  while(barr->cant_finalizados < barr->n);
  return;                                     
}

/* Eliminación de la barrera */

void barrier_destroy(barrier_t *barr){
  free(barr);
}

void* func(void *arg){
  int var = *((int*) arg);
  /* Inicio seccion de sincronización */
  printf("Hilo %d\n", var);
  barrera->cant_finalizados ++;
  barrier_wait(barrera);
  /* Fin sección de sicronización */
  printf("Hilo %d salió del wait\n", var);
}

int main(){
  int cant_hilos = 3;
  pthread_t hilos_[cant_hilos];

  barrera = malloc(sizeof(barrier_t));
  barrier_init(barrera, cant_hilos);
  
  for (int i = 0; i < cant_hilos; i++) {
    pthread_create(&hilos_[i], NULL, func, &i);
  }

  for(int i = 0; i < cant_hilos; i++) {
    pthread_join(hilos_[i], NULL);
  }

  barrier_destroy(barrera);

  return 0;
}