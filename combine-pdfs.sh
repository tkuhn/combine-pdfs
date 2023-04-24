#!/usr/bin/env bash

declare -a files del
i=1
cd files
for file in *.normalized.pdf
do  echo -e '.ft H\n.ps 20\n.vs 35\n.sp 10c\n.ce\n'"${file%.pdf.normalized.pdf}" |
    groff -Tps | 
    ps2pdf - - >/tmp/title$i.pdf
    files+=(/tmp/title$i.pdf "$file")
    del+=(/tmp/title$i.pdf)
    let i=i+1
done
pdfconcat -o /tmp/out.pdf "${files[@]}"
rm ${del[@]}
cd ..
cp /tmp/out.pdf combined.pdf
