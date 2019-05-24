CC=gcc
CFLAGS=-g --save-temps -o
TARGETS=print_something
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c 
       
clean:
	rm $(TARGETS) $(TARGETS).i $(TARGETS).s $(TARGETS).o
