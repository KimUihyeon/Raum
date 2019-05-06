// JavaScript Document
$(function(){
	var $inputText=$('.inputText');
	
	
	var $IDfindfrom=$('.section1_box:nth-child(1)');
	var $PWfindfrom=$('.section1_box:nth-child(2)');
	
	var $IDfindButton=$IDfindfrom.find(' .findButton');
	var $PWfindButton=$PWfindfrom.find(' .findButton');
	
	
	$IDfindButton.on('click' ,function(){
		if($IDfindfrom.find(' .inputBox:nth-child(1) .inputText').val()==""||$IDfindfrom.find(' .inputBox:nth-child(2) .inputText').val()==""){
			$IDfindfrom.find(' .warning_icon').css({display:'block'});
			$IDfindfrom.find(' .section1_coment').css({color:'#F30'});
			
			if($IDfindfrom.find(' .inputBox:nth-child(1) .inputText').val()==""){
				$IDfindfrom.find(' .section1_coment').html('이름을 입력해주세요.');
				$IDfindfrom.find(' .inputBox:nth-child(1) .inputText').focus();
			}
			
			if($IDfindfrom.find(' .inputBox:nth-child(2) .inputText').val()==""){
				$IDfindfrom.find(' .section1_coment').html('이메일을 입력해주세요.');
				$IDfindfrom.find(' .inputBox:nth-child(2) .inputText').focus();
			}
			return false;
		}
		
		if($IDfindfrom.find(' .inputBox:nth-child(1) .inputText').val()!=""&&$IDfindfrom.find(' .inputBox:nth-child(2) .inputText').val()!=""){
			$IDfindfrom.find(' .warning_icon').css({display:'none'});
			$IDfindfrom.find(' .section1_coment').css({color:'#999'});
			$IDfindfrom.find(' .section1_coment').html('이름과 이메일을 입력해주세요.');
			return true;
		}
	});
	
	$PWfindButton.on('click' ,function(){
		if($PWfindfrom.find(' .inputBox:nth-child(1) .inputText').val()==""||$PWfindfrom.find(' .inputBox:nth-child(2) .inputText').val()==""||$PWfindfrom.find(' .inputBox:nth-child(3) .inputText').val()==""){
			$PWfindfrom.find(' .warning_icon').css({display:'block'});
			$PWfindfrom.find(' .section1_coment').css({color:'#F30'});
			
			if($PWfindfrom.find(' .inputBox:nth-child(1) .inputText').val()==""){
				$PWfindfrom.find(' .section1_coment').html('이름을 입력해주세요.');
				$PWfindfrom.find(' .inputBox:nth-child(1) .inputText').focus();
			}
			
			if($PWfindfrom.find(' .inputBox:nth-child(2) .inputText').val()==""){
				$PWfindfrom.find(' .section1_coment').html('아이디을 입력해주세요.');
				$PWfindfrom.find(' .inputBox:nth-child(2) .inputText').focus();
			}
			
			if($PWfindfrom.find(' .inputBox:nth-child(3) .inputText').val()==""){
				$PWfindfrom.find(' .section1_coment').html('이메일을 입력해주세요.');
				$PWfindfrom.find(' .inputBox:nth-child(3) .inputText').focus();
			}
			return false;
			
		}
		
		if($PWfindfrom.find(' .inputBox:nth-child(1) .inputText').val()!=""&&$PWfindfrom.find(' .inputBox:nth-child(2) .inputText').val()!=""&&$PWfindfrom.find(' .inputBox:nth-child(3) .inputText').val()!=""){
			$PWfindfrom.find(' .warning_icon').css({display:'none'});
			$PWfindfrom.find(' .section1_coment').css({color:'#999'});
			$PWfindfrom.find(' .section1_coment').html('이름과 아이디, 이메일을 입력해주세요.');
		}
	});
	
	
});