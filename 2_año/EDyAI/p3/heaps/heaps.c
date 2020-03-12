#include <stdio.h>
#include <stdlib.h>

#define MAX_HEAP 64;

typedef struct _BHeap {
  int *datos;
  int nelems;
} *BHeap;

BHeap bheap_crear() {
  BHeap heap = malloc(sizeof(BHEAP));
  heap->datos = malloc(sizeof(int) * MAX_HEAP);
  heap->nelems = 0;

  return heap;
}

int bheap_es_vacio(BHeap heap) {
  return heap->nelems == 0;
}
