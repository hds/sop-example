
CC=gcc
MAKE=make

CFLAGS=-Ibrisbane

LDFLAGS=-Lbrisbane

default: sop

.PHONY: all clean brisbane

brisbane:
	echo "mog mog"
	$(MAKE) -C brisbane

sop: brisbane sop.c
	$(CC) $(CFLAGS) -c -o sop.o sop.c
	$(CC) $(LDFLAGS) -lbrisbane -o sop sop.o

clean:
	rm -f sop.o sop

cleanall: clean
	$(MAKE) -C brisbane clean
	$(MAKE) -C adelaide clean
	
