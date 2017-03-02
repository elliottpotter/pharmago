$(function(){
  $('#switch').click(function(){
    switchDriver();
  });

});


function switchDriver() {
  $.ajax({
    type:'GET',
    url:'/drivers/switch',
    success:function(){
      console.log("Done");
    }
    });
  }
