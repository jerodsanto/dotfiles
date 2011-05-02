// single item page
if (window.location.pathname === "/item") {
  var $wrapper    = $("center table:first");
  var $header     = $wrapper.find("tr:eq(0) td");
  var $submission = $wrapper.find("tr:eq(3) table:eq(0)").find("tr:eq(3) td:last");
  var $comments   = $wrapper.find("tr:eq(3) table:eq(1)");
  var $roots      = $comments.find("td img[width=0]").closest("tr").parent().closest("tr");


  // linkify submission text links
  $submission.html($submission.html().replace(/(https?:\/\/.*?)[\s|<]/g, function() {
    var terminator = arguments[0].charAt(arguments[0].length - 1);
    var url        = arguments[1];

    // I can't get the regex above to match a "." at the end of a url, but not inside the url
    // so here is a cheap hack to work around my incompetency
    if (url.match(/\.$/)) {
      url        = url.replace(/\.$/, "");
      terminator = "." + terminator;
    }
    return "<a href='" +url + "' target='_blank'>" + url + "</a>" + terminator;
  }));

  // thread folding
  $roots.each(function(index) {
    $(this)
      .addClass("root")
        .find(".comhead")
        .append(" <a href='javascript:void(0);' class='fold'>[-]</a>");
  });

  $("a.fold").toggle(function() {
    $(this)
      .closest("tr.root")
        .nextUntil(".root")
        .hide()
      .end()
    .end().html("[+]");
  }, function() {
    var $anchor = $(this);
    $(this)
      .closest("tr.root")
        .nextUntil(".root")
        .show()
      .end()
    .end().html("[-]");
  });
}
