#!/bin/bash
# render .Rmd to .Html
# add usage statement and error handling
# 
# requires Knitr and R


set -e
set -u
set -o pipefail

if [[ "$#" -eq 0 ]]; then
       echo "Usage: $0 Markdown_document.Rmd"
       exit 1
fi

input_file="$1"

echo "rendering "$input_file "to Html"

Rscript --vanilla -e "rmarkdown::render('$input_file', quiet = T)"

