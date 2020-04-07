CC=gcc
CLFAGS= -g -Wall
LDFLAGS= -g

default: microc.native foo.a

microc.native: microc.ml scanner.mll microcparse.mly irgen.ml semant.ml ast.ml sast.ml
	ocamlbuild -use-ocamlfind microc.native -pkgs unix,llvm,llvm.analysis

foo.a: foo.o
	ar -crs foo.a foo.o
	ranlib foo.a

foo.o: foo.h foo.c

.PHONY: clean
clean:
	ocamlbuild -clean 2>/dev/null
	rm -f scanner.native
	rm -rf _build
	rm -rf *.o *.s *.byte exe a.out *.a

.PHONY: all
all: clean default
