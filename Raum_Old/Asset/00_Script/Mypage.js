// JavaScript Document
$(function(){
	
	var $section1Box=$('.section1Box');
	$section1Box.each(function(index, element) {
		$(this).on('mouseover', function(){
			$(this).find(' .section1ButtonBG').css({display:'block'});
			$(this).find(' .section1Button').css({opacity:1})
//			$(this).find(' .section1Button').animate({opacity:1},100);
		});
		
		$(this).on('mouseleave', function(){
			$(this).find(' .section1ButtonBG').css({display:'none'});
			$(this).find(' .section1Button').css({opacity:0})
//			$(this).find(' .section1Button').animate({opacity:0},200);
		});
        
    });
	
});