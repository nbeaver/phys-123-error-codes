.PHONY: all clean wordcount

LATEX = $(wildcard *.tex)
PDF = $(patsubst %.tex, %.pdf, $(LATEX))
ARCHIVE = project.zip

all : $(PDF)

%.pdf : %.tex
	latexmk -bibtex -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<

$(ARCHIVE) : Makefile $(LATEX)
	zip $@ $^

wordcount : $(TEX)
	texcount $(TEX)

clean :
	latexmk -C
	rm -f $(ARCHIVE)
