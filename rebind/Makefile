#  Makefile for rebind

CFLAGS += -O3 -Wall -Wextra -pipe -I../elfrw

rebind: rebind.c ../elfrw/libelfrw.a

../elfrw/libelfrw.a:
	$(MAKE) -C ../elfrw libelfrw.a

clean:
	-@$(RM_F) rebind
