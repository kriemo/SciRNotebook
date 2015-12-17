---
title: "SciRNotebook"
author: "Kent Riemondy"
date: "12/16/2015"
output: 
html_document:
  theme: cosmo
  highlight: tango
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

#### Example notebook entry

```
cd SciRNotebook/Entries
```

Take a look at the Example.Rmd and Example.html files to see how 4to use markdown syntax to link html documents together and how to reference local data files. 

#### To add a new entry

```
cd SciRNotebook/
```

add your first entry to the Notebook_toc.Rmd document using the new_notebook_entry.sh script

``` 
scripts/new_notebook_entry.sh "my first entry"  
```

render the .Rmd documents Notebook_toc.Rmd and Search.Rmd to .html using knitr and the provided script render_Rmarkdown_to_html.sh 

```
scripts/render_Rmarkdown_to_html.sh Entries/Notebook_toc.Rmd  
scripts/render_Rmarkdown_to_html.sh Entries/Search.Rmd  
```
Open up the Notebook_toc.html to navigate the notebook.

#### Themes
To customize the outlook you can change the bootstrap theme. The current default is cosmo but you can change it to other themes.  

  * Available themes are default, cerulean, journal, flatly, readable, spacelab, united, cosmo  
  * Also can edit the text highlight scheme for syntax highlighting in the _output.yaml file  
  
To change the theme edit Entries/_output.yaml theme type to desired bootstrap theme in the following manner. 

Default _output.yaml with cosmo theme  
```
 html_document:
  self_contained: false
  theme: cosmo
  highlight: textmate
  lib_dir: libs
  includes:
    in_header: include/in_header.html
    before_body: include/before_body.html
```
_output.yaml with united theme  

```
 html_document:  
  self_contained: false  
  theme: united  
  highlight: textmate  
 lib_dir: libs  
  includes: 
    in_header: include/in_header.html  
    before_body: include/before_body.html  
```
#### Wordcloud
A wordcloud is displayed on the Notebook_toc.html page. This wordcloud is derived from teh database.json file used for indexing the lunr.js search. Words can be removed from the wordcloud by editing the wordcloud_generator.R script and adding words to the `badwords` variable. 

## Credits
This format was mostly inspired by the RMarkdown documentation website. 

  