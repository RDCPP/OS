CC=gcc
CFLAGS=-g -o
TARGETS=print_mutex print_no_mutex
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
