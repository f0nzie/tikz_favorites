#!/bin/sh
# script to build static website for Mac
# TODO: add if to open browser in any OS

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

# Open firefox from terminal https://superuser.com/a/476852/653825
open -a firefox public/index.html

