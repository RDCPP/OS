CC=gcc
CFLAGS=-o
TARGETS=sudoku_validator
all: $(TARGETS)
.PHONY: all
%:
	$(CC) -g -o $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
