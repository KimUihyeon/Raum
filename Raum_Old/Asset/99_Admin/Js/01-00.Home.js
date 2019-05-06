// JavaScript Document

$(function(){
	
	/*HOME*/
	/*HOME*/
	/*HOME*/
	/*HOME*/
	window.onload = function(){	
		AminiateHome();
	};
	
	function AminiateHome(){
		var Currentindex_item = 0,
			ItemLength=$('.InnerItem').length;
		var goInterval_item = setInterval(function(){
			$('.InnerItem').find('.EfectItem').eq(Currentindex_item).removeClass('Active_Item');
			if(Currentindex_item>ItemLength){clearInterval(goInterval_item);}
			Currentindex_item++;
			},100);
			
		var Currentindex_Best = -10 ,
			BestLength = $('.BestLine').length;
		var goInterval_Best =setInterval(function(){
			$('.BestLine').find('.BestInnerLine').eq(Currentindex_Best).removeClass('Active_Best');
			if(Currentindex_Best>BestLength){clearInterval(goInterval_Best);}
			Currentindex_Best++;
		},300);
		
		
		$('.Bg,.Event,.Key').each(function(index, element) {
			var Speed = 300;
            $(this).hover(
				function(){
					$(this).find(' .RelFillter').animate({opacity:1},Speed);
				},
				function(){
					$(this).find(' .RelFillter').animate({opacity:0},Speed);
				}
			);
        });
		
		
	}
		$('.Inner3Efect').delay(1500).animate({left:0+'px',opacity:1},1000);
		
	function CssEdit(){
		$('.Left,.Right').css({overflow:'hidden',height:1300+'px'});
	}
	CssEdit();
	
});