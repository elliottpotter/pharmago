//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.slick
//= require_tree .
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

$(function(){

  setTimeout(function(){
    $('.alert').slideUp( "slow", function() {
    });;
  }, 5000);

  $('.your-class').slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 5,
    centerMode: false,
    centerPadding: '0px',
    arrows: true
  });

  // $('.slick-arrow').addClass('fa').addClass('fa-arrow-right')


var $el = $(".fadeinwords:first"), text = $el.text(),
    words = text.split("|");


var html = "";
for (var i = 0; i < words.length; i++) {
    if(i < words.length - 1) {
      html += "<span style='color: grey; font-size: 60px;'>" + words[i] + " </span>";
    } else {
     html += '<a style="font-size: 60px; text-decoration: none; color: #86DBB8;" href="/orders/new">here</a>'
      // html += '<%= link_to "here", new_order_path %>'
    }

};
$el.html(html).children().hide().each(function(i){
  $(this).delay(i*700).fadeIn(1400);
});

});

