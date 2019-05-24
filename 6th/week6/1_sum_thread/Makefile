CC=gcc
CFLAGS=-o
TARGETS=sum_thread
all: $(TARGETS)
.PHONY: all
%:
	$(CC) -g -o $@ $@.c -lpthread
       
clean:
	rm $(TARGETS)
