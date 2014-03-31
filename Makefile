PROJECT = owl-rescue-guide owl-taxon-guide
TEMPLATE = pandoc-caspervector.tex
LATEX = xelatex
PANDOC_FLAGS = --latex-engine=${LATEX} --template=${TEMPLATE} \
	-V ctex --no-tex-ligatures --toc -N

all: ${PROJECT:%=%.pdf}
debug: ${PROJECT:%=%.tex}

%.pdf: %.rst %.h.tex
	pandoc ${PANDOC_FLAGS} -H ${@:%.pdf=%.h.tex} $< -o $@

%.tex: %.rst %.h.tex
	pandoc -s ${PANDOC_FLAGS} -H ${@:%.tex=%.h.tex} $< -o $@

.PHONY: clean distclean
clean:
	rm -f ${PROJECT:%=%.pdf}

distclean: clean
	rm -f ${PROJECT:%=%.tex}

