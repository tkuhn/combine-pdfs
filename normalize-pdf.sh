#!/usr/bin/env bash

set -e

pdfjam --outfile "$1.2.pdf" --paper a4paper "$1"
convert "$1.2.pdf" "$1"
rm "$1.2.pdf"
