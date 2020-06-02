#!/bin/sh
# script to build static website for Mac
# build items.toml config file for Hugo static website

Rscript _build_local.R

cd site/
hugo
cd ..

# Tree of the directories.
echo "------------------------------------------------------------------------"
echo "Directory tree.\n"
tree -h -F docs/ -L 1
# tree -h -F _site/slides
# tree -h -F _site/scripts
# tree -h -F _site/tutorials

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
# echo ${machine}
if [ ${machine} = Linux ];then
    # echo Linux rulez
    firefox docs/index.html
elif [ ${machine} = Mac ];then    
    # echo Mac rulez
    # Mac open firefox from terminal https://superuser.com/a/476852/653825
    open -a firefox docs/index.html
else 
    echo unknown
fi


