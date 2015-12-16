#!/usr/bin/env Rscript
# add error handling and usage statement




library(jsonlite)
library(wordcloud)
library(tm)

document <- fromJSON(txt="../Entries/database.json")

document <- data.frame(document)

words <- Corpus (DataframeSource(document))

words <- tm_map(words, stripWhitespace)

words <- tm_map(words, removeWords, stopwords("english"))

badwords <- c("2015", "test", "beta", "tags","href")

words <- tm_map(words, removeWords, badwords)

jpeg("../Entries/libs/wordcloud.jpeg")
wordcloud(words, 
          scale=c(5,0.5), 
          max.words=100, 
          random.order=FALSE, 
          rot.per=0.35, 
          use.r.layout=FALSE, 
          colors=brewer.pal(8, "Dark2"))
dev.off()
system("convert ../Entries/libs/wordcloud.jpeg -trim ../Entries/libs/wordcloud_trim.jpeg")
system("rm ../Entries/libs/wordcloud.jpeg")
