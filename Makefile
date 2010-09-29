# A very stupid makefile xD

auxfiles = $(shell find . -name '*\.aux')
tocfiles = $(shell find . -name '*\.toc')
logfiles = $(shell find . -name '*\.log')

# Not stop on errors.
texflags = -interaction=nonstopmode

# Uncomment to supress the fu***** pdflatex command.
quiet = yes

ifdef quiet
texflags += > /dev/null
endif 


.PHONY = all clean

all : InformeALAMBRIN.pdf ModeloE-R/ModeloE-R.pdf ModeloE-R/ModeloE-R.png

InformeALAMBRIN.pdf : InformeALAMBRIN.tex ModeloE-R/ModeloE-R.png
	pdflatex $(texflags) InformeALAMBRIN.tex
	pdflatex $(texflags) InformeALAMBRIN.tex

ModeloE-R/ModeloE-R.pdf : ModeloE-R/ModeloE-R.tex
	cd ModeloE-R ; pdflatex $(texflags) ModeloE-R.tex ; cd ..

ModeloE-R/ModeloE-R.png : ModeloE-R/ModeloE-R.pdf
	convert ModeloE-R/ModeloE-R.pdf ModeloE-R/ModeloE-R.png

	
clean :
	@rm -vf $(auxfiles) $(tocfiles) $(logfiles) 
	@rm -vf InformeALAMBRIN.pdf ModeloE-R/ModeloE-R.pdf ModeloE-R/ModeloE-R.png
