# Makefile to build a Hugo static website from TikZ code using R.

#
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
#	make website remote
#
# To make website deployment  easier for everyone, I am using the docs/
# folder for publishing. Once you pushed your local changes, you
# have to activate GitHub Pages from the repo settings.
#
# Build a local website with local links in your computer:
#	make website local
#
# This has been tested with Mac and Linux
#
#
# This Makefile
#
# Using folder "src/texmf" to save .sty .cls files. Indicate that with:
#
# 	export TEXINPUTS:=.:./texmf:~/texmf:src/texmf:${TEXINPUT$}
#
# But this requires manually setting "texmf" in the machine. So we are leaving open
# the possibility of the user placing libraries, styles and classes in the same
# folder "src/" using these three lines:
#
#   TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)
# 	TIKZ_FILES_ALL_ = $(wildcard $(SOURCE_DIR)/*.tex)
# 	TIKZ_FILES_ALL  = $(filter-out $(TIKZ_LIBS), $(TIKZ_FILES_ALL_))
#
# Files that are libraries such as "tikzlibraryunitcircle.code.tex" are not
# included in the compilation.
#
# Since we are naming TikZ files to be compiled with "lualatex", we are filtering
# those files with
#
# 	TIKZ_LUALATEX = $(filter %.lualatex.tex, $(TIKZ_FILES_ALL))
# 	TIKZ_LATEX = $(filter-out  $(TIKZ_LUALATEX), $(TIKZ_FILES_ALL))
#
# To be able to generate the website you need "Hugo". This can be downloaded
# and istalled manually. Also the R package "blogdown" can be use used to
# download and install "Hugo" automatically. Just be sure that the "hugo.exe"
# is installed in a folder that is in the PATH. It is recommended that you 
# put "hugo.exe" in a folder "/Users/user/bin", or "home/user/bin" and then 
# add that folder to the computer PATH.
#
# Must have software:
#	LaTeX, TeX compiler
#	R, Rtools
# Linux and Mac OSX:
#	texlive
# Windows:
#	MixTeX
#
# Other useful sofware to install (optional):
# All operating systems:
# 	TexStudio
#	Texmaker
#	VS Code
#	Firefox
# Linux:
# 	tree
# Windows:
#	Git for Windows. Set "Bash" as default terminal in "vscode"
# 
export TEXINPUTS:=.:./texmf:~/texmf:src/texmf:${TEXINPUT$}
UNAME_S = $(shell uname -s)
PKGSRC  := $(shell basename `pwd`)
SOURCE_DIR  = src
OUTPUT_DIR = out
PUBLISH_DIR := docs
README = README.md
TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)
TIKZ_FILES_ALL_ = $(wildcard $(SOURCE_DIR)/*.tex)
TIKZ_FILES_ALL  = $(filter-out $(TIKZ_LIBS), $(TIKZ_FILES_ALL_))
TIKZ_LUALATEX = $(filter %.lualatex.tex, $(TIKZ_FILES_ALL))
TIKZ_LATEX = $(filter-out  $(TIKZ_LUALATEX), $(TIKZ_FILES_ALL))
PDF_LUALATEX = $(addprefix out/, $(addsuffix .pdf, $(basename  $(notdir $(TIKZ_LUALATEX) ))))  
PNG_LUALATEX = $(addprefix out/, $(addsuffix .png, $(basename  $(notdir $(TIKZ_LUALATEX) )))) 
PDF_LATEX = $(addprefix out/, $(addsuffix .pdf, $(basename  $(notdir $(TIKZ_LATEX) ))))  
PNG_LATEX = $(addprefix out/, $(addsuffix .png, $(basename  $(notdir $(TIKZ_LATEX) )))) 
# Detect operating system. Sort of tricky for Windows because of MSYS, cygwin, MGWIN
OSFLAG :=
ifeq ($(OS), Windows_NT)
	OSFLAG = WINDOWS
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S), Linux)
		OSFLAG = LINUX
	endif
	ifeq ($(UNAME_S), Darwin)
		OSFLAG = OSX
	endif
endif


.PHONY: all
all:  $(PDF_LUALATEX) $(PDF_LATEX) $(PNG_LUALATEX)  $(PNG_LATEX) $(README)

# rules for .tex files to be compiled with pdflatex
out/%.pdf:: src/%.tex msg_pdf_files
	@if test $(findstring .lualatex.tex, $<); then \
		cd $(SOURCE_DIR) && \
			lualatex --synctex=1 --output-directory=../$(OUTPUT_DIR) --interaction=batchmode $(<F)  > /dev/null 2>&1; \
	else \
		cd $(SOURCE_DIR) && \
			pdflatex --interaction=batchmode -halt-on-error -output-directory ../$(OUTPUT_DIR) $(<F)  > /dev/null 2>&1; \
	fi; 
	@printf "`du -sh $@` <- \n"

# here we check for the operating system. ghostscript to be used in Mac
out/%.png:: out/%.pdf msg_png_files
	@if test $(OSFLAG) = OSX; then \
		gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$@ -dNOPAUSE -r1200 $<; \
	else \
		cd $(OUTPUT_DIR) && pdftoppm -q -png $(<F) > $(@F); \
	fi; 
	@printf "`du -sh $@` <- \n"

# one-time mesage
.INTERMEDIATE: msg_pdf_files
msg_pdf_files:
	$(info generating pdf files)

.INTERMEDIATE: msg_png_files
msg_png_files:
	@printf "\n generating .png files \n"


# render the README file
$(README): $(addsuffix .Rmd, $(basename $(README))) $(PDF_LUALATEX) $(PDF_LATEX) $(PNG_LUALATEX) $(PNG_LATEX) 
	Rscript -e "rmarkdown::render('$<')"
	@echo "Operating system is:" $(OSFLAG)
ifeq ($(OSFLAG), OSX)		
	@open -a firefox $(addsuffix .html, $(basename $(README)))
endif
ifeq ($(OSFLAG), LINUX)
	@firefox $(addsuffix .html, $(basename $(README)))
endif	
ifeq ($(OSFLAG), WINDOWS)
	@"C:\Program Files\Mozilla Firefox\firefox.exe" $(addsuffix .html, $(basename $(README)))
endif


# simplify the website construction with one rule
website:
	@echo "\nGenerating Hugo website as " $(word 2, $(MAKECMDGOALS))
	@echo "Operating system is" $(OSFLAG)
	Rscript _build_site.R $(word 2, $(MAKECMDGOALS))
	@cd site && hugo
	@# TODO: what happens if "tree" is not installed in Linux. Windows has its own "tree".
	@tree -h -F docs/ -L 1
ifeq ($(OSFLAG), OSX)	
	@open -a firefox  $(PUBLISH_DIR)/index.html
endif
ifeq ($(OSFLAG), LINUX)
	@firefox  $(PUBLISH_DIR)/index.html
endif	
ifeq ($(OSFLAG), WINDOWS)
	@"C:\Program Files\Mozilla Firefox\firefox" $(PUBLISH_DIR)/index.html
endif


# remove PNG and PDF files
.PHONY: clean
clean: tidy cleanlualatex
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.png -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.pdf -delete


# remove byproducts	
.PHONY: tidy
tidy: chrono
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.log -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.aux -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.out -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.gz -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.snm -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.toc -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.nav -delete
	if [ -f "$(README)" ]; then \
        rm  $(README); \
    fi

.PHONY: cleansource
cleansource:
	find $(SOURCE_DIR) -maxdepth 1 -name \*.png -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.pdf -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.log -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.aux -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.out -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.gz -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.snm -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.toc -delete
	find $(SOURCE_DIR) -maxdepth 1 -name \*.nav -delete

.PHONY: cleanlualatex
cleanlualatex: tidylualatex
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.png -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.pdf -delete

# for testing
.PHONY: cleanpdflatex
cleanpdflatex:
	find $(OUTPUT_DIR) -maxdepth 1 -name \physics-*.png -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \physics-*.pdf -delete


.PHONY: tidylualatex
tidylualatex:
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.log -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.aux -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.out -delete
	find $(OUTPUT_DIR) -maxdepth 1 -name \*.lualatex.synctex.gz -delete
	
chrono:
	find $(OUTPUT_DIR) -name \*.snm -delete
	find $(OUTPUT_DIR) -name \*.toc -delete
	find $(OUTPUT_DIR) -name \*.nav -delete

tikz_list:
	@cd $(SOURCE_DIR) && \
		echo `pwd` && \
		find . -name \*.tex	


.PHONY: info
info:
	@echo $(words $(TIKZ_LIBS))
	@echo $(words $(TIKZ_FILES_ALL_))
	@echo $(words $(TIKZ_FILES_ALL))
	@echo $(words $(TIKZ_LATEX)) 
	@echo $(words $(TIKZ_LUALATEX)) 
	@echo $(TIKZ_LIBS)



.PHONY: getos
getos:
	@# Testing different ways of detecting the OS
	@echo "OS is:" $(OSFLAG)
	@# these two are equivalent
	@echo "Number of words in OS env var:" $(words $(OS))
	@if [ $(words $(findstring $(OS),)) = 0 ]; then \
		echo "OS does not return empty string means OS env filled by WINDOWS"; \
	else \
		echo "OS env variable returns empty string"; \
	fi
	@if [  $(words $(OS)) -gt 0 ]; then echo "OS env word count it is greater than zero, means it is WINDOWS"; fi
# Using pre-processor
ifneq (0,$(words $(findstring $(OS),)))
	@echo "Not Windows"
else
	@echo "Word count of OS not zero, then it is WINDOWS"
endif
	@# Using if
	@if [ "$(findstring $(OS), Windows_NT)" != "" ]; then echo "OS returns Windows_NT, not an empty string"; fi
	@# using test
	@if test $(findstring $(OS), Windows_NT) ; then echo "WINDOWS passed the test"; fi;
	@if test $(findstring $(OSFLAG), WINDOWS); then echo "findstring of OSFLAG found WINDOWS"; fi
	@if test $(OSFLAG) = WINDOWS; then echo "OSFLAG is WINDOWS"; fi
	@if test $(findstring $(OSFLAG), OSX); then echo "it is a Mac"; fi	


%:
	@:


# to debug Makefile from the command line
# Source: https://www.cmcrossroads.com/article/printing-value-makefile-variable
print-%  : ; @echo $* = $($*)

# TODO: read values from site/config.toml file 
# TODO: use R to read .toml parameters and values
# Use the following for some debugging:
	# @make print-TIKZ_FILES
	# @make print-TIKZ_LUALATEX
	# @echo $PKGSRC
	# @echo $(PDF_LUALATEX)
	# @echo $(PNG_LUALATEX)
	# @echo $(PDF_LATEX)
	# @echo $(PNG_LATEX)