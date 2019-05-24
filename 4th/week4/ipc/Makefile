CC=gcc
CFLAGS=-o
TARGETS=shm_create_write shm_read_existing shm_write_existing shm_delete_existing
all: $(TARGETS)
.PHONY: all
%:
	$(CC) -o $@ $@.c 
       
clean:
	rm $(TARGETS)
