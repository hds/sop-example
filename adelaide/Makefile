
CC=gcc
AR=ar

default: libadelaide.a

libadelaide.a: a_one.c a_two.c
	$(CC) -c -o a_one.o a_one.c
	$(CC) -c -o a_two.o a_two.c
	$(AR) rcs libadelaide.a a_one.o a_two.o
	
clean:
	rm -f libadelaide.a a_one.o a_two.o
