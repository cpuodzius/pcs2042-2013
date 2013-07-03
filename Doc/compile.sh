if [ -f Relatorio_fase$1.pdf ]; then
	rm Relatorio_fase$1.pdf
fi
if [ -f Relatorio_fase$1.out ]; then
	rm Relatorio_fase$1.out
fi
if [ -f Relatorio_fase$1.log ]; then
	rm Relatorio_fase$1.log
fi
if [ -f Relatorio_fase$1.aux ]; then
	rm Relatorio_fase$1.aux
fi
if [ -f Relatorio_fase$1.toc ]; then
	rm Relatorio_fase$1.toc
fi
pdflatex -aux-directory=./log -output-directory=log Relatorio_fase$1.tex
if [ -f Relatorio_fase$1.pdf ]; then
		mv log/Relatorio_fase$1.pdf Relatorios
fi
bibtex -aux-directory=./log -output-directory=log fase$1.tex
bibtex log/Relatorio_fase$1.aux
pdflatex -aux-directory=./log -output-directory=log Relatorio_fase$1.tex
pdflatex -aux-directory=./log -output-directory=log Relatorio_fase$1.tex
if [ -f log/Relatorio_fase$1.pdf ]; then
		mv log/Relatorio_fase$1.pdf Relatorios
fi
