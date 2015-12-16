var lunr = require('./lunr.js'),
    fs = require('fs')

var idx = lunr(function () {
  this.ref('href')
  this.field('title')
  this.field('tags', { boost: 10 })
  this.field('body', { boost: 10 })
  this.field('preview')

})

fs.readFile('../database.json', function (err, data) {
  if (err) throw err

  var raw = JSON.parse(data)

  var questions = raw.files.map(function (q) {
    return {
      title: q.title,
      body: q.body,
      href: q.href,
      preview: q.preview,
      tags: q.tags
    }
  })

var store = {};

  questions.forEach(function (files) {
    store[files.href] = {
            'title': files.title,
            'preview': files.preview,
            'tags': files.tags
        }
    idx.add(files)
  })
  fs.writeFile('lunr.json', JSON.stringify({
        index: idx.toJSON(),
        store: store
    }), function (err) {
    if (err) throw err
    console.log('done')
  })
})

