// JavaScript Document
$(function(){
	window.onload = function(){	
	
		setInterval(function(){ItemSize();},200);
		
		var offset = $('.section').offset();
		$('html, body').delay(500).animate({scrollTop : offset.top-30}, 300);
	};
	
	
	/*공용*/
	/*공용*/
	/*공용*/
	ItemSize();
	
	function ItemSize(){
		var WindowsWidth = $(window).width(),
			WindowsHeight = $(window).height(),
			RightWidth = WindowsWidth - $('.Left').width() ;
				
			
		
		document.getElementById('wrap').style.width=WindowsWidth+'px';
		$('.Right').css({width:RightWidth+'px'});
	};


	$('.submenu').each(function(index, element) {
        $(this).hover(
			function(){
				$(this).find('.hoverMenu').removeClass('hover_active');},
			function(){
				$(this).find('.hoverMenu').addClass('hover_active');}
			);
		
   	});
	$('.logoutBox').hover(
		function(){$(this).animate({backgroundColor:"#bf9493"});},
		function(){$(this).animate({backgroundColor:"#f1f1f1"});}
	);
	
});