TARGET = garden
CFLAGS = -g

.PHONY: all clean

all: $(TARGET)

clean:
	$(RM) $(TARGET)

$(TARGET): src/main.c src/guindows.c
	$(CC) $(CFLAGS) -o $@ $^
