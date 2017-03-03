$(function(){
  $('#order-claim').click(function(){
    claimOrder();
  });

});

// define functions below
function switchDriver() {
  $.ajax({
    type:'GET',
    url:'/orders/claim',
    success:function(){
      console.log("Done");
    }
  });
}
