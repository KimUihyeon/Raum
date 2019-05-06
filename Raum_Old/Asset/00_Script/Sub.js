// JavaScript Document
$(function(){
	function subKeyStart(){
		var $subKey = $('#keyContainer');
		$subKey.animate({opacity:1},500,'easeInOutExpo');
	}
	subKeyStart();
	
	$('.moveButton').on('click',function(){
		var NextPage = $('#mypageSelect').val();
		var URLString = "";
		switch(NextPage){
			case 'mypageCenter' : URLString="11_mypage.jsp"; break;
			case 'profile' : URLString="11_mypage1-profile-1.jsp"; break;
			case 'order' : URLString="11_mypage2-order-1.jsp"; break;
			
			case 'cart' : URLString="11_mypage3-cart.jsp"; break;
			case 'wishlist' : URLString="11_mypage4-wishlist.jsp"; break;
			
			case 'contanct' : URLString="11_mypage5-contact-1.jsp"; break;
			case 'inquiry' : URLString="11_mypage6-1to1.jsp"; break;
			case 'AS' : URLString="11_mypage7-As-1.jsp"; break;
			
			case 'review' : URLString="11_mypage8-review.jsp"; break;
		}
		location.href=URLString;
	});
	
});