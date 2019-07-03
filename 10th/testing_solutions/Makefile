CC=gcc
CFLAGS=-g -o
TARGETS=use_of_arbitrator tanenbaum
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c -lpthread -lm
       
clean:
	rm $(TARGETS)
