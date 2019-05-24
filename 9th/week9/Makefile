CC=gcc
CFLAGS=-g -o
TARGETS=merge_sort mthread_sort
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
