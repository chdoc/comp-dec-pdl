EXTRA_DIR:=coqdocjs/extra
COQDOCFLAGS:= \
  --external 'http://math-comp.github.io/math-comp/htmldoc/' mathcomp \
  --external 'libs' libs \
  --toc --toc-depth 2 --html --interpolate \
  --index indexpage -s --no-lib-name --parse-comments \
  --with-header ../$(EXTRA_DIR)/header.html --with-footer ../$(EXTRA_DIR)/footer.html
export COQDOCFLAGS

all:
	+make -C libs
	+make -C PDL
	+make -C CPDL

website:
	+make -C libs html
	+make -C PDL html
	+make -C CPDL html
	mkdir -p website/PDL/libs
	mkdir -p website/CPDL/libs
	cp libs/html/* website/PDL/libs
	cp $(EXTRA_DIR)/resources/* website/PDL/libs/
	cp PDL/html/* website/PDL/
	cp $(EXTRA_DIR)/resources/* website/PDL	
	cp libs/html/* website/CPDL/libs
	cp $(EXTRA_DIR)/resources/* website/CPDL/libs/
	cp CPDL/html/* website/CPDL   
	cp $(EXTRA_DIR)/resources/* website/CPDL

clean:
	+make -C libs clean
	+make -C PDL clean
	+make -C CPDL clean
	rm -rf website libs/.*aux

.PHONY: all website clean
