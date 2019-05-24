CC=gcc
CFLAGS=-o
TARGETS=ordinary_pipe line_a
all: $(TARGETS)

.PHONY: all
%:
	$(CC) -o $@ $@.c 
       
clean:
	rm $(TARGETS)
