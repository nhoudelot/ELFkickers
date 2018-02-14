#  The top-level makefile simply invokes all the other makefiles
SHELL = /bin/sh
MAKE = make
CC = gcc
AR = ar
prefix = /usr
#variable de nettoyage
RM_F = rm -f

PROGRAMS = elfls objres rebind sstrip elftoc ebfc infect

#variables d'instalation
INSTALL = install
INSTALL_DIR     = $(INSTALL) -p -d -o root -g root  -m  755
INSTALL_PROGRAM = $(INSTALL) -p    -o root -g root  -m  755
INSTALL_DATA    = $(INSTALL) -p    -o root -g root  -m  644

#parallel compilation if available
ifneq (,$(filter parallel=%,$(DEB_BUILD_OPTIONS)))
 NUMJOBS = $(patsubst parallel=%,%,$(filter parallel=%,$(DEB_BUILD_OPTIONS)))
 MAKEFLAGS += -j$(NUMJOBS)
endif

export

all: $(PROGRAMS)

bin/%:
	mkdir -p bin
	$(MAKE) -C$* $*
	cp $*/$* $@

doc/%.1:
	mkdir -p doc
	cp $*/$*.1 $@

elfls: bin/elfls doc/elfls.1
objres: bin/objres doc/objres.1
rebind: bin/rebind doc/rebind.1
sstrip: bin/sstrip doc/sstrip.1
elftoc: bin/elftoc doc/elftoc.1
ebfc: bin/ebfc doc/ebfc.1
infect: bin/infect doc/infect.1

install: $(PROGRAMS)
	$(INSTALL_DIR) $(DESTDIR)$(prefix)/bin/
	$(INSTALL_PROGRAM) bin/*  $(DESTDIR)$(prefix)/bin/.
	$(INSTALL_DIR) $(DESTDIR)$(prefix)/share/man/man1/
	$(INSTALL_DATA) doc/*  $(DESTDIR)$(prefix)/share/man/man1/.

clean:
	for dir in elfrw $(PROGRAMS) ; do $(MAKE) -C$$dir clean ; done
	-@$(RM_F) $(PROGRAMS:%=bin/%) $(PROGRAMS:%=doc/%.1)
