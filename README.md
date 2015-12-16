---
title: "SciRNotebook"
author: "Kent Riemondy"
date: "12/16/2015"
output: 
html_document:
  theme: cosmo
  highlight: textmate
---


## An electronic Scientfic notebook format based on RMarkdown
  * Key Features
    - [lunr.js](http://lunrjs.com/) search feature
    - RMarkdown integration with local html web interface

## Requirements
  * indexing the lunr.js database requies [node.js](insert link here)
  * [RMarkdown](website) and [Knitr](website)
  * [R](website)
  * R packages tm jsonlite wordcloud
  * imageMagick (convert function)
  * Only tested on Mac OS 10.10 as of now
  
## Included packages
  * jquery-1.11.0
  * lunr.js
  * bootstrap-3.3.1
  * font-awesome-4.1.0
  * polyfill.js

## Usage
  * cd to SciRNotebook/ directory
  * edit new_notebook_entry.sh line X to list your installed (note use pwd to edit this automatically)
  * edit Entries/_output.yaml theme type to desired bootstrap theme
    - Available themes are default, cerulean, journal, flatly, readable, spacelab, united, cosmo
    - Also can edit the text highlight scheme for syntax highlighting in the _output.yaml file
    - The current _output.yaml uses cosmo
  * add your first entry to the Notebook_toc.Rmd document using the new_notebook_entry.sh script
    - scripts/new_notebook_entry.sh "my first entry"
  * render the .Rmd documents Notebook_toc.Rmd and Search.Rmd to .html using knitr and the provided script render_Rmarkdown_to_html.sh
    - scripts/render_Rmarkdown_to_html.sh Entries/Notebook_toc.Rmd
    - scripts/render_Rmarkdown_to_html.sh Entries/Search.Rmd
