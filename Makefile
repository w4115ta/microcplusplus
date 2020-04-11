CC=gcc
CFLAGS= -g -Wall
LDFLAGS= -g

default: microc.native libfoo.a

microc.native: microc.ml scanner.mll microcparse.mly irgen.ml semant.ml ast.ml sast.ml
	ocamlbuild -use-ocamlfind microc.native -pkgs llvm

libfoo.a: foo.o
	ar -crs libfoo.a foo.o
	ranlib libfoo.a

foo.o: foo.h foo.c

.PHONY: clean
clean:
	ocamlbuild -clean 2>/dev/null
	rm -f scanner.native
	rm -rf _build
	rm -rf *.o *.s *.byte exe a.out *.a

.PHONY: all
all: clean default
