// JavaScript Document

$(function(){
	
	var $section1=$('#section1');
	var $section1_box2=$('.section1_box2');
	var $objectList=$('.objectList');
	var itemNumber=$('.best_Item').length;

	
	function listsize(){
		var section1Height=0;
		var section1_box2Height=0;
		var objectListHeight=0;
	
		if($section1.width()>1020){
			if((itemNumber%4)==0){
				objectListHeight=Math.floor(itemNumber/4)*470;
			}
			else{
				objectListHeight=(Math.floor(itemNumber/4)+1)*470;
			}
		}
		else if($section1.width()<1020){
			if((itemNumber%4)==0){
				objectListHeight=Math.floor(itemNumber/2)*305;
			}
			else{
				objectListHeight=(Math.floor(itemNumber/2)+1)*305;
			}
		}
	
		section1Height=440+$('.section1_box1').height()+objectListHeight;
		section1_box2Height=45+objectListHeight;
	
	
		$section1.css({height:section1Height+""});
		$section1_box2.css({height:section1_box2Height+""});
		$objectList.css({height:objectListHeight+""});
	}
	
	
	var $section1_box1=$('.section1_box1');
	var $box1_icon=$('.box1_icon');
	$section1_box1.on('mouseover', function(){
		$('.box1_fiter').stop(true).animate({opacity:0.6},500);
		$('.box1_iconCover').stop(true).css({display:"block"}).delay(600).animate({opacity:1},200);
		$box1_icon.on('click', function(){
			$('#showRoomDetail').css({display:'block'});
		});
	});
	$section1_box1.on('mouseleave', function(){
		$('.box1_iconCover').stop(true).css({display:"none"}).animate({opacity:0},1);
		$('.box1_fiter').stop(true).animate({opacity:0},500);
	});
	
	var $best_Item=$('.best_Item');
	$best_Item.each(function(index, element) {
        $(this).on('mouseover' ,function(){
			$(this).addClass('best_Itemover');
			$(this).find(' .best_Info').css({display:'none'});
			$(this).find(' .best_choice').css({display:'block'});

			var $best_button=$(this).find(' .best_button');
			$best_button.each(function(index, element) {
                $(this).on('mouseover' ,function(){
					$(this).addClass('best_buttonChoice');
					$(this).find(' .best_buttonCBG').css({display:'block'});
				});
            });
			var $best_button=$(this).find(' .best_button');
			$best_button.each(function(index, element) {
                $(this).on('mouseleave' ,function(){
					$(this).removeClass('best_buttonChoice');
					$(this).find(' .best_buttonCBG').css({display:'none'});
				});
            });

		});
    });
	$best_Item.each(function(index, element) {
        $(this).on('mouseleave' ,function(){
			$(this).removeClass('best_Itemover');
			$(this).find(' .best_Info').css({display:'block'});
			$(this).find(' .best_choice').css({display:'none'});
		});
    });
	
	
	
	var $showRoomDetailImage=$('.showRoomDetailImage');
	
	function detailImageSize(){
		var detailImageHeight=0;
		detailImageHeight=$(window).width()*0.8*0.54;
		$showRoomDetailImage.css({height:detailImageHeight+"px"});
	}
	
	function detailCenter(){
	var DetailMarginT=($(window).height()-$showRoomDetailImage.height())/2;
	$showRoomDetailImage.css({marginTop:DetailMarginT+"px"});
	}
	
	var $showRoomDetail_closeB=$('.showRoomDetail_closeB');
	$showRoomDetail_closeB.on('click', function(){
		$('#showRoomDetail').css({display:'none'});
	});
	

	
	var $showRoomDetail_item=$('.showRoomDetail_item');
	
	var i=new Array();
		
	i.length=$showRoomDetail_item.length;
	for(var y=0; y<i.length; y++){
		i[y]=0;
	}
	
	
	$showRoomDetail_item.each(function(index, element) {
		var innerindex=index;
		
		$(this).on('click', function(){
			if(i[innerindex]==0){
			$(this).find(' .showRoomDetail_pluseB').addClass('Active-on');
			$(this).find(' .Detail_infoBoxborder').css({display:"block"}).animate({width:"205px"},500);
			$(this).find(' .Detail_infoBoxCover').delay(500).css({display:"block"}).animate({height:"100%"},500);
			i[innerindex]=1;
			}
			
			else if(i[innerindex]==1){
				$(this).find(' .Detail_infoBoxborder').css({display:"none",width:0});
				$(this).find(' .Detail_infoBoxCover').css({display:"none",height:0});
				$(this).find(' .showRoomDetail_pluseB').removeClass('Active-on');
				i[innerindex]=0;
			}
			
			var $Detail_button=$(this).find(' .Detail_button');
			$Detail_button.each(function(index, element) {
                $(this).on('mouseover' ,function(){
					$(this).addClass('Detail_buttonChoice');
					$(this).find(' .Detail_buttonCBG').css({display:'block'});
				});
            });
			
			$Detail_button.each(function(index, element) {
                $(this).on('mouseleave' ,function(){
					$(this).removeClass('Detail_buttonChoice');
					$(this).find(' .Detail_buttonCBG').css({display:'none'});
				});
            });
			
		});
		
    });
	
	
	
	
	$(window).resize(function(){
		listsize();
		detailImageSize();
		detailCenter()
	});
	
	
	
	
	$(window).trigger('resize');
	
	
	
	
	
});