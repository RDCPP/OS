CC=gcc
CFLAGS=-g --save-temp -o
TARGETS=tracee tracer
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c 
       
clean:
	rm $(TARGETS) *.i *.s *.o
