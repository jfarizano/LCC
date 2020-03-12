CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -pedantic

ej2: ej2/ej2.c
	$(CC) ej2/ej2.c -o ej2.o $(CFLAGS)

ej3: ej3/ej3.c
	$(CC) ej3/ej3.c -o ej3.o $(CFLAGS)

ej4: ej4/ej4.c
	$(CC) ej4/ej4.c -o ej4.o $(CFLAGS)

ej5: ej5/ej5.c
	$(CC) ej5/ej5.c -o ej5.o $(CFLAGS)

ej6: ej6/ej6.c
	$(CC) ej6/ej6.c -o ej6.o $(CFLAGS)

ej7: ej7/ej7.c
	$(CC) ej7/ej7.c -o ej7.o $(CFLAGS) -lgmp

ej8: ej8/ej8.c
	$(CC) ej8/ej8.c -o ej8.o $(CFLAGS) -lgmp

.PHONY: clean
clean:
	rm -rf *.o