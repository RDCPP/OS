CC=gcc
CFLAGS=-g --save-temps -o
TARGETS=ptrace_regs
all: $(TARGETS)
.PHONY: all
%:
	$(CC) $(CFLAGS) $@ $@.c 
       
clean:
	rm $(TARGETS) $(TARGETS).i $(TARGETS).s $(TARGETS).o
