// JavaScript Document
$(function(){
	
	
	var $section1=$('#section1');
	var $section1_box3=$('.section1_box3');
	var orderItemNumber=$('.orderItem').length;
	
	
	var section1Height=0;
	var section1_box3Height=0;
	var itemListHeight=0;
		
	itemListHeight=orderItemNumber*120;
		
	section1_box3Height=60+itemListHeight;
	section1Height=1620+section1_box3Height;
	
	$section1.css({height:section1Height+""});
	$section1_box3.css({height:section1_box3Height+""});
		
	
});