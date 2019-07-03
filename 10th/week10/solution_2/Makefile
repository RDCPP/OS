CC=gcc
CFLAGS=-g -o
TARGETS=right_left_forks
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
