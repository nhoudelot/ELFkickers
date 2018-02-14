#  Makefile for sstrip

CFLAGS += -O3 -Wall -Wextra -pipe -I../elfrw

sstrip: sstrip.c ../elfrw/libelfrw.a

../elfrw/libelfrw.a:
	$(MAKE) -C ../elfrw libelfrw.a

clean:
	-@$(RM_F) sstrip
