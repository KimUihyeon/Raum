// JavaScript Document
$(function(){
	/*
	var $section1_textbox1_1=$('.section1_textbox1-1');
	var $section1_textbox1_2=$('.section1_textbox1-2');
	var $section1_textbox1_3=$('.section1_textbox1-3');

	$section1_textbox1_1.find(' .section1_octagon').animate({top:'-85px'},500);
	$section1_textbox1_1.animate({color:'#000'},500);
	$section1_textbox1_2.find(' .section1_octagon').animate({top:'-85px'},500);
	$section1_textbox1_2.animate({color:'#000'},500);
	$section1_textbox1_3.find(' .section1_octagon').animate({top:'-85px'},500);
	$section1_textbox1_3.animate({color:'#000'},500);

	*/


	var $section1_octagon = $('.section1_Innertextbox');
	var $section1_Item = $('.section1_Innertextbox').find(' .section1_octagon');

	$section1_octagon.each(function(index){
		var CurrentIndex = index + 1 ;
		$(this).delay(CurrentIndex*300).animate({top:0+'px',opacity:1},500);
	});

	$(window).resize(function(){
		itemResize();
	});

	function itemResize(){
		var itemHeight =$section1_Item.height();
		$section1_Item.css({lineHeight:itemHeight+'px'});
	}
	itemResize();
});
