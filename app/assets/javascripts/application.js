//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .
//= require jquery.slick

$(function(){

  setTimeout(function(){
    $('.alert').slideUp( "slow", function() {
  });;
  }, 5000);

  $(document).ready(function(){
    $('.slick-cards').slick({
    infinite: false,
    slidesToShow: 6,
    slidesToScroll: 6,
    centerPadding: '0px',
    arrows: true,
    });
    $('.slick-next').addClass('fa').addClass('fa-arrow-right')
    $('.slick-prev').addClass('fa').addClass('fa-arrow-left')
  });

});

