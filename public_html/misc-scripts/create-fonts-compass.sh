#!/bin/sh
#find . -iname "*" -exec rename "s/ *//g" {} \; #remove white spaces

echo "@import \"compass/css3\""

fontList="allFonts=( "
rootDir="../fonts/"

for fName in $(find . -type f -name '*.ttf' -or -name '*.otf' | sed s/^..//g)
do
    fNameTrans=$(echo "$fName" | tr "/" "_")
    echo "@include font-face(\"${fNameTrans%.*}\", font-files(\"$rootDir$fName\"))"
    fontList=$fontList"\""${fNameTrans%.*}"\" ,"
done

fontList=$fontList")"
echo $fontList

