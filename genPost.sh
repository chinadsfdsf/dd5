#!/bin/bash


bb1=20190701.md
bb2=img/portfolio/a4-paper.jpg
bb3=2019-12-01
bb4=scripts.Hugo/content/blog/post2

rm -fr ${bb4}/*

for aa1 in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19
#for aa1 in 01 19
do
for aa2 in 01 02 03 04 05 06 07 08 09 10 11 12 
#for aa2 in 01 12
do
for aa3 in 01 02 07 08 13 14 21 22 27 28
#for aa3 in 02 07
do

    dd1=20${aa1}-${aa2}-${aa3}
    dd2=blog/post2/20${aa1}/${aa2}/${aa3}
    dd3=scripts.Hugo/content/${dd2}
    ff11=${dd3}/${dd1}.md
    ff12=${dd2}/${dd1}.md
    ff21=${dd3}/${dd1}.jpg
    ff22=${dd2}/${dd1}.jpg

    mkdir -p ${dd3}


    cat ${bb1} \
        | sed \
        -e "s;${bb3};${dd1};g" \
        -e "s;${bb2};/${ff22};g" \
        -e "s;jpgJPGjpgHere;![/${ff22}](/${ff22});g" \
        -e "s;categoriesTravel;20${aa1}/;g" \
        > ${ff11}

    convert \
    -background lightblue  -fill blue  -pointsize 20 \
    label:"\n\n*        JPG:    News On ${dd1}      *\n\n*        ${ff12}        *\n\n*        ${ff22}        *\n\n" \
    -page 400x400 \
    ${ff21}

#    convert -background  lightblue  -fill blue  -pointsize 48 \
#            text:-    -trim +repage  -bordercolor lightblue  -border 30 \

done
done
done
