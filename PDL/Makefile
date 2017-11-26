COQVERSION=$(shell coqc -v | grep version | cut -d' ' -f 6 )

all: Makefile.coq
	+make -f Makefile.coq all

html: Makefile.coq
	+make -f Makefile.coq html

clean: Makefile.coq
	+make -f Makefile.coq clean
	rm -f Makefile.coq CoqMakefile.conf depend.*

Makefile.coq: _CoqProject
	coq_makefile -f _CoqProject -arg -w -arg -notation-overridden >Makefile.coq

.PHONY: all html gallinahtml clean
