$(".upvote").on("click", function(event) {
  event.preventDefault();
  var urlID = $(this).attr("href");
  var delimeter = "/";
  var string = urlID;
  var splat = string.split(delimeter);
  var id = splat[2];

  $.ajax({
    type: "POST",
    url: "/api/v1/votes/upvote",
    dataType: "json",
    data: {
      review: {
        id: id
      }
    },
    success: function(response) {
      $("#vote-" + id).html(response);
    }
  });
  return false;
});

$(".downvote").on("click", function(event) {
  event.preventDefault();
  var urlID = $(this).attr("href");
  var delimeter = "/";
  var string = urlID;
  var splat = string.split(delimeter);
  var id = splat[2];
  $.ajax({
    type: "POST",
    url: "/api/v1/votes/downvote",
    dataType: "json",
    data: {
      review: {
        id: id
      }
    },
    success: function(response) {
      $("#vote-" + id).html(response);
    }
  });
  return false;
});
