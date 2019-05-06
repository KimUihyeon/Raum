// JavaScript Document
$(function(){
  var $inputItem = $('.input1');
  $inputItem.each(function(index){
    $(this).on('click',function(){
      $inputItem.removeClass('input-Active');
      $(this).addClass('input-Active');
    });
  });
  
  var fileTarget = $('#file');
  fileTarget.on('change', function(){ // 값이 변경되면
  if(window.FileReader){ // modern browser
  	var filename = $(this)[0].files[0].name; }
	else { // old IE
	var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	 } // 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename); });
	
	
	
	$(window).resize(function(){
		
		var _height=$(this).height() *0.5;
		if($(this).width()>1000){
			_height=$(this).height() *0.4;
		}
		$('.NextBox').css({height:_height+'px'});		
		$('.NextTitle').css({lineHeight:$('.NextTitle').height()+'px'});
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
		
		if($('.id').val().length<4){
			alert("아이디는 4자 이상입니다.");
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
		
		
		
		if($('.tel').val().length<7){
			alert("연락처는 7자 이상입니다.");
			$('.tel').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.tel').val().length>20){
			alert("연락처는 20자 미만입니다.");
			$('.tel').focus();
			return false;
		}
		
		else{
			Counting+=1;
		}
		
		
		
		
		if($('.add').val().length<5){
			alert("주소는 5자 이상입니다.");
			$('.add').focus();
			return false;
		}
		else{
			Counting+=1;
		}
		if($('.add').val().length>35){
			alert("주소는 35자 미만입니다.");
			$('.add').focus();
			return false;
		}
		
		else{
			Counting+=1;
		}
		
		
		if($('.title').val().length<2){
			alert("제목은 2글자 이상입니다 입력해주세요");
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
			alert("내용은 3자 이상입니다.");
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
		if(Counting>=11){
			$('.NextPage').css({display:'block',zIndex:99});
			$(window).trigger('resize');
		}
	});
	
	$('.prev').on('click',function(){
		$('.NextPage').css({display:'none',zIndex:-2});
		$(window).trigger('resize');
	});
	
	
});
