// JavaScript Document
$(function(){
	
	var $profileChangeB=$('.profileChangeB');
	var $pwChangeB=$('.pwChangeB');
	var $leaveMemershipB=$('.leaveMemershipB');
	var $warning_icon1=$('.mentBox1 .warning_icon');
	var $warning_coment1=$('.mentBox1 .warning_coment');
	var $warning_icon2=$('.mentBox2 .warning_icon');
	var $warning_coment2=$('.mentBox2 .warning_coment');
	
	$profileChangeB.on('click', function(){
		if($('.IDinput').val()==""){
			$warning_icon1.css({display:'block'});
			$warning_coment1.html("ID를 입력해주세요");
			$('.IDinput').focus();
			return false;
		}
		
		if($('.NameInput').val()==""){
			$warning_icon1.css({display:'block'});
			$warning_coment1.html("이름을 입력해주세요");
			$('.NameInput').focus();
			return false;
		}
		
		if($('.PhonInput1').val()==""||$('.PhonInput2').val()==""||$('.PhonInput2').val()==""){
			$warning_icon1.css({display:'block'});
			$warning_coment1.html("휴대폰 번호를 입력해주세요");
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
			$warning_icon1.css({display:'block'});
			$warning_coment1.html("주소를 입력해주세요");
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
			$warning_icon1.css({display:'block'});
			$warning_coment1.html("ID를 입력해주세요");
			if($('.EmailInput1').val()==""){
				$('.EmailInput1').focus();
			}
			if($('.EmailInput2').val()==""){
				$('.EmailInput2').focus();
			}
			
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
	
	
	//INPUT값 초기화
	$('.PwInput').val("");
	$('.NewPwInput').val("");
	$('.NewPwCheckInput').val("");
	$pwChangeB.on('click', function(){
		if($('.PwInput').val()==""){
			$warning_icon2.css({display:'block'});
			$warning_coment2.html("비밀번호를 입력해주세요");
			$('.PwInput').focus();
			return false;
		}
		
		if($('.NewPwInput').val()==""){
			$warning_icon2.css({display:'block'});
			$warning_coment2.html("새 비밀번호를 입력해주세요");
			$('.NewPwInput').focus();
			return false;
		}
		
		if($('.NewPwCheckInput').val()==""){
			$warning_icon2.css({display:'block'});
			$warning_coment2.html("새 비밀번호 확인창을 입력해주세요");
			$('.NewPwCheckInput').focus();
			return false;
		}
		
		if($('.NewPwInput').val()!=$('.NewPwCheckInput').val()){
			$warning_icon2.css({display:'block'});
			$warning_coment2.html("새 비밀번호가 일치하지 않습니다");
			$('.NewPwCheckInput').val("");
			$('.NewPwCheckInput').focus();
			return false;
		}
	});
	
	var $buttonsOn=$('#buttonsOn');
	var $lodingImage=$('.lodingImage');
	
	//우편번호찾는팝업창
	$('.addressSearch').val("");
	var $tap1=$('.tap1');
	var $tap2=$('.tap2');
	
	$tap1.addClass('tapOn');
	$('.tapBox1').css({display:'block'});
	$('.tapBox2').css({display:'none'});
	var $findPostNumberBox=$('.findPostNumberBox');
		
	$tap1.on('click', function(){
		$tap1.addClass('tapOn');
		$tap2.removeClass('tapOn');
		$('.addressSearch').val("");
		$('.PopUpInfoBox3').css({display:'block'});
		$('.PopUpInfoBox2').css({display:'none'});
		/*앤터쳤을때 검색되게만들어야함*/
	});
	$tap2.on('click', function(){
		$tap2.addClass('tapOn');
		$tap1.removeClass('tapOn');
		$('.addressSearch').val("");
		$('.PopUpInfoBox3').css({display:'block'});
		$('.PopUpInfoBox2').css({display:'none'});
		/*앤터쳤을때 검색되게만들어야함*/
	});
	
	//우편번호찾기버튼눌렀을때 우편찾기팝업창나옴
	var $section1_postNumberB=$('.section1_postNumberB');
	$section1_postNumberB.on('click', function(){
		$buttonsOn.css({display:'block'});
		$findPostNumberBox.css({display:'block'});
	});
	//닫기버튼눌렀을때 우편찾기팝업창없어짐
	var $PopUpCloseB=$('.PopUpCloseB');
	$PopUpCloseB.on('click', function(){
		$buttonsOn.css({display:'none'});
		$findPostNumberBox.css({display:'none'});
	});
	
	//로딩창,우편번호창 세로 가운대정렬
	function PopUpCenter(){
	var findPostNumberBoxMarginT=($(window).height()-$('.findPostNumberBox').height())/2;
	$findPostNumberBox.css({marginTop:findPostNumberBoxMarginT+"px"});
	}
	
	$(window).resize(function(){
		PopUpCenter();
	});
	
	$(window).trigger('resize');
});