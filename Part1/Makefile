CC = gcc
FLAGS = #
CFLAGS = -fPIC -shared

TARGET = libmatrix.so
SOURCES = $(shell echo *.c)
OBJECTS = $(SOURCES:.c=.o)

$(TARGET): $(OBJECTS)
	$(CC) $(FLAGS) $(CFLAGS) -o $(TARGET) $(OBJECTS)

.PHONY: all clean

all: $(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)


