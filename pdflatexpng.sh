#/bin/sh
# generate PDF and PNG files in a Mac
# the original file is in Linux machine ~/bin

file=$1
name=${file%.*}   # get the name of the file with no extension

echo $file

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
    echo Linux rulez
    pdflatex -interaction=batchmode $file > /dev/null 2>&1
    pdftoppm -q -png $name.pdf > $name.png # https://superuser.com/a/185897/653825
elif [ ${machine} = Mac ];then    
    echo Mac rulez
    pdflatex -interaction=batchmode $file > /dev/null 2>&1 && gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$name.png -dNOPAUSE -r1200 $name.pdf
else 
    echo unknown
fi


# ls -lh $name.png | cut -d " " -f14 -f10 # FIX sometimes doesn't return right column
du -sh $name.png   # returns file size and name of PNG

rm $name.pdf   # will not include PDF files
rm $name.log
rm $name.aux