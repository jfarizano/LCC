CC = gcc
CFLAGS = -Wall -Wextra -lpthread

main: server client

server: remoteServer.c
	$(CC) remoteServer.c -o server.o $(CFLAGS)

client: remoteClient.c
	$(CC) remoteClient.c -o client.o $(CFLAGS)

.PHONY: clean
clean:
	rm -rf *.o