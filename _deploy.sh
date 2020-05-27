#!/bin/sh


# build PNG files. Execute my custom script pdflatexpng
cd src/    # change to where tex files are

# remove auxiliary files
rm *.pdf *.png *.gz
rm *.aux *.log  *.nav *.out *.pnm

# execute custom script
find . -maxdepth 1  -name \*.tex -not -name "*.code.tex" -not -name "*.lualatex.tex"  -print0 | xargs -0 -I{} pdflatexpng {}
cd ..      # go back

# build items.toml config file for Hugo static website
Rscript _build.R

cd site/
hugo

# Tree of the directories.
echo "------------------------------------------------------------------------"
echo "Directory tree.\n"
tree -h -F public/ -L 1
# tree -h -F _site/slides
# tree -h -F _site/scripts
# tree -h -F _site/tutorials

firefox public/index.html

