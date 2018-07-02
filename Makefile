PROJECT = owl-rescue-guide owl-taxon-guide
TEMPLATE = pandoc-caspervector.tex
LATEX = xelatex
PANDOC_FLAGS = -s -t latex-smart -V ctex --toc -N \
	--pdf-engine=${LATEX} --template=${TEMPLATE}

all: ${PROJECT:%=%.pdf}
debug: ${PROJECT:%=%.tex}

%.pdf: %.rst %.h.tex
	pandoc ${PANDOC_FLAGS} -H ${@:%.pdf=%.h.tex} $< -o $@

%.tex: %.rst %.h.tex
	pandoc ${PANDOC_FLAGS} -H ${@:%.tex=%.h.tex} $< -o $@

.PHONY: clean distclean
clean:
	rm -f ${PROJECT:%=%.pdf}

distclean: clean
	rm -f ${PROJECT:%=%.tex}

