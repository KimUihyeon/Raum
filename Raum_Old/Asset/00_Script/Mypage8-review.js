// JavaScript Document
$(function(){
	var $section1=$('#section1');
	var $section1Box=$('.section1Box');
	var reviewItemNumber=$('.reviewItem').length;
	var WriteItemNumber=$('.reviewWriteItem').length;
	var i=0;
	function listsize(){
		var section1Height=0;
		var section1BoxHeight=0;
		var itemListHeight=0;
		
		if(i==0){
			itemListHeight=reviewItemNumber*180;
		
			section1BoxHeight=20+itemListHeight;
			section1Height=275+section1BoxHeight;
	
	
			$section1.css({height:section1Height+""});
			$section1Box.css({height:section1BoxHeight+""});
		}
		
		else if(i==1){
			if($section1.width()>1020){
				if((WriteItemNumber%4)==0){
					itemListHeight=Math.floor(WriteItemNumber/4)*490;
				}
				else{
					itemListHeight=(Math.floor(WriteItemNumber/4)+1)*490;
				}
			}
			else if($section1.width()<1020){
				if((WriteItemNumber%4)==0){
					itemListHeight=Math.floor(WriteItemNumber/2)*325;
				}
				else{
					itemListHeight=(Math.floor(WriteItemNumber/2)+1)*325;
				}
			}
		
			section1BoxHeight=40+itemListHeight;
			section1Height=275+section1BoxHeight;
	
	
			$section1.css({height:section1Height+""});
			$section1Box.css({height:section1BoxHeight+""});
		}
	}
	
	var $tapTitle1=$('.tapTitle1');
	var $tapTitle2=$('.tapTitle2');
	
	$tapTitle1.addClass('tapOn');
	$('.tapBox1').css({display:'block'});
	$('.tapBox2').css({display:'none'});
		
	$tapTitle1.on('click', function(){
		$tapTitle1.addClass('tapOn');
		$tapTitle2.removeClass('tapOn');
		$('.tapBox1').css({display:'block'});
		$('.tapBox2').css({display:'none'});
		i=0;
		listsize();
	});
	$tapTitle2.on('click', function(){
		$tapTitle2.addClass('tapOn');
		$tapTitle1.removeClass('tapOn');
		$('.tapBox2').css({display:'block'});
		$('.tapBox1').css({display:'none'});
		i=1;
		listsize();
	});
	
	
	var $reviewWriteItem=$('.reviewWriteItem');
	$reviewWriteItem.each(function(index, element) {
        $(this).on('mouseover', function(){
			$(this).addClass('Itemover');
			$(this).find(' .reviewWriteB').addClass('reviewWriteBover');
			
		});
		$(this).on('mouseleave', function(){
			$(this).removeClass('Itemover');
			$(this).find(' .reviewWriteB').removeClass('reviewWriteBover');
		});
    });
	
	
	
	$(window).resize(function(){
		listsize();
	});
	
	
	
	
	$(window).trigger('resize');
	
	
});