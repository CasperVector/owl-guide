PROJECT = owl-guide
TEMPLATE = pandoc-caspervector.tex
LATEX = xelatex
PANDOC_FLAGS = --latex-engine=${LATEX} --template=${TEMPLATE} -V ctex --no-tex-ligatures --toc

all: ${PROJECT}.pdf
debug: ${PROJECT}.tex

%.pdf: %.rst
	pandoc ${PANDOC_FLAGS} $< -o $@

%.tex: %.rst
	pandoc -s ${PANDOC_FLAGS} $< -o $@

.PHONY: clean distclean
clean:
	rm -f ${PROJECT}.pdf

distclean: clean
	rm -f ${PROJECT}.tex

