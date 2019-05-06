// JavaScript Document
$(function(){
	
	/*마이페이지*/
	
	section_H = $('.tableBox tr').length * 40 + 1000;
	$('#section1').css({height:section_H+'px'});
	
	$('.clickTr').each(function(index, element) {
        $(this).on('click',function(){
			$('.ActiveTr').addClass('targetTr');
			$('.ActiveTr').eq(index).removeClass('targetTr');
		});
    });
	
	
	/*갯수 카운트다운*/
	var ArrayCount = new Array();
	var ArrayBool = new Array();
	var CountQty = $('.table1 tr').length;
	for(var i= 0 ; i<CountQty; i++){
		if(i!=0){
			ArrayCount[i] = $('.table1 tr').eq(i).find(' .countText').val();
			ArrayBool[i]=true;
			if(ArrayCount[i]==1){
				console.log(ArrayCount[i]);
				ArrayBool[i]=false;
				$('.table1 tr').eq(i).find(' .TableArrowDown').animate({opacity:0.3},500);
			}
		}
		else{}
	}
	$('tr').each(function(index, element) {
		var $Target = $(this);
        $(this).find(' .TableArrowUp').on('click',function(){
			ArrayCount[index]= parseInt(ArrayCount[index]) + 1;
			$Target.find('.countText').val(ArrayCount[index])
			ArrayBool[index]=true;
			$Target.find('.TableArrowDown').css({opacity:1});
		});
        $(this).find(' .TableArrowDown').on('click',function(){
			if(ArrayBool[index]){
				ArrayCount[index]= parseInt(ArrayCount[index]) - 1;
				if(ArrayCount[index]==1){
					ArrayBool[index]=false;
					$(this).animate({opacity:0.3},500);
				}
				$Target.find('.countText').val(ArrayCount[index]);
			}
		});
    });
});