#/bin/sh
# generate PDF and PNG files in Linux or Mac
# It works for one file at a time. 
# For multiple files, run "allpdfpng.sh"

# count the number of times this was executed
< counter_file read counter
counter=$(( $counter + 1 ))
echo $counter > counter_file

file=$1
name=${file%.*}   # get the name of the file with no extension
echo $counter $file

# detect operating system
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
    [ ! -f $name.pdf ] && \
        pdflatex -interaction=batchmode $file > /dev/null 2>&1 && \
        du -sh $name.pdf
    pdftoppm -q -png $name.pdf > $name.png # https://superuser.com/a/185897/653825
elif [ ${machine} = Mac ];then    
    [ ! -f $name.pdf ] && \
        pdflatex -interaction=batchmode $file > /dev/null 2>&1 && \
        du -sh $name.pdf
    gs -q -sDEVICE=png256 -sBATCH -sOutputFile=$name.png -dNOPAUSE -r1200 $name.pdf
else 
    echo ${machine}
fi


du -sh $name.png   # returns file size and name of PNG

# rm $name.pdf   # will not include PDF files
rm $name.log  > /dev/null 2>&1 
rm $name.aux > /dev/null 2>&1 
