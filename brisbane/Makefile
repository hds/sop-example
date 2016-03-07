
CC=gcc
AR=ar
LD=ld
MAKE=make

CFLAGS=-I../adelaide

default: libbrisbane.a

.PHONY: all clean adelaide

adelaide:
	$(MAKE) -C ../adelaide

libbrisbane.a: adelaide b_one.c b_two.c
	$(CC) $(CFLAGS) -c -o b_one.o b_one.c
	$(CC) $(CFLAGS) -c -o b_two.o b_two.c
	$(LD) -r -o brisbane-prelink.o b_one.o b_two.o ../adelaide/libadelaide.a
	$(AR) rcs libbrisbane.a brisbane-prelink.o
	
clean:
	rm -f libbrisbane.a brisbane-prelink.o b_one.o b_two.o
