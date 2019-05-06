// JavaScript Document

$(function(){
	var $simpleInfo_cartButton=$('.simpleInfo_cartButton');
	$simpleInfo_cartButton.on('click', function(){
		$('.cart_popUpBox').css({display:'block'});
	});
	
	var $cart_popUpCloseB=$('.cart_popUpCloseB');
	$cart_popUpCloseB.on('click', function(){
		$('.cart_popUpBox').css({display:'none'});
	});
	
	
	function PopUpCenter(){
	var PopUpMarginT=($(window).height()-$('.PopUpWindow').height())/2;
	$('.PopUpWindow').css({marginTop:PopUpMarginT+"px"});
	}

	$('.WishList').on('click',function(){
		function WishAdd(No){
			alert("123");
	        $.ajax({
		        url:'./time.php',
	            success:function(data){
			        $('#time').append(data);
		        }
	        })
		}
	});/*

	function Size(){
		var _a= $('.ItemRaum').height();
		var _b = $('.intro-3D').height();
		var _c = $('.objectInfoBox').height();
		var _height = _a+_b+_c+320;
		$('.section1_box2').css({height:_height});

		console.log("≥Ù¿Ãø©" +$('.section1_box2').height());
	}
	Size();

	*/
	$(window).resize(function(){
		PopUpCenter();
	//	Size();
	});
	
	
	$(window).trigger('resize');
	
	var $reviewAllButton=$('.reviewAllButton');
	var $reviewAllPopUpCloseB=$('#reviewAllPopUp').find(' .PopUpCloseB');
	var $reviewWrite=$('.reviewWrite');
	var $reviewWritePopUpCloseB=$('#reviewWritePopUp').find(' .PopUpCloseB');
	
	$reviewAllButton.on('click', function(){
		$('#reviewAllPopUp').css({display:'block'});
	});
	$reviewAllPopUpCloseB.on('click', function(){
		$('#reviewAllPopUp').css({display:'none'});
	});
	
	$reviewWrite.on('click', function(){
		$('#reviewWritePopUp').css({display:'block'});
	});
	$reviewWritePopUpCloseB.on('click', function(){
		$('#reviewWritePopUp').css({display:'none'});
	});
	
	$('#reviewWritePopUp').css({display:'none'});

	
	
	
	
	
	
	//$('#spinner').spinner({stap:1});
});