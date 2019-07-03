CC=gcc
CFLAGS=-g -o
TARGETS=right_fork_first
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
