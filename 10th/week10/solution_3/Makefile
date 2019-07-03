CC=gcc
CFLAGS=-g -o
TARGETS=use_of_arbitrator
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread -lm
       
clean:
	rm $(TARGETS)
