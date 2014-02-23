PROJECT = owl-guide
TEMPLATE = pandoc-caspervector.tex
HEADER = owl-header.tex
LATEX = xelatex
PANDOC_FLAGS = --latex-engine=${LATEX} --template=${TEMPLATE} \
	-V ctex --no-tex-ligatures --toc -H ${HEADER}

all: ${PROJECT}.pdf
debug: ${PROJECT}.tex

%.pdf: %.rst ${HEADER}
	pandoc ${PANDOC_FLAGS} $< -o $@

%.tex: %.rst ${HEADER}
	pandoc -s ${PANDOC_FLAGS} $< -o $@

.PHONY: clean distclean
clean:
	rm -f ${PROJECT}.pdf

distclean: clean
	rm -f ${PROJECT}.tex

