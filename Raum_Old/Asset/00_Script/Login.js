// JavaScript Document
$(function(){
	var $inputText=$('.inputText');
	$inputText.val("");
	var $loginButton=$('.loginButton');
	
	$loginButton.on('click', function(){
		if($('.inputBox:nth-child(2) .inputText').val()==""){
			$('.inputBox:nth-child(2) .inputText').focus();
			$('.warning_icon').css({display:"block"});
			$('.section1_loginMent').html("ID를 입력해주세요");
			$('.section1_loginMent').css({color:"#F30"});
			return false;
		}
		if($('.inputBox:nth-child(3) .inputText').val()==""){
			$('.inputBox:nth-child(3) .inputText').focus();
			$('.warning_icon').css({display:"block"});
			$('.section1_loginMent').html("PW를 입력해주세요");
			$('.section1_loginMent').css({color:"#F30"});
			return false;
		}
	});
});