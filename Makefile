.PHONY: all clean wordcount

LATEX = $(wildcard *.tex)
PDF = $(patsubst %.tex, %.pdf, $(LATEX))
ARCHIVE = error_codes.zip

all : $(PDF)

%.pdf : %.tex
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

$(ARCHIVE) : Makefile $(LATEX)
	zip $@ $^

clean :
	latexmk -C
	rm -f $(ARCHIVE)
