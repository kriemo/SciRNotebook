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
  * indexing the lunr.js database requires [node.js](https://nodejs.org/en/)
  * [RMarkdown](http://rmarkdown.rstudio.com/) and [Knitr](http://yihui.name/knitr/)
  * [R](https://www.r-project.org/)
  * R packages [tm](https://cran.r-project.org/web/packages/tm/index.html) [jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html) [wordcloud](https://cran.r-project.org/web/packages/wordcloud/index.html) [pacman](https://cran.r-project.org/web/packages/pacman/index.html)
  * [imageMagick](http://imagemagick.org/script/index.php) (convert function)
  * Only tested on Mac OS 10.10 as of now
  
## Included packages
  * [jquery-1.11.0](http://jquery.com/)
  * [lunr.js](http://lunrjs.com/)
  * [bootstrap-3.3.1](https://github.com/twbs/bootstrap)
  * [font-awesome-4.1.0](https://fortawesome.github.io/Font-Awesome/)
  * [polyfill.js](https://philipwalton.github.io/polyfill/)

## Usage

#### Example notebook entry

```
cd SciRNotebook/Entries
```

Take a look at the Example.Rmd and Example.html files to see how to use markdown syntax to link html documents together and how to reference local data files. 

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
for file in Entries/*.Rmd
do echo $file
scripts/render_Rmarkdown_to_html.sh $file
done
```
Open up the Notebook_toc.html to navigate the notebook. Check out the coding links in the navbar to navigate to an example document. 

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

#### Customizing header navbar links
The html that controls the links in the navbar is located in the `Entries/include/before_header.html` file. Edit the "dummy links" included to link to .html files of interest. 

#### Wordcloud
A wordcloud is displayed on the Notebook_toc.html page. This wordcloud is derived from the database.json file used for indexing the lunr.js search. Words can be removed from the wordcloud by editing the wordcloud_generator.R script and adding words to the `badwords` variable. If you want to disable the wordcloud, remove the html code in lines 12-15 of the Entries/Notebook_toc.Rmd file.

## Credits
This format was mostly inspired by the RMarkdown documentation website. 

  
