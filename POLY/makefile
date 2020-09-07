all:
		pdflatex --shell-escape poly-2020.tex
		bibtex poly-2020
		pdflatex --shell-escape poly-2020.tex
		pdflatex --shell-escape poly-2020.tex
clean:
	rm -rf *.mtc* *.aux *.log *.maf
