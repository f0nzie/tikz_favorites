PKGSRC  := $(shell basename `pwd`)

SITE_DIR    = site
PUBLISH_DIR = docs
SOURCE_DIR  = src
TIKZ_LIBS = code.tex
LUA_TIKZ = lualatex.tex
TIKZ_FILES := $(wildcard $(SOURCE_DIR)/*.tex)
TIKZ_FILES_ALL = $(wildcard $(SOURCE_DIR)/*.tex)
TIKZ_LUALATEX = $(wildcard $(SOURCE_DIR)/*.lualatex.tex)
TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)

PNG_FILES = $(TIKZ_FILES:.tex=.png)
PDF_FILES = $(TIKZ_FILES:.tex=.pdf)

info:
	@echo $PKGSRC;
	
PDFs = $(addsuffix .pdf, $(basename $(wildcard $(SOURCE_DIR)/*.tex)))

all: $(PDF_FILES) $(PNG_FILES)

%.pdf: %.tex
	@echo $<
	@pdflatex -interaction=batchmode -output-directory $(SOURCE_DIR) $<  > /dev/null 2>&1
	

%.png: %.pdf
	@echo $<
	gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$@ -dNOPAUSE -r1200 $<

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
	rm $(SOURCE_DIR)/counter_file

	
chrono:
	find $(SOURCE_DIR) -name \*.snm -delete
	find $(SOURCE_DIR) -name \*.toc -delete	


	
temp:
	@find $(SOURCE_DIR) -name *.log -print0 | xargs -0 -I{} echo {}
	#find $(SOURCE_DIR) -name $(LOG_FILES) -delete
	#ls src/*.log
	# find . -maxdepth 1  -name \*.tex -not -name "*.code.tex" \
# -not -name "*.lualatex.tex"  -print0 | xargs -0 -I{} ../pdflatexpng.sh {}


	