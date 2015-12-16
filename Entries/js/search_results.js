
$(document).ready(function () {
    'use strict';
    // Set up search
    var index, store;

        // Create index
        index = lunr.Index.load(jsonObject.index);
        // Create store
        store = jsonObject.store;

  $('input#search').on('keyup', function () {
    var resultdiv = $('#results');
    // Get query
    var query = $(this).val();
    // Search for it
    var result = index.search(query);
    // Show results
    resultdiv.empty();
    // Add status
    resultdiv.prepend('<p class="">Found '+result.length+' result(s)</p>');
    // Loop through, match, and add results
    for (var item in result) {
      var ref = result[item].ref;
      var searchitem = '<li><a href="' + ref.replace("Rmd", "html") + '">' + store[ref].title + '</a></li></div><p>'+store[ref].tags +'</p><p>'+store[ref].preview +'</p></div>';
      resultdiv.append(searchitem);
    }
  });
});

