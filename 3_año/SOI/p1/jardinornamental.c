#include <stdio.h>
#include <pthread.h>

pthread_mutex_t mut = PTHREAD_MUTEX_INITIALIZER;
int resultado = 0;

void* puerta(void* arg) {
  int NVisitantes = *((int*) arg);

  for (int i = 0; i < NVisitantes; i++) {
    pthread_mutex_lock(&mut);
    resultado++;
    pthread_mutex_unlock(&mut);
  }
  
  return NULL;
}

int main() {
  pthread_t t1, t2;
  int NVisitantes;
  printf("Ingrese el N de visitantes.\n");
  scanf("%d", &NVisitantes);

  pthread_create(&t1, NULL, puerta, &NVisitantes);
  pthread_create(&t2, NULL, puerta, &NVisitantes);

  pthread_join(t1, NULL);
  pthread_join(t2, NULL);

  printf("Entraron ¿%d? visitantes.\n", resultado);

  return 0;
}

