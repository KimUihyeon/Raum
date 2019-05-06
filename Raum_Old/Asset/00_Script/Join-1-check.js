// JavaScript Document
$(function(){
	$(".chkBox").prop("checked", false);
	/*document.getElementById("chkBox").checked = false;
	document.getElementsByClassName("chkBox").checked=false;*/
	
	var $section1_button=$('.section1_button');
	$section1_button.each(function(index, element) {
        $(this).on('mouseover', function(){
			$(this).addClass('section1_buttonActive');
		});
		$(this).on('mouseleave', function(){
			$(this).removeClass('section1_buttonActive');
		});
    });
	
	var $agreeButton=$('.section1_button:nth-child(2)');
	var $checkingComent=$('.checkingComent');
	$agreeButton.on('click', function(){
		if(document.getElementsByName("TermsOfUse").checked==false||document.getElementsByName("personalInfo").checked==false||document.getElementsByName("ElectronicPayment").checked==false){
			
			$checkingComent.css({opacity:'1'});
			return false;
		}
	});
	
	
	$(this).is(":checked")
	
	$('.submit').on('click',function(){
		if($('.ck1').is(':checked')==false){
			alert("약관에 동의해주세요.")
			return false;
		}
		if($('.ck2').is(':checked')==false){
			alert("약관에 동의해주세요.")
			return false;
		}
		if($('.ck3').is(':checked')==false){
			alert("약관에 동의해주세요.")
			return false;
		}
	});
});