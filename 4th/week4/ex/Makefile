CC=gcc
CFLAGS=-o
TARGETS=num_of_process create_child value_of_pid
all: $(TARGETS)
.PHONY: all
%:
	$(CC) -o $@ $@.c 
       
clean:
	rm $(TARGETS)
