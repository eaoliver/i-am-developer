all: cv letter

cv: 
	xelatex --shell-escape -halt-on-error -file-line-error curriculum_vitae && xelatex --shell-escape curriculum_vitae && xelatex --shell-escape curriculum_vitae

letter:
	xelatex --shell-escape -halt-on-error -file-line-error cover_letter && xelatex --shell-escape cover_letter && xelatex --shell-escape cover_letter

clean:
	rm -rf *.log *.pdf *.ps *.dvi *.aux *.out *.bcf *.bbl *.blg *.fls *.xml svg-inkscape/

