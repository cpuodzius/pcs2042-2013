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
if [ -f log/Relatorio_fase$1.out ]; then
	rm log/Relatorio_fase$1.out
fi
if [ -f log/Relatorio_fase$1.log ]; then
	rm log/Relatorio_fase$1.log
fi
if [ -f log/Relatorio_fase$1.aux ]; then
	rm log/Relatorio_fase$1.aux
fi
if [ -f log/Relatorio_fase$1.toc ]; then
	rm log/Relatorio_fase$1.toc
fi
pdflatex Relatorio_fase$1.tex
if [ -f Relatorio_fase$1.out ]; then
	mv Relatorio_fase$1.out log
fi
if [ -f Relatorio_fase$1.log ]; then
	mv Relatorio_fase$1.log log
fi
if [ -f Relatorio_fase$1.aux ]; then
	mv Relatorio_fase$1.aux log
fi
if [ -f Relatorio_fase$1.toc ]; then
	mv Relatorio_fase$1.toc log
fi
if [ -f Relatorio_fase$1.pdf ]; then
		mv Relatorio_fase$1.pdf Relatorios
fi
