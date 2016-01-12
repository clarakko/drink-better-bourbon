// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .



// $(function(){ $(document).foundation(); });
//   $('.upvote').on('click', function(event) {
//     event.preventDefault();
//     var url = $(this).attr('href');
//     var delimeter = '/';
//     var string = url;
//     var splitted = string.split(delimeter);
//     var id = splitted[2];
//
//     var request = $.ajax({
//       type: 'POST',
//       url: url,
//       dataType: 'json',
//       success: function(response) {
//         $('#vote-' + id).html("<li>" + response + "</li>");
//       }
//     });
//   });

  // $('.downvote').on('click', function(event) {
  //   event.preventDefault();
  //   var url = $(this).attr('href');
  //   var delimeter = '/';
  //   var string = url;
  //   var splitted = string.split(delimeter);
  //   var id = splitted[2];
  //   $.ajax({
  //     type: 'POST',
  //     url: url,
  //     dataType: 'json',
  //     success: function(response) {
  //       $('#vote-' + id).html("<li>" + response + "</li>");
  //     }
  //   });
  // });


  $(function(){ $(document).foundation(); });


    $('.upvote').on('click', function(event) {
      event.preventDefault();
      var urlID = $(this).attr('href');
      var delimeter = '/';
      var string = urlID;
      var splitted = string.split(delimeter);
      var id = splitted[2];

      var request = $.ajax({
        type: 'POST',
        url: "/api/v1/votes/upvote",
        dataType: 'json',
        data: {
          review: {
            id: id
          }
        },
        success: function(response) {
          $('#vote-' + id).html("<li>" + response + "</li>");
        }
      });

      // request.done(function(response){
      //   $('#vote-' + id).html("<li>" + response + "</li>");
      // });
      return false;
    });

    $('.downvote').on('click', function(event) {
      event.preventDefault();
      var urlID = $(this).attr('href');
      var delimeter = '/';
      var string = urlID;
      var splitted = string.split(delimeter);
      var id = splitted[2];
      $.ajax({
        type: 'POST',
        url: "/api/v1/votes/downvote",
        dataType: 'json',
        data: {
          review: {
            id: id
          }
        },
        success: function(response) {
          $('#vote-' + id).html("<li>" + response + "</li>");
        }
      });
      return false;
    });
