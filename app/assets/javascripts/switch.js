$(function(){
  $('#switch').click(function(){
    switchDriver();
  });

});

// define functions below
function switchDriver() {
  $.ajax({
    type:'GET',
    url:'/drivers/switch',
    success:function(){
      console.log("Done");
    }
    });
  }
