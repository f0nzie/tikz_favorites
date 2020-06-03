# Makefile to build a Hugo static website from TikZ code.
# To reproduce this work, download or clone this repository
# from https://github.com/f0nzie/tikz_favorites.
# 
# Change the URL to your own repository in two files:
#	site/config.toml
# 	Example: Mine is set like this:
# 	baseurl = "https://f0nzie.github.io/tikz_favorites/"
# 
#	_build_site.R
#	Example: 
# 	'image = "https://github.com/f0nzie/tikz_favorites/raw/master/src/%s.png"',	
#
# Compile PDFs and PNGs with:
#	make all
#
# Build a website to be published via GitHub Pages with:
#	make siteremote
#
# Build a local website with local links in your computer:
#	make sitelocal

compile PDFs, PNGs from TikZ code
# using folder src/texmf to save .sty .cls files
export TEXINPUTS:=.:./texmf:~/texmf:src/texmf:${TEXINPUT$}
# common
PKGSRC  := $(shell basename `pwd`)
SITE_DIR    = site
PUBLISH_DIR = docs
SOURCE_DIR  = src
TIKZ_LIBS = code.tex
TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)
TIKZ_FILES_ALL = $(wildcard $(SOURCE_DIR)/*.tex)
# files that need to be compiled with lualatex
TIKZ_LUALATEX = $(wildcard $(SOURCE_DIR)/*.lualatex.tex)
PDF_LUALATEX = $(addsuffix .pdf, $(basename $(TIKZ_LUALATEX)))
PNG_LUALATEX = $(TIKZ_LUALATEX:.tex=.png)
# files to be compiled with pdflatex
TIKZ_FILES = $(filter-out $(TIKZ_LUALATEX) $(TIKZ_LIBS), $(TIKZ_FILES_ALL))
PNG_FILES = $(TIKZ_FILES:.tex=.png)
PDF_FILES = $(addsuffix .pdf, $(basename $(TIKZ_FILES)))


all: $(PDF_FILES) $(PNG_FILES) $(PDF_LUALATEX) $(PNG_LUALATEX)

# rules for .tex files to be compiled with pdflatex
%.pdf: %.tex
	@pdflatex -interaction=batchmode -halt-on-error \
		-output-directory $(SOURCE_DIR) $<  > /dev/null 2>&1
	@printf "`du -sh $@` <- \n"
	
%.png: %.pdf
	@gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$@ -dNOPAUSE -r1200 $<
	@printf "`du -sh $@` <- \n"

# end of peflatex -----


# these three rules are for .tex files to be compiled with lualatex
.PHONY: lualatex
lualatex: $(PDF_LUALATEX) $(PNG_LUALATEX)

$(PDF_LUALATEX): src/%.lualatex.pdf: src/%.lualatex.tex
	@cd src && \
		lualatex -synctex=1 -interaction=nonstopmode $(<F)  > /dev/null 2>&1
	@printf "`du -sh $@` <- \n"

$(PNG_LUALATEX): src/%.lualatex.png: src/%.lualatex.pdf
	@cd src && \
		gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$(@F) -dNOPAUSE -r1200 $(<F)
	@printf "`du -sh $@` <- \n"

# end of rules for lualatex ------


# generate Hugo static website with GitHub links		
.PHONY: siteremote
siteremote: 	
	Rscript _build_site.R remote
	cd site && hugo
	tree -h -F docs/ -L 1
	open -a firefox docs/index.html

# generate Hugo static website with local links	
.PHONY: sitelocal
sitelocal: 	
	Rscript _build_site.R local
	cd site && hugo
	tree -h -F docs/ -L 1
	open -a firefox docs/index.html


# remove PNG and PDF files
.PHONY: clean
clean: tidy cleanlualatex
	find $(SOURCE_DIR) -maxdepth 1 -name \*.png -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.pdf -delete

# remove byproducts	
.PHONY: tidy
tidy: chrono
	find $(SOURCE_DIR) -maxdepth 1 -name \*.log -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.aux -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.out -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.gz -delete
	@# remove counter_file if exists
	if [ -f "$(SOURCE_DIR)/counter_file" ]; then \
        rm  $(SOURCE_DIR)/counter_file; \
    fi \

.PHONY: cleanlualatex
cleanlualatex: tidylualatex
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.png -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.pdf -delete

.PHONY: tidylualatex
tidylualatex:
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.log -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.aux -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.out -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.lualatex.synctex.gz -delete
	
chrono:
	find $(SOURCE_DIR) -name \*.snm -delete
	find $(SOURCE_DIR) -name \*.toc -delete
	find $(SOURCE_DIR) -name \*.nav -delete

tikz_list:
	@cd $(SOURCE_DIR) && \
		echo `pwd` && \
		find . -name \*.tex	

showlua:
	@echo $(TIKZ_LUALATEX)
	@echo $(PDF_LUALATEX)
	@echo $(PNG_LUALATEX)
	
info:
	@echo $PKGSRC
	@echo $(TIKZ_LIBS)
	@echo $(TIKZ_FILES_ALL)

