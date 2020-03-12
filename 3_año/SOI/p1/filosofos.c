#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

pthread_mutex_t *mut;

void* filosofos_comen(void* arg) {
  int r = *((int*) arg);
  int l = r-1 < 0 ? 4 : r-1;
  while (1) {
    if (r == 0) {
      pthread_mutex_lock(&mut[l]);
      printf("Filosofo %d levantó el tenedor %d (izquierda)\n", r, l);
      pthread_mutex_lock(&mut[r]);
      printf("Filosofo %d levantó el tenedor %d (derecha)\n", r, r); 
    } else {
      pthread_mutex_lock(&mut[r]);
      printf("Filosofo %d levantó el tenedor %d (derecha)\n", r, r); 
      pthread_mutex_lock(&mut[l]);
      printf("Filosofo %d levantó el tenedor %d (izquierda)\n", r, l); 
    }
    printf("Filosofo %d está comiendo xd\n", r);
    pthread_mutex_unlock(&mut[r]);
    pthread_mutex_unlock(&mut[l]);
    printf("Filosofo %d terminó de comer y está pensando xd\n", r);
    sleep(1);
    printf("Filosofo %d ya filosofó\n", r);
  }

  return NULL;  
}

int main(){
  pthread_t filosofos[5];

  mut = malloc(sizeof(pthread_mutex_t) * 5);

  for (int i = 0; i < 5; i++) {
    pthread_mutex_init(&mut[i], NULL);
  }

  for (int i = 0; i < 5; i++) {
    pthread_create(&filosofos[i], NULL, filosofos_comen, &i);
  }

  for (int i = 0; i < 5; i++) {
    pthread_join(filosofos[i], NULL);
  }

  return 0;
}