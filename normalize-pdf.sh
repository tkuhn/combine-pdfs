#!/usr/bin/env bash

set -e

gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS="/ebook" -sOutputFile="$1.temp.pdf" "$1"

pdfjam --outfile "$1.temp2.pdf" --paper a4paper "$1.temp.pdf"

gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 \
  -dPDFSETTINGS="/ebook" -sOutputFile="$1.normalized.pdf" "$1.temp2.pdf"

rm "$1.temp.pdf"
rm "$1.temp2.pdf"
