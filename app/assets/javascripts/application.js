//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
$(function(){

  var promo = 1; // change to your own promo id
  var baseUrl = "https://wagon-chat.herokuapp.com/";

  $('#submit-comment').click(function(e) {
    console.log(e);
    e.preventDefault();
    addComment($('#your-message').val(), $("#your-name").val());
    // $('#messages-list').prepend(line);
  });

  $('#refresh').click(function(e) {
    loadComments();
  });
  // Your turn to code!

});


function addComment(message, sender) {
  var data = { author: sender, content: message }

  $.ajax({
    type: "POST",
    url: "https://wagon-chat.herokuapp.com/55/comments",
    data: data,
    success: function(response) {
      // var line = concatMessage($('#your-message').val(), $("#your-name").val());
      // $('#messages-list').prepend(line);
      console.log("200 OK");
      console.log(response);
    },
    error: function(jqXHR) {
      console.log(jqXHR.responseText);
      console.log(jqXHR);
    }
  });
}


function loadComments() {

  $.ajax({
    type: "GET",
    url: "https://wagon-chat.herokuapp.com/55/comments",
    success: function(data) {
      $('#messages-list').empty();
      data.forEach(function(message) {
        var line = concatMessage(message.author, message.content, message.created_at);
        $('#messages-list').prepend(line);
      });
    },
    error: function(jqXHR) {
      console.log(jqXHR.responseText);
    }
  });

}

function concatMessage(author, content, created_at) {
  var line = "<li>" + content + " (posted <span class='date'>" + created_at + "</span>) by " + author + "</li>";
  return line;
}

