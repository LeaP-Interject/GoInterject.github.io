---
description: Interject documentation search results
keywords: Search, Interject, documentation, manual, guide, reference, api
noratings: false
notoc: false
notags: false
title: "Docs search"
tree: false
sitemaps: false
---

<style type='text/css'>
#my-cse1 { all: initial !important; all: default !important; }
#my-cse1 table, #my-cse1 table tr, #my-cse1 table tr th, #my-cse1 table tr td, .gs-bidi-start-align { border: 0px !important; padding: 0px !important; line-height: initial !important; margin: 0px !important; }
.gs-snippet { margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important; color: #999}
.gs-webResult .gs-result .gs-no-results-result { padding: 10px !important; }
.gs-per-result-labels { display: none !important; }
.gsc-url-top, .gsc-thumbnail-inside, .gs-spelling { padding: 0px !important; }
.gcsc-branding { padding-right: 0px !important; }
.gsc-tabHeader.gsc-tabhActive, .gsc-tabsArea { border-color: #CCC !important; }
.gcs-input, #gsc-i-id1 { padding: 5px 5px 5px 5px !important; }
#gscb_a, .gscb_a { padding: 3px 0px 0px 0px !important;}
.gsc-control-cse, .gsc-control-cse-en { padding: 0px !important; }
.gsc-result-info { padding-bottom: 0px !important; }
.gsc-adBlock { display: none; }
</style>

<div id="glossaryMatch"></div>

<div id="my-cse1">
<script>
  (function() {
    var cx = '005534451279647379552:p216o8yqyva';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
  //console.log("googlecustomsearch completed");
</script>
<div markdown="0"><gcse:searchresults-only></gcse:searchresults-only></div>
</div>


<script defer>
  //console.log("Begin setTimeout Function");
setTimeout(function(){
  $(document).ready(function() {
    let searchTerm = decodeURI(queryString().q);
    if(searchTerm != 'undefined' && searchTerm != "") {
      //console.log("begin undefined searchTerm");
      //console.log(searchTerm)
      $("#st-search-input").val(searchTerm);
      $("#st-search-input").focus();
      // Update heading with term user searched for
      //console.log("middle undefined searchTerm");
      let currHeading = $("h1").text();
      $("h1").text(currHeading + " results for: " + searchTerm);
      //console.log(currHeading);
    }
  //console.log("document load");
  });
}, 1);
</script>
