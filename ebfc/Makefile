#  Makefile for ebfc

CFLAGS += -O3 -Wall -Wextra -pipe -Wno-missing-field-initializers

ebfc: ebfc.o brainfuck.o libelfparts.a

ebfc.o: ebfc.c elfparts.h ebfc.h
brainfuck.o: brainfuck.c elfparts.h ebfc.h

libelfparts.a: elfparts.o ehdr.o phdrtab.o shdrtab.o progbits.o	\
               strtab.o symtab.o hash.o rel.o got.o dynamic.o
	$(AR) crs libelfparts.a $^

elfparts.o: elfparts.c elfparts.h gen.h
ehdr.o: ehdr.c elfparts.h gen.h
phdrtab.o: phdrtab.c elfparts.h gen.h
shdrtab.o: shdrtab.c elfparts.h gen.h
progbits.o: progbits.c elfparts.h gen.h
strtab.o: strtab.c elfparts.h gen.h
symtab.o: symtab.c elfparts.h gen.h
hash.o: hash.c elfparts.h gen.h
rel.o: rel.c elfparts.h gen.h
got.o: got.c elfparts.h gen.h
dynamic.o: dynamic.c elfparts.h gen.h

clean:
	-@$(RM_F) elfparts.o ehdr.o phdrtab.o shdrtab.o progbits.o strtab.o
	-@$(RM_F) symtab.o hash.o rel.o got.o dynamic.o ebfc.o brainfuck.o
	-@$(RM_F) ebfc libelfparts.a
