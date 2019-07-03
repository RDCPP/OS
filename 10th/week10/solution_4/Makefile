CC=gcc
CFLAGS=-g -o
TARGETS=tanenbaum 
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread -lm
       
clean:
	rm $(TARGETS)
