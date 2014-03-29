TARGET = overview
BIB = references

LATEX = pdflatex
BIBTEX = bibtex
VIEWER = evince

default: $(TARGET).pdf
	@echo all ready

all: clean default view

%.pdf: %.tex %.bbl
	@echo Rule for pdf
	$(LATEX) -file-line-error -halt-on-error $<  
	$(LATEX) -file-line-error -halt-on-error $<  

%.bbl: %.aux
	@echo Rule for bbl
	$(BIBTEX) $*

%.aux: %.tex
	@echo Rule for aux
	$(LATEX) -file-line-error -halt-on-error $<

view:
	$(VIEWER) $(TARGET).pdf &  	

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.bbl
	rm -f *.dvi
	rm -f *.out
	rm -f *.blg
	rm -f *~
	rm -f $(TARGET).ps
	rm -f $(TARGET).pdf



