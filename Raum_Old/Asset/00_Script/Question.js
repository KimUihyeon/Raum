// JavaScript Document
$(function(){
  var $inputItem = $('.input1');
  $inputItem.each(function(index){
    $(this).on('click',function(){
      $inputItem.removeClass('input-Active');
      $(this).addClass('input-Active');
    });
  });
  
  var $input_1 = $('.input_1');
  $input_1.each(function(index, element) {
    $(this).on('click',function(){
	  	$input_1.removeClass('input-Active');
		$(this).addClass('input-Active');
	  });
	});
	
	$input_1.eq(0).trigger('click');
	$input_1.eq(0).focus();
	
	$(window).resize(function(){
		
		var _height=$(this).height() *0.5;
		var margin =_height/13;
		if($(this).height()>700){
			_height=$(this).height() *0.4;
			margin =_height/9;
		}
		
		$('.NextBox').css({height:_height+'px'});		
		$('.NextTitle').css({lineHeight:$('.NextTitle').height()+'px'});
		$('.input2').css({marginTop:margin+'px'});
		$('.NextText').css({paddingBottom:margin+'px'});
	});
	$(window).trigger('resize');
	
	
		
	$('.input-Section4 .input2:nth-child(2)').on('click',function(){
		var Counting=0;
		if($('.name').val().length<2){
			alert("이름은 2자 이상입니다.");
			$('.name').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.name').val().length>8){
			alert("이름은 8자 미만입니다.");
			$('.name').focus();
			return false;
		}
		
		else{
			Counting+=1;
		}
		
		
		
		if($('.id').val().length<3){
			alert("아이디는 3자 이상입니다.");
			$('.id').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.id').val().length>14){
			alert("아이디은 14자 미만입니다.");
			$('.id').focus();
			return false;
		}
		
		else{
			Counting+=1;
		}
		
		
		if($('.title').val().length<3){
			alert("제목은 3글자 이상입니다 입력해주세요");
			$('.title').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.title').val().length>35){
			alert("제목은은 35자 미만입니다.");
			$('.title').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		
		
		
		if($('.textarea').val().length<3){
			alert("내용은 4자 이상입니다.");
			$('.textarea').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.textarea').val().length>1500){
			alert("내용은 1500자 미만입니다.");
			$('.textarea').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		
		if(Counting>=8){
			$('.NextPage').css({display:'block',zIndex:99});
			$(window).trigger('resize');
		}
	});
	
	$('.prev').on('click',function(){
		$('.NextPage').css({display:'none',zIndex:-2});
		$(window).trigger('resize');
	});
	
	
	
	
	$('.name').val()="";
	$('.id').val()="";
	$('.title').val()="";
	$('.textarea').val()="";
	
	
});
