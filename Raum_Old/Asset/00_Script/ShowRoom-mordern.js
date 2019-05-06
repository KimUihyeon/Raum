// JavaScript Document
$(function(){
	var $showRoomItem=$('.showRoomItem');
	$showRoomItem.each(function(index, element) {
        $(this).on('mouseover', function(){
			$(this).find(' .ItemInfoBackground').animate({top:"0"},500);
			$(this).find(' .ItemInfo').css({display:"block"}).delay(600).animate({opacity:1},200);
			
			var $item_button=$('.item_button');
			$item_button.on('mouseover', function(){
				$item_button.css({opacity:1});
			});
			$item_button.on('mouseleave', function(){
				$item_button.css({opacity:0.8});
			});
			
		});
    });
	
	$showRoomItem.each(function(index, element) {
        $(this).on('mouseleave', function(){
			$(this).find(' .ItemInfo').stop(true).css({display:"none"}).animate({opacity:0},1);//.delay(500).animate({opacity:0},500);
			$(this).find(' .ItemInfoBackground').stop(true).animate({top:"-100%"},500);
		});
    });
	
});