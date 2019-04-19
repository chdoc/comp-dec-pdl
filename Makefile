EXTRA_DIR:=coqdocjs/extra
COQDOCFLAGS:= \
  --external 'http://math-comp.github.io/math-comp/htmldoc/' mathcomp \
  --toc --toc-depth 2 --html --interpolate \
  --index indexpage -s --no-lib-name --parse-comments \
  --with-header $(EXTRA_DIR)/header.html --with-footer $(EXTRA_DIR)/footer.html
export COQDOCFLAGS

all: Makefile.coq
	+$(MAKE) -f Makefile.coq all

html: Makefile.coq
	+$(MAKE) -f Makefile.coq html
	cp $(EXTRA_DIR)/resources/* html

clean: Makefile.coq
	+$(MAKE) -f Makefile.coq cleanall
	rm -f Makefile.coq Makefile.coq.conf

Makefile.coq: _CoqProject
	$(COQBIN)coq_makefile -f _CoqProject -o Makefile.coq

_CoqProject Makefile: ;

%: Makefile.coq
	+$(MAKE) -f Makefile.coq $@

.PHONY: all clean html
