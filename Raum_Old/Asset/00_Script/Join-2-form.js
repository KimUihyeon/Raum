// JavaScript Document
var bool =false;
$(function(){
	var $input=$('input');
	$input.val("");
	$('.section1_doubleCheckB').val("중복확인");
	$('.section1_postNumberB').val("우편번호찾기");
	$('.section1_button:nth-child(1)').val("취소");
	$('.section1_button:nth-child(2)').val("가입하기");
	
	
	
	
	var $section1_button=$('.section1_button');
	$section1_button.each(function(index, element) {
        $(this).on('mouseover', function(){
			$(this).addClass('section1_buttonActive');
		});
		$(this).on('mouseleave', function(){
			$(this).removeClass('section1_buttonActive');
		});
    });
	
	var $joinB=$('.section1_button');
	var $warning_icon=$('.warning_icon');
	var $warning_coment=$('.section1_coment');
	$joinB.on('click', function(){
		if($('.IDinput').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("ID를 입력해주세요");
			$('.IDinput').focus();
			return false;
		}
		if($('.PwInput').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("비밀번호를 입력해주세요");
			$('.PwInput').focus();
			return false;
		}
		if($('.PwReInput').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("비밀번호 확인창을 입력해주세요");
			$('.PwReInput').focus();
			return false;
		}
		
		if($('.PwInput').val()!=$('.PwReInput').val()){
			$warning_icon.css({display:'block'});
			$warning_coment.html("비밀번호가 일치하지 않습니다");
			$('.PwReInput').val("");
			$('.PwReInput').focus();
			return false;
		}
		
		if($('.NameInput').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("이름을 입력해주세요");
			$('.NameInput').focus();
			return false;
		}
		
		if($('.PhonInput1').val()==""||$('.PhonInput2').val()==""||$('.PhonInput2').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("휴대폰 번호를 입력해주세요");
			if($('.PhonInput1').val()==""){
				$('.PhonInput1').focus();
			}
			if($('.PhonInput2').val()==""){
				$('.PhonInput2').focus();
			}
			if($('.PhonInput3').val()==""){
				$('.PhonInput3').focus();
			}
			
			return false;
		}
		
		
		if($('.AdressInput1').val()==""||$('.AdressInput2').val()==""||$('.AdressInput3').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("주소를 입력해주세요");
			if($('.AdressInput1').val()==""){
				$('.AdressInput1').focus();
			}
			if($('.AdressInput2').val()==""){
				$('.AdressInput2').focus();
			}
			if($('.AdressInput3').val()==""){
				$('.AdressInput3').focus();
			}
			
			return false;
		}
		
		
		if($('.EmailInput1').val()==""||$('.EmailInput2').val()==""){
			$warning_icon.css({display:'block'});
			$warning_coment.html("ID를 입력해주세요");
			if($('.EmailInput1').val()==""){
				$('.EmailInput1').focus();
			}
			if($('.EmailInput2').val()==""){
				$('.EmailInput2').focus();
			}
			
			return false;
		}

		if(bool==false){
			$warning_icon.css({display:'block'});
			$warning_coment.html("중복확인을 해주세요");
			return false;
		}
	});
	
	//핸드폰번호 숫자만 입력받게
	$('.PhonInput1').keypress(function(event){
		if(event.which&&(event.which<=47||event.which>=58)&&event.which!=8){
			event.preventDefault();
		}
	});
	$('.PhonInput2').keypress(function(event){
		if(event.which&&(event.which<=47||event.which>=58)&&event.which!=8){
			event.preventDefault();
		}
	});
	$('.PhonInput3').keypress(function(event){
		if(event.which&&(event.which<=47||event.which>=58)&&event.which!=8){
			event.preventDefault();
		}
	});
	
	$('.AdressInput1').keypress(function(event){
		if(event.which&&(event.which<=47||event.which>=58)&&event.which!=8){
			event.preventDefault();
		}
	});
	
	
});