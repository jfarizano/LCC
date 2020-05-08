#include<stdlib.h>
#include<stdio.h>
#include <pthread.h>

#define NPoints 10000000
#define NHILOS 2
pthread_mutex_t mut = PTHREAD_MUTEX_INITIALIZER;
int r = 1000, circTotal = 0;

void* f(void* arg) {
  int x, y;
  for (int i = 0; i < NPoints; i++) {
    x = (rand() % (2*r) + 1) - r;
    y = (rand() % (2*r) + 1) - r;
    // printf("%d %d\n", x, y);
    if((x*x) + (y*y) <= (r*r)) {
      pthread_mutex_lock(&mut);
      circTotal++;
      pthread_mutex_unlock(&mut);
    }
  }

  return NULL;
}

double piCalculation(void) {
  pthread_t t[NHILOS];

  for(int i = 0; i < NHILOS; i++){
    pthread_create(&t[i], NULL, f, NULL);
  }

  for(int i = 0; i < NHILOS; i++){
    pthread_join(t[i], NULL);   
  }

  float pi = (float)(4 * circTotal)/(float)(NPoints * NHILOS);
  return pi;
}

int main(void){
  double pi;
  // Seed setting
  srandom(time(NULL));

  pi = piCalculation();

  printf("Approximación de pi con %d puntos es: %'.10f\n",NPoints,pi);

  return 0;
}

