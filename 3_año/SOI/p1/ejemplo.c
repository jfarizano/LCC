#include <stdio.h>
#include <assert.h>
#include <pthread.h>

void* printEcho(void *i) {
  int arg = *((int*)i);
  printf("ECHO: %d!\n", arg);

  return NULL;
}

int main(int argc, char **argv) {
  pthread_t thread_id[2];
  int arg1=1, arg2=2;
  void *res;

  printf("Creamos dos hilos!\n");

  assert(! pthread_create(&thread_id[0], NULL, printEcho, (void*)&arg1));
  assert(! pthread_create(&thread_id[1], NULL, printEcho, (void*)&arg2));

  printf("Esperamos a que terminan...\n");

  assert(! pthread_join(thread_id[0], &res));
  assert(! pthread_join(thread_id[1], &res));

  printf("Terminamos!\n");

  return 0;
}