#!/bin/sh
# script to build multiple PDF and PNG files 
# Will execute custom script `pdflatexpng.sh`

cd src/    # change to where tex files are

# remove auxiliary files
  rm *.pdf *.png *.gz
  rm *.aux *.log  *.nav *.out *.pnm

# iterate through all .tex files (w/some exceptions). 
# execute custom script "pdflatexpng.sh"
  echo 0 > counter_file
  find . -maxdepth 1  -name \*.tex -not -name "*.code.tex" -not -name "*.lualatex.tex"  -print0 | xargs -0 -I{} ../pdflatexpng.sh {}
  # Explanation:
  # xargs -0 -I{} ../pdflatexpng {}  run pdfltexpng for each .tex file
  # `pdflatexpng.sh` located in the project root folder
  # TODO: build PDF and PNG for LuaLatex

cd ..      # go back to project folder

# deploy website
./_deploy.sh

# reset counter
echo 0 > counter_file
count=0