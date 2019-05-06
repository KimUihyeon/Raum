// JavaScript Document
$(function(){
	$(window).resize(function(){
		slideSize();
		
		var Interval_sw= 0;
		var GoInterval= setInterval(function(){
		
			slideSize();		
			if(Interval_sw>5){
			clearInterval(GoInterval);
			};
		
			Interval_sw++;
		},50);
	});
	
	
	function slideSize(){
		var S_Height= $('.sampleSlide_Box').width()*0.39;
		$('.sampleSlide_Box').css({height:S_Height+'px'});
		
		var C_height = $('.level2-icon').width()*0.64;
		$('.level2-icon').css({height:C_height+'px'});
		
		
		var fullwidth = $('.level3').width();
		var width_1 = $('.step_container').width();
		
		var textureW =$('.texture').width(); //텍스쳐
		
		
		if($(window).width()>766){
			$('.contants_container').css({width:fullwidth-width_1-2+'px'});	
//			$('.texture').css({height:textureW+'px'});
			$('.textureFillter').css({paddingTop:textureW/3+'px'});
			$('.sub2 .Label_box').css({height:2*textureW+'px'});
			$('.sub2').height()
		}
		else if($(window).width()<=766){
			$('.contants_container').css({width:$(window).width()*0.9+'px'});
			//$('.texture').css({height:textureW+'px'});
			$('.textureFillter').css({paddingTop:textureW/4+'px'});
			$('.sub2 .Label_box').css({height:3*textureW+'px'});
		}
	}
	slideSize();
	
	//setInterval(function(){slideSize();},100);
	
	
	$('.sample').each(function(index, element) {
        $(this).on('click',function(){
			var crrentIndex = index;
			$('.slide_controller').animate({left:-index*100+'%'},500);
		});
    });
	
	$('.texture').each(function(index, element) {
        $(this).on('mouseenter',function(){
			$(this).find(' .textureFillter').removeClass('active-fillter');
		});
		$(this).on('mouseleave',function(){
			$(this).find(' .textureFillter').addClass('active-fillter');
		});
    });
	
});
