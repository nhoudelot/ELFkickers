#  Makefile for objres

CC = gcc
CFLAGS += -O3 -Wall -Wextra -pipe -I../elfrw
LDFLAGS = -Wall -Wextra

objres: objres.o ../elfrw/libelfrw.a

objres.o: objres.c ../elfrw/elfrw.h

../elfrw/libelfrw.a:
	$(MAKE) -C ../elfrw libelfrw.a

clean:
	-@$(RM_F) objres objres.o
