//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery.slick
//= require_tree .

$(function(){

  setTimeout(function(){
    $('.alert').slideUp( "slow", function() {
    });;
  }, 5000);

  $('.your-class').slick({
    infinite: true,
    slidesToShow: 6,
    slidesToScroll: 6,
    centerMode: true,
    centerPadding: '0px',
    arrows: true
  });

  // $('.slick-arrow').addClass('fa').addClass('fa-arrow-right')

});

