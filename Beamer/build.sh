#!/bin/bash
mkdir -p build

pdflatex main.tex
latexmk -c main.tex
mv main.pdf build