export TEXINPUTS:=.:./texmf:~/texmf:src/texmf:${TEXINPUT$}

PKGSRC  := $(shell basename `pwd`)

SITE_DIR    = site
PUBLISH_DIR = docs
SOURCE_DIR  = src
TIKZ_LIBS = code.tex
TIKZ_FILES_ALL = $(wildcard $(SOURCE_DIR)/*.tex)
TIKZ_LUALATEX = $(wildcard $(SOURCE_DIR)/*.lualatex.tex)
TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)
TIKZ_FILES = $(filter-out $(TIKZ_LUALATEX) $(TIKZ_LIBS), $(TIKZ_FILES_ALL))

PNG_FILES = $(TIKZ_FILES:.tex=.png)
PDF_FILES = $(addsuffix .pdf, $(basename $(TIKZ_FILES)))

showlua:
	@echo $(TIKZ_LUALATEX)

showlibs:
	@echo $(TIKZ_LIBS)

info:
	@echo $PKGSRC;
	
PDF_FILES = $(addsuffix .pdf, $(basename $(TIKZ_FILES)))

all: $(PDF_FILES) $(PNG_FILES)

%.pdf: %.tex
	@echo $<
	@pdflatex -interaction=batchmode -halt-on-error \
		-output-directory $(SOURCE_DIR) $<  > /dev/null 2>&1
	

%.png: %.pdf
	@echo $<
	@gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$@ -dNOPAUSE -r1200 $<
	
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
	
	
.PHONY: siteremote
siteremote: 	
	Rscript _build_site.R remote
	cd site && hugo
	tree -h -F docs/ -L 1
	open -a firefox docs/index.html
	
.PHONY: sitelocal
sitelocal: 	
	Rscript _build_site.R local
	cd site && hugo
	tree -h -F docs/ -L 1
	open -a firefox docs/index.html

# remove PNG and PDF files
.PHONY: clean
clean: tidy 
	find $(SOURCE_DIR) -maxdepth 1 -name \*.png -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.pdf -delete


tikz_list:
	cd $(SOURCE_DIR) && \
		echo `pwd` && \
		find . -name \*.tex
	

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

	
chrono:
	find $(SOURCE_DIR) -name \*.snm -delete
	find $(SOURCE_DIR) -name \*.toc -delete
	find $(SOURCE_DIR) -name \*.nav -delete


	


	