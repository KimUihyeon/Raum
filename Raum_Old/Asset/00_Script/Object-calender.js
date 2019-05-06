// JavaScript Document
$(function(){
	
	var $section1=$('#section1');
	var $exposureTypeSelect=$('#exposureTypeSelect');
	var $section1_box2=$('.section1_box2');
	var itemNumber=$('.object_Item').length;
	
	//몇개정렬인지 구별하는거
	/*	if($exposureTypeSelect.val()==8){
			if(itemNumber>8){
			}
			else if(itemNumber<8){
			}
		}
		if($exposureTypeSelect.val()==12){
		}
		if($exposureTypeSelect.val()==16){
		}
		if($exposureTypeSelect.val()==20){
		}*/
		
	function listsize(){
		var section1Height=0;
		var section1_box2Height=0;
		
		if($section1.width()>1020){
			if((itemNumber%4)==0){
				objectListHeight=Math.floor(itemNumber/4)*500;
			}
			else{
				objectListHeight=(Math.floor(itemNumber/4)+1)*500;
			}
		}
		else if($section1.width()<1020){
			if((itemNumber%4)==0){
				objectListHeight=Math.floor(itemNumber/2)*335;
			}
			else{
				objectListHeight=(Math.floor(itemNumber/2)+1)*335;
			}
		}
	
		section1Height=415+objectListHeight;
		section1_box2Height=65+objectListHeight;
	
	
		$section1.css({height:section1Height+""});
		$section1_box2.css({height:section1_box2Height+""});
	}
	
	var $object_Item=$('.object_Item');
	$object_Item.each(function(index, element) {
        $(this).on('mouseover' ,function(){
			$(this).addClass('object_Itemover');
			$(this).find(' .object_Info').css({display:'none'});
			$(this).find(' .object_choice').css({display:'block'});

			var $object_button=$(this).find(' .object_button');
			$object_button.each(function(index, element) {
                $(this).on('mouseover' ,function(){
					$(this).addClass('object_buttonChoice');
					$(this).find(' .object_buttonCBG').css({display:'block'});
				});
            });
			var $object_button=$(this).find(' .object_button');
			$object_button.each(function(index, element) {
                $(this).on('mouseleave' ,function(){
					$(this).removeClass('object_buttonChoice');
					$(this).find(' .object_buttonCBG').css({display:'none'});
				});
            });

		});
    });
	$object_Item.each(function(index, element) {
        $(this).on('mouseleave' ,function(){
			$(this).removeClass('object_Itemover');
			$(this).find(' .object_Info').css({display:'block'});
			$(this).find(' .object_choice').css({display:'none'});
		});
    });

		
	$(window).resize(function(){
		listsize();
	});
	
	
	
	
	$(window).trigger('resize');
	
});