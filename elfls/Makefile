#  Makefile for elfls

CFLAGS += -O3 -Wall -Wextra -pipe -I../elfrw

elfls: elfls.c ../elfrw/libelfrw.a

../elfrw/libelfrw.a:
	$(MAKE) -C ../elfrw libelfrw.a

clean:
		-@$(RM_F) elfls
