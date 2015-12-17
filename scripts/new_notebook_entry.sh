#!/bin/bash
# add new .Rmd entries to notebook
# $new_notebook_entry.sh "your quoted! title goes here"
#
# To Do, add error handling to make sure that a quoted
# title is added, and provide usage statement
# 
# Requires node.js, lunr.js, and will need to 
# be modified if the notebook_toc.Rmd format is altered, or
# if the directory structure is modifeed
# 
 
 
set -e
set -u
set -o pipefail

if [[ "$#" -eq 0 ]]; then
       echo "Usage: $0 'Title of new Rmd document in quotes'"
       exit 1
fi


# change this variable to notebook working directory
#notedir="/Users/kriemo/Software/SciRNotebook"

# grab title and dates

d=$(date "+%m-%d-%Y")
de=$(date "+%B %d, %Y")
title=$(echo "${1}")

# Make new entry

echo -e '---
title: "'$de'" 
output: html_document 
--- 

#### Tags: '$title \
	> "/Entries/"$d"_entry.Rmd"

# append title dates and filename to notebook TOC entry

sed -i '' -e '/\#\ Lab\ Experiments/ a\
\ \ ['${d}' '"${title}"' ]('${d}'_entry.html)\
\ 
' /Entries/Notebook_toc.Rmd 

# Reindex lunr.js database

cd /Entries

echo '{
  "files": [' > database.json

echo "rebuilding JSON database"

for file in *.Rmd
do
  title=$(pcregrep -M "\-\-\-\ntitle:" $file | sed 1d | cut -c 8-)
  body=$(grep -v -e "---" -e "title:" -e "output: html_document" $file | \
       tr "/" " " | tr -c '[:alnum:] ' " ")
  preview=$(grep -v -e "---" -e "title:" -e "output: html_document" $file | \
       tr "/" " " | tr -c '[:alnum:] ' " " | cut -c 1-300)
  tags=$(grep -e "#### Tags:" $file | \
       tr "/" " " | tr -c '[:alnum:] ' " " | cut -c 12-)
  
echo '    {
      "title": '"${title}"',
      "body": "'"${body}"'",
      "preview": "'"${preview}"'",
      "href": "'"${file}"'",
      "tags": "'"${tags}"'"
    } ,' >> database.json
      
done

echo "finishing build of json database"

echo '    {
      "title": "dummy_entry",
      "body": "foo bar",
      "preview": "more foo than bar",
      "href": "../Notebook_toc.Rmd",
      "tags": "dummy_entry"
    }
    ]
}' >> database.json

cd js/

echo "indexing json database for lunr.js search"
node index.js

echo -n 'var jsonObject = ' | cat - lunr.json > temp.json
mv temp.json lunr.json

# open up the new RMarkdown files

open /Entries/"$d"_entry.Rmd" -a RStudio

open /Entries/Notebook_toc.Rmd" -a RStudio
