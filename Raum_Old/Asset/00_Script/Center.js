// JavaScript Document
$(function(){
  var $Q= $('.Level-04-Item');
  var $A= $('.Level-04-DropItem');

  $Q.each(function(index){
    $(this).on('click',function(){
      $('.Text-A').addClass('Text-A-Ative');
      $(this).find(' .Text-A').removeClass('Text-A-Ative');
      $A.addClass('Drop-Active');
      $A.eq(index).removeClass('Drop-Active');
    })
  });


});
