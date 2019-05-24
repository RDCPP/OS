CC=gcc
CFLAGS=-g --save-temps -o
TARGETS=my_ptrace
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c 
       
clean:
	rm $(TARGETS) $(TARGETS).i $(TARGETS).s $(TARGETS).o
