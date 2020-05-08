#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h> 
#include <unistd.h> 
#include <pthread.h>

/* Implementación de los semáforos de Djikstra. */

typedef struct semaphore_t {
  int semaphore;
} sem_t;

sem_t* sem;

/* Función de creación de Semáforo */

int sem_init(sem_t *sem, int init){
  sem->semaphore = init;
  return sem->semaphore;
}

/* Incremento del semáforo. */
void sem_incr(sem_t *sem){
  (sem->semaphore)++;
}

/* Decremento del semáforo. Notar que es una función que puede llegar a bloquear
   el proceso.*/

void sem_decr(sem_t *sem){
  if (sem->semaphore >= 0){
    (sem->semaphore)--;
    return;
  }
  while (sem->semaphore <= 0);
  (sem->semaphore)--;
}

/* Destrucción de un semáforo */

int sem_destroy(sem_t *sem){
  free(sem);
}

void* func(void *arg){
  int var = *((int*) arg);
  while (1) {
    sem_decr(sem);
    printf("Hilo %d, valor semaforo %d\n", var, sem->semaphore);
    sem_incr(sem);
  }
}

int main() {
  sem = malloc(sizeof(sem_t));
  sem_init(sem, 1);
  pthread_t hilos[2];

  for (int i = 0; i < 2; i++) {
    pthread_create(&hilos[i], NULL, func, &i);
  }

  for(int i = 0; i < 2; i++) {
    pthread_join(hilos[i], NULL);
  }

  return 0;
}